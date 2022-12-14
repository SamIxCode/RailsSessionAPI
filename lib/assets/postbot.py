import requests
import json

url = 'http://localhost:3000/records'
headers = {
    'Content-Type':'application/json'
}


# r = requests.post(url=url,headers=headers,params=payload)

# print(r.status_code)
# print(r.text)
# print(r.json())


names = []
counter = 0 #st to the last  number of record in databse

for i in range(250):
    counter = counter+1
    payload = {
    'record[record_name]':'name'+str(counter),
    'record[record_info]':'info'+str(counter)
    }
    print (payload)
    r = requests.post(url=url,headers=headers,params=payload)
    print(r.json())