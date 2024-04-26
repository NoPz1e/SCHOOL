def requestServer(task, args=None):
    print(args)

true = True 
false = False # força de hábito
# class carro:
    


stop = false
while stop:
     choice = input("Bem vindo á base de dados de automoveis da Benecar! \n 1. Listar carros \n 2. Pesquisar um carro em especifico")
     if choice == 1:
       requestServer("Listar")
     elif choice == 2:
        marca = input("Insere a marca do carro")
        modelo = input("Insere o modelo do carro")
        requestServer("Procurar", {"Marca": marca, "Modelo": modelo})
    