from processar_texto import processar_respostas



if __name__=="__main__":

    # Exemplo de respostas do paciente
    respostas_paciente = [
        "não está com pus",
    ]

    
    # Processar as respostas do paciente
    sintomas_identificados = processar_respostas(respostas_paciente)

    # Mostrar os sintomas identificados
    print("Sintomas identificados:")
    print(sintomas_identificados)
