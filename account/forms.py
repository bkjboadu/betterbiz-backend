from django.contrib.auth.forms import UserCreationForm
from .models import User

class SignupForm(UserCreationForm):
    class Meta:
        model = User
        fields = ('name','email','password1','password2')