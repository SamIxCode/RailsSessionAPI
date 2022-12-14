import psycopg2

#conn = psycopg2.connect(dbname='session_apionly_development', user='postgresql')
conn = psycopg2.connect(dbname='session_apionly_development', user='postgres')
cur = conn.cursor()


for i in range(10):
    cur.execute("SELECT name from users where name")
    records = cur.fetchall()
    print(records)