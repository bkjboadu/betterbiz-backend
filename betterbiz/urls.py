from django.contrib import admin
from django.conf import settings
from django.urls import path,include
from django.conf.urls.static import static

urlpatterns = [
    path("admin/", admin.site.urls),
    path('api/accounts/',include('account.urls')),
    path('api/business/',include('business.urls')),
    path('api/chat/',include('chat.urls')),
    path('api/',include('questionnaire.urls')),
    path('miners/',include('api_miners.urls'))
    
]


if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)
