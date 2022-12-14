from locust import HttpUser, task, between
import time
from random import randrange
import json


class select:
    def on_start(self):
        self.client.post

        pass

    def gen_user(self):
        usr_counter = randrange(1, 250)
        username = "name" + str(usr_counter)
        data = {"name": str(username)}

        return str(json.dumps(data))


s = select()


class WebsiteUser(HttpUser):
    def on_start(self):
        self.client.headers = json.dumps({"Content-Type": "application/json"})
        response = self.client.post(
            "/sign_in.json", {"email": "abc@abc.com", "password": "password1"}
        )
        print("Response status code:", response.status_code)
        print("Response text:", response.text)
        self.header = response.headers["Set-Cookie"]
        self.new_cookie = self.header.split(";")
        self.cookie = self.new_cookie[0]

    @task
    def querry(self):
        self.client.headers = json.dumps({"Cookie": str(self.cookie)})
        print(self.client.headers)
        username = {"name": "name100"}
        usrnm = s.gen_user()
        print(usrnm)
        response = self.client.headers = json.dumps(
            {"Content-Type": "application/json"}
        )
        response = self.client.get(url="/pyq.json", data=username)
        print(response.headers["Set-Cookie"])
        print(response.text)
        print(response.status_code)
        self.header = response.headers["Set-Cookie"]
        self.new_cookie = self.header.split(";")
        self.cookie = self.new_cookie[0]
        time.sleep(0)
        wait_time = between(2, 5)
