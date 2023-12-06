import spacy

nlp = spacy.load("pt_core_news_sm")

class NoArvore:
    def __init__(self, pergunta, sim=None, nao=None):
        self.pergunta = pergunta
        self.sim = sim
        self.nao = nao

def processar_respostas(respostas):
    negacoes = {"não", "nada", "nunca", "jamais"}  
    
    # Criar os nós da árvore
    no_febre = NoArvore("Você está com febre?")
    no_dor = NoArvore("Você está sentindo dor?")
    no_cicatrizada = NoArvore("Sua ferida está cicatrizada?")
    no_vermelha = NoArvore("Sua ferida está vermelha?")
    no_pus = NoArvore("Sua ferida está com pus?")

    # Estrutura da árvore
    no_febre.sim = no_dor
    no_febre.nao = no_cicatrizada
    no_dor.sim = no_cicatrizada
    no_dor.nao = no_vermelha
    no_cicatrizada.sim = no_vermelha
    no_cicatrizada.nao = no_pus

    sintomas = {
        "febre": False,
        "dor": False,
        "ferida_cicatrizada": False,
        "ferida_vermelha": False,
        "ferida_pus": False
    }

    no_atual = no_febre
# ... (código anterior)

    for resposta in respostas:
        doc = nlp(resposta.lower())
        tokens = [token.text for token in doc]

        negacao = any(token in negacoes for token in tokens)

        if negacao and no_atual.nao:
            no_atual = no_atual.nao
        elif not negacao and no_atual.sim:
            no_atual = no_atual.sim
        else:
            break

        if no_atual == no_dor:
            sintomas["febre"] = True
        elif no_atual == no_vermelha:
            sintomas["ferida_vermelha"] = True
        elif no_atual == no_cicatrizada and no_atual.sim:
            sintomas["ferida_cicatrizada"] = True
        elif no_atual == no_pus:
            sintomas["ferida_pus"] = True
            sintomas["dor"] = True
            sintomas["ferida_cicatrizada"] = True

# ... (código posterior)



    return sintomas

# Exemplo de uso
respostas = [
    "Sim, estou com febre.",
    "Não, estou sentindo dor.",
    "Sim, a ferida está cicatrizada.",
    "Sim, a ferida não está vermelha.",
    "Não, não está com pus."
]

sintomas_identificados = processar_respostas(respostas)
print(sintomas_identificados)
