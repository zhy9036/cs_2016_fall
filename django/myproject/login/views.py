import json

from django.contrib.auth import authenticate, login
from django.http.response import HttpResponseRedirect, HttpResponse
from django.shortcuts import render
from django.urls.base import reverse
from requests_oauthlib.oauth2_session import OAuth2Session
from django.contrib.auth.models import User
from .models import Profile

app_id = '869444346556321'
app_secret = '5752adb312dd7cca6ba2343c5bab9266'
CLIENT_ID = '869444346556321'
CLIENT_SECRET = '5752adb312dd7cca6ba2343c5bab9266'
REDIRECT_URL = 'http://localhost:8000/callback'
AUTHORIZATION_URL = 'https://graph.facebook.com/oauth/authorize'
TOKEN_URL = 'https://graph.facebook.com/oauth/access_token'
API_BASE_URL = 'https://graph.facebook.com/me'
fb_client = OAuth2Session(CLIENT_ID, redirect_uri=REDIRECT_URL)
# Create your views here.


def login_start(request):
    return render(request, 'login/login.html')


def facebook_login(request):
    a_url, state = fb_client.authorization_url(AUTHORIZATION_URL)
    return HttpResponseRedirect(a_url)


def oauth2_callback(request):
    exchange_code = request.GET['code']
    token = fb_client.fetch_token(TOKEN_URL,
          client_secret=CLIENT_SECRET, code=exchange_code, verify=False)

    access_token = token['access_token']
    #refresh_token = token['refresh_token']
    request.session['access_token'] = access_token
    #request.session['refresh_token'] = token['refresh_token']
    r = fb_client.get(API_BASE_URL+'?fields=first_name,last_name,email', verify=False)
    print(r.content)
    r = json.loads(r.content)
    fb_id = request.session['id'] = r['id']
    last_name = r['last_name']
    first_name = request.session['first_name'] = r['first_name']
    email = r['email'] if 'email' in r else ''
    try:
        User.objects.get(username=fb_id)

    except User.DoesNotExist:
        # create_user(USERNAME, EMAIL, PASSWORD)
        user = User.objects.create_user(fb_id, email, fb_id)
        user.first_name = first_name
        user.last_name = last_name
        user.save()
        profile = Profile()
        profile.user = user
        profile.fb_id = fb_id
        profile.first_name = first_name
        profile.last_name = last_name
        profile.save()
    user = authenticate(username=fb_id, password=fb_id)
    login(request, user)
    return HttpResponseRedirect(reverse('welcome'))


def welcome(request):
    return HttpResponse('welcome facebook user ' +
                        request.user.first_name + ' ' + request.user.username)
