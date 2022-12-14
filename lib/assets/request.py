import requests
import json
from random import randrange

url = 'http://localhost:3000/q'
headers = {
    'Content-Type':'application/json'
}

# print(r.status_code)
# print(r.text)
# print(r.json())
for i in range(10):
    name_num = randrange(1,20)
    name_num = 'name'+ str(name_num)

    payload = {
        "name":name_num
    }


    r= requests.get(url=url,headers=headers,params=payload)
    print(r.json())

# data = {
#         "text": "finish all the track to hear and great good tune u do a great job alan walker",
#         "max_op_words": 10,
#         "max_time": 1,
#         "max_predictions": 1
#         }

# json_data = json.dumps(data)
# json_load= json.loads(json_data)
# print
# print(json_data)

