from django.contrib import admin
from .models import QuickBooksToken

@admin.register(QuickBooksToken)
class QuickBooksTokenAdmin(admin.ModelAdmin):
    list_display = ('user', 'access_token', 'refresh_token', 'expires_in', 'x_refresh_token_expires_in')
