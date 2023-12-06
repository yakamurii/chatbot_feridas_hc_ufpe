from flask import Flask, jsonify, request

app = Flask(__name__)

data = [
    {'id': 1, 'name': 'Alice'},
    {'id': 2, 'name': 'Bob'},
    {'id': 3, 'name': 'Charlie'}
]

@app.route('/chat', methods=['GET'])
def get_data():
    return jsonify(data)

@app.route('/chat', methods=['POST'])
def add_data():
    new_entry = {'id': len(data) + 1, 'name': request.json['name']}
    data.append(new_entry)
    return jsonify(new_entry), 201

if __name__ == '__main__':
    app.run(debug=True)
