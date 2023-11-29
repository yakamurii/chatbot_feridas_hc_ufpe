import spacy

# Carregar o modelo em português
nlp = spacy.load("pt_core_news_sm")

# Função para processar as respostas do paciente
def processar_respostas(respostas):
    negacoes = {"não", "nada", "nunca", "jamais"}  # Palavras que indicam negação
    sintomas = {
        "febre": False,
        "dor": False,
        "ferida_cicatrizada": False,
        "ferida_vermelha": False,
        "ferida_pus": False
    }

    for resposta in respostas:
        doc = nlp(resposta.lower())
        tokens = [token.text for token in doc]

        for i, token in enumerate(tokens):
            if token == "febre":
                # Verificar se existem tokens de negação antes da palavra "febre"
                negacao_antes_da_febr = any(prev_token in negacoes for prev_token in tokens[:i])
                sintomas["febre"] = not negacao_antes_da_febr

            if token == "dor":
                # Verificar se existem tokens de negação antes da palavra "febre"
                negacao_antes_da_dor = any(prev_token in negacoes for prev_token in tokens[:i])
                sintomas["dor"] = not negacao_antes_da_dor

            if token == "cicatrizada":
                # Verificar se existem tokens de negação antes da palavra "febre"
                negacao_antes_da_cicatrizada = any(prev_token in negacoes for prev_token in tokens[:i])
                sintomas["ferida_cicatrizada"] = not negacao_antes_da_cicatrizada

            if token == "vermelha":
                # Verificar se existem tokens de negação antes da palavra "febre"
                negacao_antes_da_vermelha = any(prev_token in negacoes for prev_token in tokens[:i])
                sintomas["ferida_vermelha"] = not negacao_antes_da_vermelha

            if token == "pus":
                # Verificar se existem tokens de negação antes da palavra "febre"
                negacao_antes_da_pus = any(prev_token in negacoes for prev_token in tokens[:i])
                sintomas["ferida_pus"] = not negacao_antes_da_pus

            # if token.lemma_ == "dor":
            #     sintomas["dor"] = True

            # if token.lemma_ == "cicatrizar":
            #     sintomas["ferida_cicatrizada"] = True

            # if token.lemma_ == "vermelho":
            #     sintomas["ferida_vermelha"] = True

            # if token.lemma_ == "pus":
            #     sintomas["ferida_pus"] = True

    return sintomas





