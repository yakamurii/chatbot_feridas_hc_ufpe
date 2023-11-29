from conversa import conversa

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
    
def chatting(iniciar_conversa:str):
    if "bem" in iniciar_conversa:
        print("Essa é uma ótima notícia!")
    elif "mal" in iniciar_conversa:
        iniciar_dialogo = input("Vamos falar um pouco sobre isso? ")
        if "sim" in iniciar_dialogo:
            conversa(iniciar_dialogo)
        elif "não" in iniciar_dialogo:
            print("Tudo bem! Vou respeitar seu espaço!")

