import psycopg2
from sys import argv
import json
#conn = psycopg2.connect(dbname='session_apionly_development', user='postgresql')
arg = argv[1]

class psycopg():
    def allow_data(self, arg):
        if 'name' in str(arg):
            qarg  = arg 
            return (qarg)
        else: qarg=''


    def recieve_data(self,data):
        
        conn = psycopg2.connect(dbname='session_apionly_development', user='postgres')
        cur = conn.cursor()
        cur.execute(f"SELECT record_name,record_info FROM records WHERE record_name = '{data}'")
        records = json.dumps(cur.fetchall())
        print(json.loads(records))

if __name__ == '__main__':
    p=psycopg()
    data = p.allow_data(arg)
    p.recieve_data(data)