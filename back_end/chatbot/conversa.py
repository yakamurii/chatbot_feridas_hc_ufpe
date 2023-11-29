

from processar_texto import processar_respostas


def conversa(dialogo):
    verifica_febre = []
    resposta = str(input("Você teve febre?"))  
    verifica_febre.append(resposta)
    sintoma = verificar_febre(verifica_febre)
    if sintoma:
        medicamento = str(input("Tomou algum medicamento?"))

def verificar_febre(verificar_febre):
    sintoma = processar_respostas(verificar_febre)
    resposta_febre = sintoma['febre']
    print(resposta_febre)
    return resposta_febre