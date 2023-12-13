from flask import Flask, request, jsonify
import spacy
from datetime import datetime
import pytz

from chatbot import chatbot

app = Flask(__name__)


def obter_periodo_do_dia():
    tz = pytz.timezone('America/Sao_Paulo')  
    agora = datetime.now(tz)
    hora = agora.hour

    if 6 <= hora < 12:
        return "Bom dia"
    elif 12 <= hora < 18:
        return "Boa tarde"
    elif 18 <= hora < 24:
        return "Boa noite"
    else:
        return "Boa madrugada"

@app.route('/chat', methods=['GET', 'POST'])
def chat():
    periodo = obter_periodo_do_dia()
    if request.method == 'GET':
        return jsonify({"mensagem": f"{periodo}! Como está se sentindo?", "isSender":False})

    if request.method == 'POST':
        data = request.json
        user_input = data.get('mensagem')

        if user_input is None:
            return jsonify({"erro": "Por favor, forneça uma mensagem no formato JSON"}), 400

        resposta_bot = chatbot(user_input.lower())

        if "Ótima notícia" in resposta_bot or "Procure o HC" in resposta_bot:
            return jsonify({"mensagem": resposta_bot, "status": "Fim da conversa", "isSender": False})
        else:
            return jsonify({"mensagem": resposta_bot, "status": "Conversa em andamento", "isSender": False})

if __name__ == '__main__':
    app.run(debug=True)
