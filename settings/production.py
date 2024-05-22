from .base import *
import dj_database_url

SECRET_KEY = os.environ.get("SECRET_KEY", "")

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

# ALLOWED_HOSTS = []

ALLOWED_HOSTS = ["betterbiz-ffe47fd6d1ed.herokuapp.com", "localhost", "127.0.0.1",'105b-2604-3d09-6a77-4d00-74d3-cc37-d84f-af07.ngrok-free.app',]


DATABASES = {"default": dj_database_url.config(default=os.environ.get("JAWSDB_URL"))}
