from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView
from rest_framework.routers import DefaultRouter
from django.urls import path, include
from . import api_views

router = DefaultRouter()
router.register(r"", api_views.AccountViewSet, basename="useraccount")

urlpatterns = [
    path("login/", api_views.CustomTokenObtainPairView.as_view(), name="token_obtain"),
    path("refresh/", TokenRefreshView.as_view(), name="token_refresh"),
    path("", include(router.urls)),
]
