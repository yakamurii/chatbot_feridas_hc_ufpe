def cumprimento(hora:str):
   
    if "manhã" in hora:
        return "Bom dia!"
    elif "tarde" in hora:
        return "Boa tarde!"
    elif "noite" in hora:
        return "Boa noite!"
    
def horario_do_dia(horario:str):
    if "Boa noite" in horario:
        return " o dia"
    if "Boa tarte" in horario:
        return "o dia"
    elif "Bom dia" in horario:
        return "a noite"
def muitas_dores():
    pass

def febre():
    temperatura = float(input("Qual a temperatura da febre? "))
    if temperatura >= 35.4 and 37.2 <=temperatura:
        print("Está indicando que a temperatura do seu corpo está dentro do normal. Essa é uma ótima notícia.")
    elif temperatura >=37.5 and 38.0 <= temperatura:
        medicamento = str(input("Tomou algum medicamento para diminuir a febre?(sim | não) "))
        if "sim" in medicamento:
            #armazenar no BD
            tomou_medicamento = str(input("Qual foi o medicamento tomado?(dipirona | paracetamol) "))
            sobre_a_febre = str(input("A febre diminuiu? (sim | não) " ))
            if "sim" in sobre_a_febre:
                print("Ótima notícia!")
            elif "não" in sobre_a_febre:
                print("Por gentileza, esteja se encaminhando para o Hospital das Clínicas para uma melhor avaliação.")
        elif "não" in medicamento:
            print("Por gentileza, esteja se encaminhando para o Hospital das Clínicas para uma melhor avaliação.")
    elif temperatura >= 38.0 and 40.0 <= temperatura:
        print("Por gentileza, esteja se encaminhando para a emergência.")

def dores():
    ferida = str(input("""Como está a ferida? 
                (fechada | vermelha | com pus | inchada | vermelha e com pus | 
                inchada e com pus | vermelha e inchada | vermelha, inchada e com pus) """ ))
    if "fechada" in ferida:
        print("""Sugiro que tome a medicação prescrita pelo médico e se mantenha em repouso. 
                Se a dor persistir, você deve retornar ao nosso atendimento presencial.""")
    elif "vermelha" in ferida:
        pass
    elif "pus" in ferida:
        pass
    elif "inchada" in ferida:
        pass
    elif "vermelha e com pus" in ferida:
        pass
    elif "inchada e com pus" in ferida:
        pass
    elif "vermelha e inchada" in ferida:
        pass
    elif "vermelha, inchada e com pus" in ferida:
        pass

def dores_e_febre():
   pass
def sintoma_relatado(sintoma):
    if "muitas dores" in sintoma:
        muitas_dores()  
    elif "febre" in sintoma:
        febre()
    elif "dores" in sintoma:
        dores()
    elif "dores e febre" in sintoma:
        dores_e_febre()
        pass

def chatting(iniciar_conversa:str):
    if "bem" in iniciar_conversa:
        print("Essa é uma ótima notícia!")
    elif "mal" in iniciar_conversa:
        sintoma = input("Quais dos sintomas você sentiu?(febre | dores | dores e febre | muitas dores) ")
        sintoma_relatado(sintoma)


if __name__ == "__main__":
    hora = input("Em que horário você está? ") 
    iniciar_conversa = str(input(cumprimento(hora) + f" Como passou {horario_do_dia(cumprimento(hora))}(mal|bem)?"))
    chatting(iniciar_conversa)
    

