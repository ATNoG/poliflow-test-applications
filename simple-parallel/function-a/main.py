from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/', methods=['POST'])
def check_value():
    return jsonify(value={})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
