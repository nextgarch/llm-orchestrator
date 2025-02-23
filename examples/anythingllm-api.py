import json
import requests

# Define API URL and authentication key (YOU WILL NEED TO CHANGE THIS)
API_URL = "http://10.168.0.177:3001/api/v1/workspace/personal/thread/api-test/chat"
API_KEY = "M8R90K5-F4842JR-JX5P1JY-R99RNSX"

# Set up headers
headers = {
    "accept": "application/json",
    "Authorization": f"Bearer {API_KEY}",
    "Content-Type": "application/json"
}

# Define the request payload
data = {
    "message": "Who is this model?",
    "mode": "chat",
    "userId": 2,
    "attachments": []
}

# Make the POST request
response = requests.post(API_URL, headers=headers, json=data)

# Check response
if response.status_code == 200:
    print(json.dumps(response.json(), indent=4))  # Print the JSON response
else:
    print(f"Error {response.status_code}: {response.text}")
