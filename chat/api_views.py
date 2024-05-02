from rest_framework import viewsets, status
from rest_framework.response import Response
from .models import AIChatMessage
from .serializers import AIChatMessageSerializer


class AIChatMessageViewSet(viewsets.ModelViewSet):
    queryset = AIChatMessage.objects.all()
    serializer_class = AIChatMessageSerializer

    def get_queryset(self):
        user = self.request.user
        return AIChatMessage.objects.filter(user=user)

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        if serializer.is_valid():
            serializer.save(user=request.user)
            return Response(serializer.data, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
