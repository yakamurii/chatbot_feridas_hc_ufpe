import spacy
nlp = spacy.load("pt_core_news_sm")
def chatbot(resposta):
    doc = nlp(resposta)

    tokens = [token.text for token in doc]

    if "febre" in tokens:
        return "Tomou algum medicamento?"
    elif "sim" in tokens and ("dipirona" in tokens or "remédio" in tokens or "medicamento" in tokens):
        return "Baixou a febre?"
    elif "sim" in tokens and "baixou" in tokens:
        return "Como está a ferida?"
    elif "dores" in tokens:
        return "Tomou algum medicamento?"
    elif "sim" in tokens and ("tomar" in tokens or "medicamento" in tokens):
        return "A dor persiste?"
    elif "não" in tokens and ("passou" in tokens or "aliviou" in tokens):
        return "Ótima notícia!"
    elif "não" in tokens and ("tomei" in tokens or "medicamento" in tokens):
        return "A febre persiste?"
    elif "sim" in tokens and ("persiste" in tokens or "continua" in tokens):
        return "Como está a ferida?."
    elif "vermelha" in tokens:
        return "Sente dores?"
    elif "sim" in tokens and ("dores" in tokens or "sinto" in tokens):
        return "Tem pus na ferida?"
    elif "sim" in tokens and "pus" in tokens:
        return "Procure o HC para uma avaliação."
    elif "não" in tokens and ("dores" in tokens or "sinto" in tokens):
        return "A ferida está cicatrizada?" 
    elif "sim" in tokens and ("está" in tokens or "cicatrizada"):
        return "Então está tudo seguindo bem"
    else:
        return "Desculpe, não entendi. Poderia repetir de outra forma?"
    