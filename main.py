import requests

# API key and endpoint
api_key = "sk-proj-9odFjYa8Yy7Lt5jtCt00T3BlbkFJga8I8MyL6L8yjVk8CvCO"
url = "https://api.openai.com/v1/chat/completions"

# Headers with the API key
headers = {
    "Authorization": f"Bearer {api_key}",
    "Content-Type": "application/json"
}

# Data payload
data = {
    "model": "gpt-3.5-turbo",
    "messages": [
        {"role": "user", "content": "Hello! How can I help you today?"}
    ]
}

# POST request
response = requests.post(url, json=data, headers=headers)

# Handle response
if response.status_code == 200:
    print("Success!")
    print(response.json())
else:
    print("Failed to fetch data:")
    print(response.text)
