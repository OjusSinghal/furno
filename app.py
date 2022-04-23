from flask import Flask, appcontext_popped, render_template, request, redirect, url_for, session
from flask_mysqldb import MySQL
import MySQLdb.cursors
import re
from . import miscgens

def create_app():

	import os
	from pathlib import Path
	from dotenv import load_dotenv

	load_dotenv()
	env_path = Path('.')/'.env'
	load_dotenv(dotenv_path=env_path)


	app = Flask(__name__, template_folder='templates')


	app.secret_key = 'dbmsProject'

	app.config['MYSQL_HOST'] = os.environ['HOST']
	app.config['MYSQL_USER'] = os.environ['USER']
	app.config['MYSQL_PASSWORD'] = os.environ['PASSWORD']
	app.config['MYSQL_DB'] = os.environ['DB']

	return app

app = create_app()
mysql = MySQL(app)

@app.route('/')
@app.route('/login', methods =['GET', 'POST'])
def login():
	message = ""

	if request.method == 'POST' and 'email' in request.form and 'password' in request.form:
		email = request.form['email']
		password = request.form['password']
		role = request.form['role']
		cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)

		if role=='buyer':
			query = f"select * from buyer where email='{email}' and buyerPassword='{password}'"
			cursor.execute(query)

			account = cursor.fetchone()

			if account:
				session['loggedin'] = True
				session['id'] = account['buyerID']
				session['email'] = account['email']

				message = f"Hello! {account['firstName']}"
				return render_template("home.html", message=message)
			else:
				message = "Incorrect username/password"
	
	return render_template("login.html", message=message)

@app.route('/registerBuyer', methods=['GET', 'POST'])
def registerBuyer():
	message = ""

	if request.method == 'POST':

		firstName = request.form['firstName']
		middleName = request.form['middleName']
		lastName = request.form['lastName']
		dob = request.form['dob']
		gender = request.form['gender']
		contactNumber = request.form['contactNumber']
		email = request.form['email']
		password = request.form['password']

		cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
		cursor.execute('select * from buyer where email=%s', (email, ))
		exists = cursor.fetchone()

		if exists:
			message = "Account already exists"
		elif not re.match(r'[^@]+@[^@]+\.[^@]+', email):
			message = "Enter a valid email!"
		elif len(contactNumber) != 10 and contactNumber.isnumeric():
			message = "Enter a valid 10 digit contact number"
		else:
			buyerid = miscgens.get_buyer_id(firstName, dob, email, gender)

			if middleName == "":
				middleName = "NULL"
			
			if lastName == "":
				lastName = "NULL"

			query = f"insert into buyer values ('{buyerid}', '{firstName}', '{middleName}', '{lastName}', '{dob}', '{gender}', '{contactNumber}', '{email}', '{password}', NULL)"
			
			cursor.execute(query)

			mysql.connection.commit()

			message = "Registration successful!"

	return render_template('registerBuyer.html', message=message)
