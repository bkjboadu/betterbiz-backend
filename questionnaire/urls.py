from django.urls import path,include
from rest_framework.routers import DefaultRouter
from .api_views import IndustryViewSet,CategoryViewSet

router = DefaultRouter()
router.register(r'industries',IndustryViewSet)
router.register(r'categories',CategoryViewSet)

urlpatterns = [
    path('',include(router.urls)),
]