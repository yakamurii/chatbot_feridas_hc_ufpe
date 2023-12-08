from flask import Flask, jsonify, request

app = Flask(__name__)

data = {"isImportant": "true", "pergunta": "Como passou a noite?"},


@app.route('/chat', methods=['GET'])
def get_data():
    # question = {}
    # inputget = str(request.args['isImportant'])
    # question['isImportant'] = inputget
    # return question
    response = jsonify(data)
    response.headers.add('Access-Control-Allow-Origin', '*')
    return response

@app.route('/chat', methods=['POST'])
def add_data():
    new_entry = {'isImportant': request.json['pergunta']}
    data.append(new_entry)
    response = jsonify(new_entry)
    response.headers.add('Access-Control-Allow-Origin', '*')
    return response, 201

if __name__ == '__main__':
    app.run(debug=True)
