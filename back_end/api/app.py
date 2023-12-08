from flask import Flask, jsonify, request

app = Flask(__name__)

data = {"isImportant": "true", "pergunta": "Como passou a noite?"},

@app.route('/chat', methods=['GET'])
def get_data():
    response = jsonify(data)
    response.headers.add('Access-Control-Allow-Origin', '*')
    return response

@app.route('/chat', methods=['POST'])
def add_data():
    global data  

    new_entry = {'isImportant': request.json.get('isImportant', ''), 'pergunta': request.json.get('pergunta', '')}
    data[0].update(new_entry)  
    response = jsonify(data[0])
    response.headers.add('Access-Control-Allow-Origin', '*')
    return response, 201

if __name__ == '__main__':
    app.run(debug=True)
