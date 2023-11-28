from processar_texto import processar_respostas



if __name__=="__main__":


    respostas_paciente = [
        "Passei bem a noite e não senti febre.",
        "Senti um pouco de dor na ferida.",
        "A ferida está vermelha e com um pouco de pus."
    ]

    sintomas_identificados = processar_respostas(respostas_paciente)

    print("Sintomas identificados:")
    print(sintomas_identificados)
