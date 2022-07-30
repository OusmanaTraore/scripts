import csv
import MySQLdb

mydb = MySQLdb.connect(host='localhost',
    user='userCovid19',
    passwd='userCovid',
    db='mydb')
cursor = mydb.cursor()

csv_data = csv.reader(file('covid.csv'))
for row in csv_data:

    cursor.execute('INSERT INTO testcsv(names, \
          classes, mark )' \
          'VALUES("%s", "%s", "%s")', 
          row)
#close the connection to the database.
mydb.commit()
cursor.close()
print "Done"

