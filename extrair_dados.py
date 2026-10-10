import sqlite3

caminho_banco = "dados/curso_sql.db"

conexao = sqlite3.connect(caminho_banco)
cursor = conexao.cursor()

tabelas = cursor.execute("""
    SELECT name
    FROM sqlite_master
    WHERE type = 'table'
    AND name NOT LIKE 'sqlite_%'
    ORDER BY name
""").fetchall()

for (tabela,) in tabelas:
    quantidade = cursor.execute(
        f'SELECT COUNT(*) FROM "{tabela}"'
    ).fetchone()[0]

    print(f"Tabela: {tabela} | Registros: {quantidade}")

    colunas = cursor.execute(
        f'PRAGMA table_info("{tabela}")'
    ).fetchall()

    for coluna in colunas:
        print(f"  - {coluna[1]} ({coluna[2]})")

    print()

conexao.close()