from django.urls import path,include
from rest_framework.routers import DefaultRouter
from .api_views import AIChatMessageViewSet

router = DefaultRouter()
router.register('',AIChatMessageViewSet)


urlpatterns = [
    path("messages/",include(router.urls))
]