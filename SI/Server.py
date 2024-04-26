import socket
import mysql.connector as sql

from multiprocessing import Process

true = True 
false = False # força de hábito

conn = sql.
cur = conn.cursor() # O cursor é o que te permite mandar comandos e receber "rows" da base de dados sql

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM) # STREAM = TCP
sock.bind(('',11228))

def displayListaDeCarros(): 
    cur.execute("USING master; SELECT * FROM Carros")
    resultado = cur.fetchall()
    if resultado is None:
        print("Ups! Não nos foi possivel verificar ")
    else:
        print(resultado)

def procuraUmCarro():
    nomedoCarro = input("Qual é a marca do carro?")
    modelodoCarro = input("Qual é o modelo do carro?")
    cur.execute("USING master; SELECT * FROM Carros WHERE Marca = " + nomedoCarro + " AND Modelo = "+ modelodoCarro)
    resultado = cur.fetchall()
    if resultado is None:
        print("Tal carro não existe. Por favor, verifica se inseriste a marca e/ou o modelo certos.")
    else:
        print(resultado)

numeros = {}
tosend = 0
stop = false
while stop == false:
     choice = input("Bem vindo á base de dados de automoveis da Benecar! \n 1. Listar carros \n 2. Pesquisar um carro em especifico")
     if choice == 1:
        displayListaDeCarros()
     elif choice == 2:
       procuraUmCarro()