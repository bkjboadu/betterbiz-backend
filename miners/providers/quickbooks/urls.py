from django.urls import path
from .views import quickbooks_login, quickbooks_callback,get_quickbooks_company_info,sync_quickbooks_customers

urlpatterns = [
    path('login/', quickbooks_login, name='quickbooks_login'),
    path('callback/', quickbooks_callback, name='quickbooks_callback'),
    path('company/',get_quickbooks_company_info,name='get_quickbooks_company_info'),
    path('customers/',sync_quickbooks_customers,name='sync_quickbooks_customers')
]
