from django.conf.urls import url, include
from django.contrib import admin
from django.views.generic.base import RedirectView

from . import views

urlpatterns = [
    url(r'^$', RedirectView.as_view(url='/login/', permanent=True)),
    url(r'^login/$', views.login_start),
    url(r'^login_facebook/$', views.facebook_login),
    url(r'^callback/$', views.oauth2_callback),
    url(r'^welcome/$', views.welcome, name='welcome'),
]
