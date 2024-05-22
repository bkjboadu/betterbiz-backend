from .base import *
import dj_database_url

SECRET_KEY = os.environ.get("SECRET_KEY", "")

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

# ALLOWED_HOSTS = []

ALLOWED_HOSTS = ["betterbiz-ffe47fd6d1ed.herokuapp.com", "localhost", "127.0.0.1",]


# DATABASES = {"default": dj_database_url.config(default=os.environ.get("JAWSDB_URL"))}

DATABASES = {
    'default': dj_database_url.config(default=os.environ.get('DATABASE_URL'))
}

