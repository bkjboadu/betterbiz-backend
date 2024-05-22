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

SOCIALACCOUNT_PROVIDERS = {
    'quickbooks': {
        'APP': {
            'client_id': 'ABiMYuCAE8GQ2V417AnfP4hKtuU2d2VCx1oRgqz5LntaOaG4Z8',
            'secret': 'tZ3g3VYHignJKSaP47hBVx4fpgruZ3xuyrKJnWzw',
            'redirect_uri': 'https://fa92-2604-3d09-6a77-4d00-c84a-7f02-602d-5b0d.ngrok-free.app/quickbooks/callback/',
            'key': ''
        }
    }
}


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
