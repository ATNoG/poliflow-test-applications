from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/', methods=['GET'])
def check_value():
    value = request.args.get('value', '').lower()
    return jsonify(value=(value == 'true'))

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
