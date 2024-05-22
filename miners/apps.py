from django.apps import AppConfig
from allauth.socialaccount.providers import registry

class MinersConfig(AppConfig):
    default_auto_field = "django.db.models.BigAutoField"
    name = "miners"

    def ready(self):
        from .providers.quickbooks.provider import QuickBooksOAuth2Provider
        registry.register(QuickBooksOAuth2Provider)
