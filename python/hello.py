print("hello world")
import pyodbc 
cnxn = pyodbc.connect("Driver={ODBC Driver 13 for SQL Server};Server=111.230.213.219,38065;Database=ds;UID=sa;PWD=Love2016;")

cursor = cnxn.cursor()
cursor.execute('SELECT top 10 ActorName FROM dbo.GameActor where UserID<>1')

for row in cursor:
    print('row = %r' % (row,))