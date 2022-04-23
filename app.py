from flask import Flask, appcontext_popped, render_template, request, redirect, url_for, session
from flask_mysqldb import MySQL
import MySQLdb.cursors
import re
from . import miscgens

def create_app():
	app = Flask(__name__, template_folder='templates')


	app.secret_key = 'dbmsProject'

	app.config['MYSQL_HOST'] = 'localhost'
	app.config['MYSQL_USER'] = 'root'
	app.config['MYSQL_PASSWORD'] = 'root'
	app.config['MYSQL_DB'] = 'furnoDB'

	return app

app = create_app()
mysql = MySQL(app)

@app.route('/')
@app.route('/login', methods =['GET', 'POST'])
def login():
    return "<h>Welcome to Furno!</h>"

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
		else:
			buyerid = miscgens.get_buyer_id(firstName, dob, email, gender)

			if middleName == "":
				middleName = "NULL"
			
			if lastName == "":
				lastName = "NULL"

			query = f'insert into buyer values ({buyerid}, {firstName}, {middleName}, {lastName}, {dob}, {gender}, {contactNumber}, {email}, {password}, NULL)'
			print(query)
			
			cursor.execute(query)

			mysql.connection.commit()

			message = "Registration successful!"

	return render_template('registerBuyer.html', message=message)
