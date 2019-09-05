import pyodbc 
cnxn = pyodbc.connect("Driver={ODBC Driver 13 for SQL Server};Server=172.16.1.26,38066;Database=GameMaster;UID=sa;PWD=Love2019;")

cursor = cnxn.cursor()
cursor.execute('SELECT top 10 * FROM dbo.Brothers')

for row in cursor:
    print('row = %r' % (row,))