"""
WSGI config for betterbiz project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/5.0/howto/deployment/wsgi/
"""

import os

from django.core.wsgi import get_wsgi_application

if os.environ.get('DJANGO_ENV') == 'production':
    os.environ.setdefault("DJANGO_SETTINGS_MODULE", "betterbiz.settings.production")
else:    
    os.environ.setdefault("DJANGO_SETTINGS_MODULE", "betterbiz.settings.development")

application = get_wsgi_application()
