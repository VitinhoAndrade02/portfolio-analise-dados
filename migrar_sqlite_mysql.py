
import os
import sqlite3

from dotenv import load_dotenv
import mysql.connector


load_dotenv()

CAMINHO_SQLITE = "dados/curso_sql.db"
SCHEMA_MYSQL = "curso_sql"
TAMANHO_LOTE = 1000


def tipo_mysql(tipo_sqlite):
    tipo = (tipo_sqlite or "").upper()

    if "INT" in tipo:
        return "BIGINT"

    if any(item in tipo for item in ("REAL", "FLOA", "DOUB")):
        return "DOUBLE"

    if any(item in tipo for item in ("CHAR", "CLOB", "TEXT", "DATE")):
        return "LONGTEXT"

    if "BLOB" in tipo:
        return "LONGBLOB"

    if "NUM" in tipo or "DEC" in tipo:
        return "DECIMAL(30, 10)"

    return "LONGTEXT"


def migrar():
    sqlite = sqlite3.connect(CAMINHO_SQLITE)
    conexao_mysql = None

    try:
        # Conecta ao MySQL
        conexao_mysql = mysql.connector.connect(
            host=os.getenv("MYSQL_HOST"),
            port=int(os.getenv("MYSQL_PORT", "3306")),
            user=os.getenv("MYSQL_USER"),
            password=os.getenv("MYSQL_PASSWORD"),
            connection_timeout=10,
            use_pure=True,
        )

        cursor_mysql = conexao_mysql.cursor()

        # Cria o banco, caso ainda não exista
        cursor_mysql.execute(
            f"CREATE DATABASE IF NOT EXISTS `{SCHEMA_MYSQL}` "
            "CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci"
        )

        cursor_mysql.execute(f"USE `{SCHEMA_MYSQL}`")

        cursor_sqlite = sqlite.cursor()

        # Localiza as tabelas do SQLite
        tabelas = cursor_sqlite.execute("""
            SELECT name
            FROM sqlite_master
            WHERE type = 'table'
              AND name NOT LIKE 'sqlite_%'
            ORDER BY name
        """).fetchall()

        total_geral = 0

        for (tabela,) in tabelas:
            print(f"\nMigrando tabela: {tabela}")

            # Obtém as colunas da tabela de origem
            colunas = cursor_sqlite.execute(
                f'PRAGMA table_info("{tabela}")'
            ).fetchall()

            definicoes = []

            for coluna in colunas:
                nome_coluna = coluna[1].replace("`", "``")
                tipo_coluna = tipo_mysql(coluna[2])

                definicoes.append(
                    f"`{nome_coluna}` {tipo_coluna}"
                )

            nome_tabela = tabela.replace("`", "``")

            # Cria a tabela no MySQL
            cursor_mysql.execute(
                f"CREATE TABLE IF NOT EXISTS `{nome_tabela}` "
                f"({', '.join(definicoes)})"
            )

            # Conta os registros na origem
            quantidade_origem = cursor_sqlite.execute(
                f'SELECT COUNT(*) FROM "{tabela}"'
            ).fetchone()[0]

            # Verifica se a tabela de destino já possui dados
            cursor_mysql.execute(
                f"SELECT COUNT(*) FROM `{nome_tabela}`"
            )
            quantidade_destino = cursor_mysql.fetchone()[0]

            if quantidade_destino > 0:
                print(
                    f"Tabela ignorada: já contém "
                    f"{quantidade_destino} registros."
                )
                continue

            # Prepara o comando de inserção
            nomes_colunas = ", ".join(
                f"`{coluna[1].replace('`', '``')}`"
                for coluna in colunas
            )

            marcadores = ", ".join(["%s"] * len(colunas))

            comando_insert = (
                f"INSERT INTO `{nome_tabela}` ({nomes_colunas}) "
                f"VALUES ({marcadores})"
            )

            # Lê e insere os registros em lotes
            dados = cursor_sqlite.execute(
                f'SELECT * FROM "{tabela}"'
            )

            total_inserido = 0

            while True:
                lote = dados.fetchmany(TAMANHO_LOTE)

                if not lote:
                    break

                cursor_mysql.executemany(comando_insert, lote)
                conexao_mysql.commit()

                total_inserido += len(lote)

                print(
                    f"Registros processados: "
                    f"{total_inserido}/{quantidade_origem}",
                    end="\r",
                )

            print()

            # Confere os registros no destino
            cursor_mysql.execute(
                f"SELECT COUNT(*) FROM `{nome_tabela}`"
            )
            quantidade_final = cursor_mysql.fetchone()[0]

            print(f"Registros no SQLite: {quantidade_origem}")
            print(f"Registros no MySQL:  {quantidade_final}")

            if quantidade_origem != quantidade_final:
                raise RuntimeError(
                    f"Divergência na tabela {tabela}: "
                    f"SQLite={quantidade_origem}, "
                    f"MySQL={quantidade_final}"
                )

            print("Conferência OK!")
            total_geral += quantidade_final

        print(
            "\nProcessamento finalizado. "
            f"Registros contabilizados: {total_geral}"
        )

    finally:
        sqlite.close()

        if conexao_mysql is not None and conexao_mysql.is_connected():
            conexao_mysql.close()


if __name__ == "__main__":
    migrar()