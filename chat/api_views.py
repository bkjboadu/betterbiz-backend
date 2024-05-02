from rest_framework import viewsets, status
from rest_framework.response import Response
from .models import AIChatMessage
from .serializers import AIChatMessageSerializer
import os
import requests


class AIChatMessageViewSet(viewsets.ModelViewSet):
    queryset = AIChatMessage.objects.all()
    serializer_class = AIChatMessageSerializer

    def get_queryset(self):
        user = self.request.user
        return AIChatMessage.objects.filter(user=user)

    def create(self, request, *args, **kwargs):
        # api_key = os.getenv('OPENAI_API_KEY')
        api_key = "sk-proj-9odFjYa8Yy7Lt5jtCt00T3BlbkFJga8I8MyL6L8yjVk8CvCO"
        print(api_key)
        if not api_key:
            return Response({'error': 'API key not configured.'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

        url = "https://api.openai.com/v1/chat/completions"
        headers = {
            "Authorization": f"Bearer {api_key}",
            "Content-Type": "application/json"
        }
        data = {
            "model": "gpt-3.5-turbo",
            "messages": request.data.get('messages', [])
        }

        response = requests.post(url, json=data, headers=headers)
        if response.status_code == 200:
            response_data = response.json()
            messages = response_data.get('choices')[0].get('message') if response_data.get('choices') else {}
            chat_session = AIChatMessage.objects.create(
                user=request.user,
                query=str(request.data.get('messages')[0].get('content')),
                response=messages.get('content') if messages else ""
            )
            return Response(self.get_serializer(chat_session).data, status=status.HTTP_201_CREATED)
        else:
            return Response(response.json(), status=response.status_code)
