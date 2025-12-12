from flask import Flask, request, jsonify
import logging
import json

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

app = Flask(__name__)


@app.route('/', methods=['POST'])
def function_b():
    return jsonify(value={"function-c": True})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
