import mysql.connector

def conectar():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="1234",
        database="RPG"
    )

def cadastrar_aventureiro(sql):
    conexao = conectar()
    cursor = conexao.cursor()
    cursor.execute(sql)
    conexao.commit()
    conexao.close()
    