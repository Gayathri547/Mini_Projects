from re import DEBUG
from flask import Flask, render_template, request, redirect, url_for, flash
from flask_mysqldb import MySQL



app = Flask(__name__)
app.secret_key = 'many random bytes'

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'crud_application'

mysql = MySQL(app)



@app.route('/')
def Index():
    cur = mysql.connection.cursor()
    cur.execute("select * from grocery_table")
    data = cur.fetchall()
    cur.close()


    return render_template('index.html', grocery_table=data )


# INSERTION
@app.route('/insert', methods = ['POST'])
def insert():

    if request.method == "POST":
        flash("Data Inserted Successfully")
        cust_name = request.form['cust_name']
        address = request.form['address']
        item_name = request.form['item_name']
        quantity = request.form['quantity']
        cost = request.form['cost']
        cur = mysql.connection.cursor()
        cur.execute("insert into grocery_table (cust_name, address,item_name,quantity,cost) VALUES (%s, %s, %s, %s, %s)", (cust_name,address,item_name,quantity,cost))
        mysql.connection.commit()
        return redirect(url_for('Index'))



# DELETION
@app.route('/delete/<string:id_data>', methods = ['GET'])
def delete(id_data):
    flash("Record Has Been Deleted Successfully")
    cur = mysql.connection.cursor()
    cur.execute("delete from grocery_table where id=%s", (id_data,))
    mysql.connection.commit()
    return redirect(url_for('Index'))





@app.route('/update',methods=['POST','GET'])
def update():

    if request.method == 'POST':
        id_data = request.form['id']
        cust_name = request.form['cust_name']
        address = request.form['address']
        item_name = request.form['item_name']
        quantity = request.form['quantity']
        cost = request.form['cost']


        cur = mysql.connection.cursor()
        cur.execute("""
               update grocery_table
               set cust_name=%s, address=%s, item_name = %s, quantity=%s,cost=%s
               where id=%s
            """, (cust_name, address,item_name,quantity, cost, id_data))
        flash("Data is Updated Successfully")
        mysql.connection.commit()
        return redirect(url_for('Index'))


# Caching
@app.after_request
def add_header(response):
    response.headers['X-UA_Compatible']='IE-Edge,chrome=1'
    response.headers['Cache-Control']='public,max-age=10'
    return response







if __name__ == "__main__":
    app.run(debug=True)
