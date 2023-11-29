from funcoes_basicas import chatting
from funcoes_basicas import cumprimento, horario_do_dia
from processar_texto import processar_respostas



if __name__=="__main__":

    hora = input("Em que horário você está? ") 
    iniciar_conversa = str(input(cumprimento(hora) + f" Como passou {horario_do_dia(cumprimento(hora))}?"))


    chatting(iniciar_conversa)

    
    # respostas_paciente = [
    #     " não tive febre",
    # ]

    # sintomas_identificados = processar_respostas(respostas_paciente)

    # print("Sintomas identificados:")
    # print(sintomas_identificados)
    
    # print("Registre-se:")
    # nome = str(input("Nome: "))
    # cpf = str(input("CPF: "))
    # prontuario = str(input("Nº prontuario: "))
    # email = str(input("Email: "))
    # senha = str(input("Senha: "))
    # confirma_senha = str(input("Confirme a: "))

