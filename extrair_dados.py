
import sqlite3

caminho_banco = "dados/curso_sql.db"

conexao = sqlite3.connect(caminho_banco)
cursor = conexao.cursor()

cursor.execute("""
    SELECT name
    FROM sqlite_master
    WHERE type = 'table'
    ORDER BY name;
""")

tabelas = cursor.fetchall()

print("Tabelas encontradas:\n")

if tabelas:
    for tabela in tabelas:
        print(tabela[0])
else:
    print("Nenhuma tabela encontrada.")

conexao.close()