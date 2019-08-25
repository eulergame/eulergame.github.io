print("hello world")
import pyodbc 
cnxn = pyodbc.connect("Driver={SQL Server Native Client 11.0};Server=59.111.61.113,38065;Database=ds;UID=sa;PWD=Love2016;")


cursor = cnxn.cursor()
cursor.execute('SELECT top 10 ActorName FROM GameActor')

for row in cursor:
    print('row = %r' % (row,))