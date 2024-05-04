from rest_framework import viewsets, status
from rest_framework.response import Response
from .models import BettyChatMessage
from .serializers import AIChatMessageSerializer
import os
import time
from django.conf import settings
from openai import OpenAI


class AIChatMessageViewSet(viewsets.ModelViewSet):
    queryset = BettyChatMessage.objects.all()
    serializer_class = AIChatMessageSerializer

    def get_queryset(self):
        user = self.request.user
        return BettyChatMessage.objects.filter(user=user)

    # def create(self, request, *args, **kwargs):
        # api_key = os.getenv('OPENAI_API_KEY')
        # print(api_key)
        # # api_key = "sk-proj-9odFjYa8Yy7Lt5jtCt00T3BlbkFJga8I8MyL6L8yjVk8CvCO"
        
        # if not api_key:
        #     return Response({'error': 'API key not configured.'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

    #     url = "https://api.openai.com/v1/chat/completions"
    #     headers = {
    #         "Authorization": f"Bearer {api_key}",
    #         "Content-Type": "application/json",
    #         "OpenAI-Beta":"assistants=v2"
    #     }
    #     data = {
    #         "model": "gpt-4-turbo",
    #         "messages": request.data.get('messages', [])
    #     }

    #     response = requests.post(url, json=data, headers=headers)
    #     print(response.json())
    #     if response.status_code == 200:
    #         response_data = response.json()
            # messages = response_data.get('choices')[0].get('message') if response_data.get('choices') else {}
            # # chat_session = BettyChatMessage.objects.create(
            # #     user=request.user,
            # #     query=str(request.data.get('messages')[0].get('content')),
            # #     response=messages.get('content') if messages else ""
            # # )
            # # return Response(self.get_serializer(chat_session).data, status=status.HTTP_201_CREATED)
        # else:
        #     return Response(response.json(), status=response.status_code)

    def create(self,request,*args,**kwargs):
        # api_key = os.getenv('OPENAI_API_KEY')
        # print(api_key)
        api_key = "sk-proj-9odFjYa8Yy7Lt5jtCt00T3BlbkFJga8I8MyL6L8yjVk8CvCO"
        
        if not api_key:
            return Response({'error': 'API key not configured.'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

        
        client = OpenAI(api_key="sk-proj-9odFjYa8Yy7Lt5jtCt00T3BlbkFJga8I8MyL6L8yjVk8CvCO")
        assist_id = "asst_1O5SgsfoazIZS5I8AagcswUa"
        thread = client.beta.threads.create(messages=request.data.get("messages"))
        run = client.beta.threads.runs.create(thread_id=thread.id, assistant_id=assist_id)
        
        while run.status != "completed":
            run = client.beta.threads.runs.retrieve(thread_id=thread.id, run_id=run.id)
            time.sleep(1)
        else:
            print(f"run id completed")
        
        message_response = client.beta.threads.messages.list(thread_id=thread.id)
        message = message_response.data

        
        if len(message) > 0:
            latest_message = message[0]
            response = latest_message.content[0].text.value
            
            user = request.user
            query = request.data.get('messages')[0]['content']

            chat_session = BettyChatMessage.objects.create(
                user=user,
                query=query,
                response=response
            )
            return Response(self.get_serializer(chat_session).data, status=status.HTTP_201_CREATED)
        else:
            return Response(response.json(), status=response.status_code)



        


