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
	if request.method == 'POST':

		email = request.form['email']
		password = request.form['password']
		role = request.form['role']
		cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)

		if role=='buyer':
			query = f"select * from buyer where buyerEmailID='{email}' and buyerPassword='{password}'"
			cursor.execute(query)

			account = cursor.fetchone()

			if account:
				session['loggedin'] = True
				session['id'] = account['buyerID']
				session['email'] = account['buyerEmailID']
				session['role'] = 'buyer'
				session['name'] = account['firstName']

				message = f"Hello! {account['firstName']}"
				return render_template("home.html", message=message, account=account)
			else:
				message = "Incorrect username/password"
		else:
			query = f"select * from seller where sellerEmailID='{email}' and sellerPassword='{password}'"
			cursor.execute(query)

			account = cursor.fetchone()	

			if account:
				session['loggedin'] = True
				session['id'] = account['sellerID']
				session['email'] = account['sellerEmailID']
				session['role'] = 'seller'
				session['name'] = account['sellerName']

				message = f"Hello! {account['sellerName']}"
				return render_template("home.html", message=message, account=account)		
			else:
				message = 'Incorrect username/Password'

	return render_template("login.html", message=message)

@app.route('/home', methods=['GET', 'POST'])
def home():
	try:
		session['loggedin']
		cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
		query = f"select * from buyer where buyerID='{session['id']}'"
		cursor.execute(query)

		account = cursor.fetchone()	

		return (render_template("home.html", account=account))

	except KeyError:
		return (render_template("login.html", message="Your aren't logged in!"))

@app.route('/register', methods=['GET', 'POST'])
@app.route('/register/buyer', methods=['GET', 'POST'])
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
		cursor.execute('select * from buyer where buyerEmailID=%s', (email, ))
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

			query = f"insert into buyer values ('{buyerid}', '{firstName}', '{middleName}', '{lastName}', '{email}', '{password}', '{contactNumber}', '{dob}', '{gender}')"
			
			try:
				cursor.execute(query)
			except MySQLdb._exceptions.OperationalError:
				if re.fullmatch(r'[a-z0-9@#$%^&+=]{8,}', password):
					message = "Your age should at least be 15!"
					return render_template('registerBuyer.html', message=message)
				else:
					message = "Your password should contain at least one special character, one character and be of at least 8 length" 
					return render_template('registerBuyer.html', message=message)

			mysql.connection.commit()

			message = "Registration successful!"

	return render_template('registerBuyer.html', message=message)

@app.route('/register/seller', methods=['GET', 'POST'])
def registerSeller():

	message = ""
	
	if request.method == 'POST':

		userPassword = request.form['userPassword']
		userContactNumber = request.form['userContactNumber']
		userEmailID = request.form['userEmailID']
		sellerName = request.form['sellerName']
		gst = request.form['GST']

		cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
		cursor.execute('select * from seller where sellerEmailID=%s', (userEmailID, ))
		exists = cursor.fetchone()

		if exists:
			message = ""
		elif not re.match(r'[^@]+@[^@]+\.[^@]+', userEmailID):
			message = "Enter a valid email!"
		elif len(userContactNumber) != 10 and userContactNumber.isnumeric():
			message = "Enter a valid 10 digit contact number"
		elif gst!="" and len(gst) != 15:
			message = "Enter a valid 15 digit GST number, leave blank if not available."
		else:
			sellerID = miscgens.get_seller_id(sellerName, userContactNumber, userEmailID)

			if gst == "":
				gst = "NULL"

			query = f"insert into seller values ('{sellerID}', '{sellerName}', '{userEmailID}', '{userPassword}', '{userContactNumber}', {gst})"

			try:
				cursor.execute(query)
			except MySQLdb._exceptions.OperationalError:
				if re.fullmatch(r'[a-z0-9@#$%^&+=]{8,}', userPassword):
					message = "Your age should at least be 15!"
					return render_template('registerSeller.html', message=message)
				else:
					message = "Your password should contain at least one special character, one character and be of at least 8 length" 
					return render_template('registerSeller.html', message=message)

			mysql.connection.commit()

			message = "Registration successful!"

	return render_template('registerSeller.html', message=message)

@app.route('/logout')
def logout():
	session.pop('loggedin', None)
	session.pop('id', None)
	session.pop('email', None)
	return redirect(url_for('login'))


