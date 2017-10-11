#!/usr/bin/python3
# Created by Optixal

from flask import Flask, request, render_template, session, flash, redirect, url_for, jsonify

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080, debug=True)
