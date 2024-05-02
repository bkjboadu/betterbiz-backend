from django.shortcuts import render,redirect
from requests_oauthlib import OAuth2Session
from django.conf import settings
from django.http import HttpResponse
import requests

def quickbooks_login(request):
    '''Redirect users to Quickbooks to authenticate'''
    scope = ['com.intuit.quickbooks.accounting']
    oauth = OAuth2Session(settings.QUICKBOOKS_CLIENT_ID,redirect_uri=settings.QUICKBOOKS_REDIRECT_URI,scope=scope)
    authorization_url, state = oauth.authorization_url('https://appcenter.intuit.com/connect/oauth2')

    request.session['oauth_state'] = state
    return authorization_url


def quickbooks_callback(request):
    '''Handle the callback from QuickBooks'''
    oauth = OAuth2Session(settings,QUICKBOOKS_CLIENT_ID,redirect_uri=settings.QUICKBOOKS_REDIRECT_URI,state = request.session['oauth_state'])
    token = oauth.fetch_token(
        'https://oauth.platform.intuit.com/oauth2/v1/tokens/bearer',
        authorization_response=request.build_absolute_uri(),
        client_secret=settings.QUICKBOOKS_CLIENT_SECRET
    )

    request.session['access_token'] = token['access_token']

    return HttpResponse("Authentication successfull and token saved")



def get_company_info(request):
    ''' Get company info from Quickbooks API using the access token'''
    access_token = request.session.get('access_token')
    if not access_token:
        return HttpResponse("No access token found",status=401)
    
    headers = {
        'Authorization': f"Bearer {access_token}",
        'Accept': 'application/json',
        'Content-Type': 'application/json'
    }
    
    response = requests.get('https://sandbox-quickbooks.api.intuit.com/v3/company/YOUR_REALM_ID/companyinfo/YOUR_REALM_ID', headers=headers)
    return HttpResponse(response.text)
