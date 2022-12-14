
import requests
from statistics import median, mean

# Set the number of requests to make
num_requests = 100

# Set the URL to request
url1 = 'http://0.0.0.0:8080/q'
url2 = 'http://0.0.0.0:3000/py'

# Set the header to send with the request
header = {'Content-Type': 'application/json'}

# Set the body to send with the request
body = '{"email":"abc@abc.com"}'

# Set the sign-in URL and credentials
sign_in_url = 'http://localhost:3000/sign_in.json'
sign_in_creds = '{"email":"abc@abc.com", "password":"password1"}'

# Send a sign-in request to get the authentication cookie
sign_in_response = requests.post(sign_in_url, headers=header, data=sign_in_creds)
auth_cookie = sign_in_response.cookies.get('auth')

# Set the cookies to send with the request
cookies = {'auth': auth_cookie}

# Create empty lists to store the response times
response_times1 = []
response_times2 = []

# Make the requests to each URL and store the response times
for i in range(num_requests):
    response1 = requests.post(url1, headers=header, data=body)
    response_times1.append(response1.elapsed.total_seconds() * 1000)

    # Use the updated authentication cookie for each request
    response2 = requests.get(url2, cookies=cookies)
    response_times2.append(response2.elapsed.total_seconds() * 1000)
    cookies['auth'] = response2.cookies.get('auth')

# Calculate the average response times
average1 = mean(response_times1)
average2 = mean(response_times2)

# Calculate the median response times
median1 = median(response_times1)
median2 = median(response_times2)

# Calculate the maximum and minimum response times
max1 = max(response_times1)
max2 = max(response_times2)
min1 = min(response_times1)
min2 = min(response_times2)

# Calculate the top 10% maximum response times
max_response_times1 = sorted(response_times1, reverse=True)[:int(num_requests * 0.1)]
max_response_times2 = sorted(response_times2, reverse=True)[:int(num_requests * 0.1)]

top_10_percent_max1 = max(max_response_times1)
top_10_percent_max2 = max(max_response_times2)

# Print the results
print(f'URL1 average response time: {average1:.2f} ms')
print(f'URL1 median response time: {median1:.2f} ms')
print(f'URL1 max response time: {max1:.2f} ms')
print(f'URL1 min response time: {min1:.2f} ms')
print(f'URL1 top 10% max response time: {top_10_percent_max1:.2f} ms')
print(f'----------------------------------')
print(f'URL2 average response time: {average2:.2f} ms')
print(f'URL2 median response time: {median2:.2f} ms')
print(f'URL2 max response time: {max2:.2f} ms')
print(f'URL2 min response time: {min2:.2f} ms')
print(f'URL2 top 10% max response time: {top_10_percent_max2:.2f} ms')