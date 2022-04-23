# furno
### Getting Started
The project uses Python, MySQL and Flask framework. Make sure to install the same. 
To get the required libraries:
```bash
pip install -r requirements.txt
```
Now, create a .env file in the same
```bash
touch .env
```
Add the following in the .env file
```bash
HOST=hostName
USER=username
PASSWORD=password
DB=databaseName
```
Export the project name to enviornment variable
```bash
export FLASK_APP=furno
```
Finally, to run the application
```bash
flask run
```