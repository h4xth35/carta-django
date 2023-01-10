from django.urls import path, include
from login.views import *

urlpatterns = [
    path("login/", LoginFormView.as_view(), name="login")
]
