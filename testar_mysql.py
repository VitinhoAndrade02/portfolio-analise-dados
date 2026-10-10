print("O arquivo testar_mysql.py começou a executar!")

import os
from dotenv import load_dotenv
import mysql.connector

load_dotenv()

print("Arquivo .env carregado.")
print("Host configurado:", os.getenv("MYSQL_HOST"))
print("Usuário configurado:", os.getenv("MYSQL_USER"))

try:
    print("Tentando conectar ao MySQL...")

    conexao = mysql.connector.connect(
        host=os.getenv("MYSQL_HOST"),
        port=int(os.getenv("MYSQL_PORT", "3306")),
        user=os.getenv("MYSQL_USER"),
        password=os.getenv("MYSQL_PASSWORD"),
        connection_timeout=5,
        use_pure=True
    )

    print("Conexão com MySQL realizada com sucesso!")
    conexao.close()

except Exception as erro:
    print(f"Erro encontrado: {type(erro).__name__}: {erro}")