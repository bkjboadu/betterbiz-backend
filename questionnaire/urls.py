from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .api_views import IndustryViewSet, QuestionViewSet,UserResponseViewSet

router = DefaultRouter()
router.register(r"industries", IndustryViewSet)
router.register(r"questions", QuestionViewSet)
router.register(r"userresponse", UserResponseViewSet)

urlpatterns = [
    path("", include(router.urls)),
]
