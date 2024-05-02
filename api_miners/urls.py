from django.urls import path
from . import views

urlpatterns = [
    path('quickbooks/login/',views.quickbooks_login,name='quickbooks_login'),
    path('quickbook/callback/',views.quickbooks_callback,name='quickbooks_callback'),
    path('quickbooks/company_info/',views.get_company_info,name='quickbooks_get_company_info')
]