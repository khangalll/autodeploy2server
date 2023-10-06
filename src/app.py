from flask import Flask, render_template, request
import socket

app = Flask(__name__)

@app.route("/")
def index():
    if request.method != 'GET':
        return 'Method not Allowed', 405
    try:
        host_name = socket.gethostname()
        host_ip = socket.gethostbyname(host_name)
        return render_template('index.html', hostname=host_name, ip=host_ip)
    except:
        return render_template('error.html')

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080)
