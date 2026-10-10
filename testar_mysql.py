import os
from dotenv import load_dotenv
import mysql.connector

load_dotenv()

try:
    conexao = mysql.connector.connect(
        host=os.getenv("MYSQL_HOST"),
        port=int(os.getenv("MYSQL_PORT", "3306")),
        user=os.getenv("MYSQL_USER"),
        password=os.getenv("MYSQL_PASSWORD"),
    )

    if conexao.is_connected():
        print("Conexão com MySQL realizada com sucesso!")

    conexao.close()

except mysql.connector.Error as erro:
    print(f"Erro na conexão: {erro}")