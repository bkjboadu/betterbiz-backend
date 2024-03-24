from .base import *

# SECURITY WARNING: keep the secret key used in production secret!
DEBUG = os.environ.get('DEBUT','false') == True
SECRET_KEY = os.environ.get('SECRET_KEY',"django-insecure-w!#&qu$p-)d5$oqi7qx-n1k$-=6r=+f@-hn0t#@^^zs#qr8ahn")

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = []

DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.mysql",
        "NAME": 'betterbiz',
        "USER": 'root',
        "PASSWORD": "",
        'HOST': 'localhost',
        'PORT': '3306'
    }
}