from processar_texto import processar_respostas

if __name__=="__main__":

    respostas_paciente = [
        "não está com pus",
    ]

    sintomas_identificados = processar_respostas(respostas_paciente)

    print("Sintomas identificados:")
    print(sintomas_identificados)
