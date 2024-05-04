from openai import OpenAI
import time

client = OpenAI(api_key="sk-proj-9odFjYa8Yy7Lt5jtCt00T3BlbkFJga8I8MyL6L8yjVk8CvCO")

assist_id = "asst_1O5SgsfoazIZS5I8AagcswUa"
thread = client.beta.threads.create(
    messages= [
    {"role": "user", "content": "Who do you work for?"}
  ]
)
# import requests
run = client.beta.threads.runs.create(thread_id=thread.id,assistant_id=assist_id)
print({run.id})

while run.status !="completed":
    run = client.beta.threads.runs.retrieve(thread_id=thread.id,run_id=run.id)
    print(f"Rn status: {run.status}")
    time.sleep(1)
else:
    print("Run completed!")

message_response = client.beta.threads.messages.list(thread_id=thread.id)
message = message_response.data

lateest_message = message[0]
print(lateest_message)
print(lateest_message.content[0].text.value)