@app.route('/changepassword/<role>', methods=['GET', 'POST'])
def change_password(role):

	message = ""
	try:
		session['loggedin']
	except KeyError:
		return (render_template("login.html", message="Your aren't logged in!"))
	
	query = f"select * from buyer where buyerID='{session['id']}'"
	cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
	cursor.execute(query)

	account = cursor.fetchone()

	if session['id'][0].lower() == "b":
		
		
		if request.method == 'POST':

			currentPass = request.form['currentPassword']
			newPass = request.form['newPassword']
			confirmPass = request.form['confirmPassword']

			query = f"select buyerPassword from buyer where buyerID='{session['id']}'"
			
			cursor.execute(query)

			password = cursor.fetchone()

			if password['buyerPassword'] != currentPass:
				message = "Incorrect current password!"

				return render_template("change_password.html", account=account, message=message, session=session)
			
			if newPass != confirmPass:
				message = "New password and confirm password do not match!"

				return render_template("change_password.html", account=account, message=message, session=session)

			if re.fullmatch(r'[a-z0-9@#$%^&+=]{8,}', newPass):

				query = f"update buyer set buyerPassword='{newPass}' where buyerID='{session['id']}'"
				cursor.execute(query)

				mysql.connection.commit()

				message="Successfully changed password!"
				return render_template("change_password.html", account=account, message=message, session=session)

			else:
				message = "Password should contain at least one special character and 8 length"
				return render_template("change_password.html", account=account, message=message, session=session)

	else:
		if request.method == 'POST':

			currentPass = request.form['currentPassword']
			newPass = request.form['newPassword']
			confirmPass = request.form['confirmPassword']

			query = f"select sellerPassword from seller where sellerID='{session['id']}'"
			
			cursor.execute(query)

			password = cursor.fetchone()

			if password['sellerPassword'] != currentPass:
				message = "Incorrect current password!"

				return render_template("change_password.html", account=account, message=message, session=session)
			
			if newPass != confirmPass:
				message = "New password and confirm password do not match!"

				return render_template("change_password.html", account=account, message=message, session=session)

			if re.fullmatch(r'[a-z0-9@#$%^&+=]{8,}', newPass):

				query = f"update seller set sellerPassword='{newPass}' where sellerID='{session['id']}'"
				cursor.execute(query)

				mysql.connection.commit()

				message="Successfully changed password!"
				return render_template("change_password.html", account=account, message=message, session=session)

			else:
				message = "Password should contain at least one special character and 8 length"
				return render_template("change_password.html", account=account, message=message, session=session)		

	return render_template("change_password.html", account=account, message=message, session=session)

@app.route('/profile/<role>/<id>', methods=['GET', 'POST'])
def profile(role, id):
	
	try:
		session['loggedin']
	except KeyError:
		return (render_template("login.html", message="Your aren't logged in!"))

	if session['id'][0].lower() == "b":
		#buyer profile page
		query = f"select * from buyer where buyerID='{session['id']}'"

		cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
		cursor.execute(query)

		account = cursor.fetchone()

		address_query = f"select * from buyerResidesIn where buyerID='{session['id']}'"

		cursor.execute(address_query)
		address=cursor.fetchall()

		card_query = f"select * from paymentCards where buyerID='{session['id']}'"
		cursor.execute(card_query)
		cards = cursor.fetchall()

		return render_template("buyer_profile.html", account=account, address=address, cards=cards)

	else:
		#seller profile page
		query = f"select * from seller where sellerID='{session['id']}'"

		cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
		cursor.execute(query)

		account = cursor.fetchone()

		return render_template("seller_profile.html", account=account)

@app.route('/profile/edit', methods=['GET', 'POST'])
def edit_profile():
	message = ""
	try:
		session['loggedin']
	except KeyError:
		return (render_template("login.html", message="Your aren't logged in!"))

	if request.method == "POST":
		if session['id'][0].lower() == "b":
			#buyer profile page
			query = f"select * from buyer where buyerID='{session['id']}'"

			cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
			cursor.execute(query)

			account = cursor.fetchone()		

			middleName = request.form['middleName']
			lastName = request.form['lastName']
			contact = request.form['contact']

			if not contact.isnumeric() or len(contact) != 10:
				message = "Please enter a valid contact number!"
				return render_template("buyer_edit_profile.html", account=account, message=message)	

			update_eq = f"update buyer set middleName='{middleName}', lastName='{lastName}', buyerContactNumber='{contact}' where buyerID='{session['id']}'"
			cursor.execute(update_eq)

			mysql.connection.commit()

			message = "Successfully updated!"
			cursor.execute(query)

			account = cursor.fetchone()

			return render_template("buyer_edit_profile.html", account=account, message=message)
		else:
			query = f"select * from seller where sellerID='{session['id']}'"

			cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
			cursor.execute(query)

			account = cursor.fetchone()		

			contact = request.form['contact']
			gst = request.form['gst']

			if not contact.isnumeric() or len(contact) != 10:
				message = "Please enter a valid contact number!"
				return render_template("seller_edit_profile.html", account=account, message=message)

			if len(gst)!=15 and gst!="NULL":
				message = "Please enter a valid GST number!"
				return render_template("seller_edit_profile.html", account=account, message=message)				

			update_eq = f"update seller set sellerContactNumber='{contact}',  gst='{gst}' where buyerID='{session['id']}'"
			cursor.execute(update_eq)

			mysql.connection.commit()

			message = "Successfully updated!"
			cursor.execute(query)

			account = cursor.fetchone()

			return render_template("seller_edit_profile.html", account=account, message=message)


	if session['id'][0].lower() == "b":
		#buyer profile page
		query = f"select * from buyer where buyerID='{session['id']}'"

		cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
		cursor.execute(query)

		account = cursor.fetchone()

		return render_template("buyer_edit_profile.html", account=account, message=message)

	else:
		#seller profile page
		query = f"select * from seller where sellerID='{session['id']}'"

		cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
		cursor.execute(query)

		account = cursor.fetchone()

		return render_template("seller_profile.html", account=account, message=message)
	
	return render_template("buyer_edit_profile.html", account=account, message=message)
