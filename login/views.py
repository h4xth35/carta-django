from django.shortcuts import render
from django.contrib.auth.views import LoginView, LogoutView


# Create your views here.
class LoginFormView(LoginView):
    
        template_name = "includes/login.html"

        def get_context_data(self, **kwargs):
            context = super().get_context_data(**kwargs)
            context["title"] = 'Iniciar Session'
            return context
        
    