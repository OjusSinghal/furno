from flask import Flask, render_template, request, redirect, url_for, session
from flask_mysqldb import MySQL

def create_app():
	app = Flask(__name__)


	app.secret_key = 'dbmsProject'

	app.config['MYSQL_HOST'] = 'localhost'
	app.config['MYSQL_USER'] = 'root'
	app.config['MYSQL_PASSWORD'] = 'root'
	app.config['MYSQL_DB'] = 'furnoDB'

	return app

app = create_app()
mysql = MySQL(app)

@app.route('/')
def home():
    return "<h>Welcome to Furno!</h>"

    