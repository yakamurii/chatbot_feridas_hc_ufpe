import spacy

nlp = spacy.load("pt_core_news_sm")

def processar_respostas(respostas):
    sintomas = {
        "febre": False,
        "dor": False,
        "ferida_cicatrizada": False,
        "ferida_vermelha": False,
        "ferida_pus": False
    }

    for resposta in respostas:
        doc = nlp(resposta.lower())

        for token in doc:
            if token.lemma_ == "febre":
                sintomas["febre"] = True

            if token.lemma_ == "dor":
                sintomas["dor"] = True

            if token.lemma_ == "cicatrizar":
                sintomas["ferida_cicatrizada"] = True

            if token.lemma_ == "vermelho":
                sintomas["ferida_vermelha"] = True

            if token.lemma_ == "pus":
                sintomas["ferida_pus"] = True

    return sintomas





