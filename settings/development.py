from .base import *
import dj_database_url

# SECURITY WARNING: keep the secret key used in production secret!
DEBUG = os.environ.get("DEBUG", "false") == True
SECRET_KEY = os.environ.get(
    "SECRET_KEY", "django-insecure-w!#&qu$p-)d5$oqi7qx-n1k$-=6r=+f@-hn0t#@^^zs#qr8ahn"
)

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = [
    'localhost',
    '127.0.0.1',
    'fa92-2604-3d09-6a77-4d00-c84a-7f02-602d-5b0d.ngrok-free.app',
    # Add any other hosts you need
]




DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.mysql",
        "NAME": "betterbiz",
        "USER": "root",
        "PASSWORD": "",
        "HOST": "localhost",
        "PORT": "3306",
    }
}
