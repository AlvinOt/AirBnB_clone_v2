#!/usr/bin/python3
""" Starts a Flask web application:
Web app listening on 0.0.0.0, port 5000
"""

from flask import Flask

app = Flask("__name__")


@app.route('/', strict_slashes=False)
def hello():
    """Returning a string"""
    return ("Hello HBNB!")


@app.route("/hbnb", strict_slashes=False)
def hbnb():
    """Returning a string"""
    return ("HBNB")


@app.route("/c/<text>", strict_slashes=False)
def cText(text):
    """display C followed by value of text variable"""
    return "C {}".format(text.replace("_", " "))


@app.route('/python', strict_slashes=False)
@app.route("/python/<text>", strict_slashes=False)
def pythonText(text="is cool"):
    """display Python followed by value text variable"""
    return "Python {}".format(text.replace("_", " "))


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=None)
