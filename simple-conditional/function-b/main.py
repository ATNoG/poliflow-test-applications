from flask import Flask, request, jsonify
import logging

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

app = Flask(__name__)


@app.route('/', methods=['GET'])
def function_b():
    message = "function b"
    logger.info(message)  # Log the message using the logger
    return jsonify(message=message)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
