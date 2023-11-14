import nltk
from nltk.chat.util import Chat, reflections

nltk.download('punkt')

pairs = [
    (r'oi|ola', ['Como você está se sentindo hoje?']),
    (r'está tudo bem|mais ou menos|me sinto mal', ['Como passou a noite?']),
    (r'passei bem', ['Obrigada pelo seu retorno! Posso ajudar em algo mais?']),
    (r'passei mal', ['Descreva melhor o que sentiu?']),
    (r'sim', ['Em que mais posso estar te ajudando?']),
    (r'não', ['Obrigada pelo seu retorno! Até logo?']),
    (r'tive febre', ['Tomou algum medicação para febre?']),
    (r'tomei medicação para febre', ['Qual medicação você tomou?']),
    (r'paracetamol|dipirona', ['A febre passou ou diminuiu?']),
    (r'a febre passou|diminuiu', ['Ótima notícia. A ferida doeu?']),
    (r'a ferida doeu|a ferida doeu muito', ['Como está a ferida?']),
    (r'fechada', ['Está vermelha em volta ou totalmente cicatrizada?']),
    (r'cicatrizada', ['Sente dor?']),
    (r'sinto dor', ['Vê sinal de pus ou pontos esbranquiçados?']),
    (r'não sinto dor', ['Que ótima notícia. Posso te ajudar em algo mais?']),
    (r'pus| pontos esbranquiçados', ['Você deve procurar imediatiamente o hospital!']),
    (r'não tem pus| não tem pontos esbranquiçados', ['Você deve procurar imediatiamente o hospital!']),
    (r'aberta', ['Vê sinal de pus ou pontos esbranquiçados?']),

    (r'adeus|tchau', ['Tchau! Até logo.', 'Até mais!']),
]

chatbot = Chat(pairs, reflections)

print("Olá! Sou a Ana. Digite 'tchau' para encerrar o chat.")
while True:
    user_input = input("Você: ")
    if user_input.lower() == 'tchau':
        print("Chat encerrado.")
        break
    else:
        response = chatbot.respond(user_input)
        print("ChatBot: " + response)

