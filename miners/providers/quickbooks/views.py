import requests
from django.shortcuts import redirect
from django.conf import settings
from django.urls import reverse
from django.http import JsonResponse
from django.contrib.auth.decorators import login_required
from miners.models import QuickBooksToken
import secrets
import logging
from business.models import Business
from rest_framework_simplejwt.tokens import AccessToken

logger = logging.getLogger(__name__)

@login_required
def quickbooks_login(request):
    print('Quickbooks login initiated')
    logger.debug('Quickbooks login initiated')
    authorization_url = "https://appcenter.intuit.com/connect/oauth2"
    client_id = settings.SOCIALACCOUNT_PROVIDERS['quickbooks']['APP']['client_id']
    redirect_uri = settings.SOCIALACCOUNT_PROVIDERS['quickbooks']['APP']['redirect_uri']
    scope = "com.intuit.quickbooks.accounting"
    state = secrets.token_urlsafe(16)
    business_id = request.GET.get('business_id')
    print(business_id)

    if not business_id:
        return JsonResponse({'error': 'business_id is required'}, status=400)

    params = {
        "client_id": client_id,
        "response_type": "code",
        "scope": scope,
        "redirect_uri": redirect_uri,
        "state": f"{state}|{business_id}", 
    }


    login_url = requests.Request('GET', authorization_url, params=params).prepare().url

    print(login_url)
    return redirect(login_url)


@login_required
def quickbooks_callback(request):

    logger.debug('Callback received')
    code = request.GET.get('code')
    state = request.GET.get('state')
    realm_id = request.GET.get('realmId')

    state_parts = state.split('|')
    business_id = state_parts[1]

    if not business_id:
        return JsonResponse({'error': 'business_id is required'}, status=400)
    

    token_url = "https://oauth.platform.intuit.com/oauth2/v1/tokens/bearer"
    client_id = settings.SOCIALACCOUNT_PROVIDERS['quickbooks']['APP']['client_id']
    client_secret = settings.SOCIALACCOUNT_PROVIDERS['quickbooks']['APP']['secret']
    redirect_uri = settings.SOCIALACCOUNT_PROVIDERS['quickbooks']['APP']['redirect_uri']

    print(redirect_uri)

    auth = (client_id, client_secret)
    
    headers = {'Accept': 'application/json'}
    data = {
        'grant_type': 'authorization_code',
        'code': code,
        'redirect_uri': redirect_uri
    }

    response = requests.post(token_url, auth=auth, headers=headers, data=data)
    tokens = response.json()
    access_token = tokens.get('access_token')
    

    user = request.user
    
    business = Business.objects.get(id=business_id)

    business.has_connected_quickbooks = True
    business.save()

    
    QuickBooksToken.objects.update_or_create(
        user=user,
        defaults={
            'access_token': access_token,
            'refresh_token': tokens['refresh_token'],
            'token_type': tokens['token_type'],
            'expires_in': tokens['expires_in'],
            'x_refresh_token_expires_in': tokens['x_refresh_token_expires_in'],
            'realm_id': realm_id,
            "business":business
        }
    )
    url = 'https://sandbox-quickbooks.api.intuit.com/v3/company/9341451981840406/query?minorversion=70'
    headers = {
        'Authorization': f'Bearer {access_token}',
        'Accept': 'application/json',
        'Content-Type': 'application/text',
        'User-Agent': 'QBOV3-OAuth2-Postman-Collection'
    }

    payload  = 'select * from vendor startposition 1 maxresults 5'
    response = requests.post(url, headers=headers,data=payload)
    print(response.status_code)

    response = requests.post(url, headers=headers,data=payload)
    print('headers',headers)
    print('payload',payload)
    print(response.status_code)
    

    query_string = request.META['QUERY_STRING']

    return JsonResponse(tokens)
    
    # dashboard_url = f"https://betterbiz.thelendingline.com/dashboard/?{query_string}"
    # return redirect(dashboard_url)


def refresh_quickbooks_token(user):
    token = QuickBooksToken.objects.get(user=user)
    refresh_token = token.refresh_token
    token_url = "https://oauth.platform.intuit.com/oauth2/v1/tokens/bearer"

    client_id = settings.SOCIALACCOUNT_PROVIDERS['quickbooks']['APP']['client_id']
    client_secret = settings.SOCIALACCOUNT_PROVIDERS['quickbooks']['APP']['secret']

    auth = (client_id, client_secret)
    headers = {'Accept': 'application/json'}
    data = {
        'grant_type': 'refresh_token',
        'refresh_token': refresh_token
    }

    response = requests.post(token_url, auth=auth, headers=headers, data=data)
    tokens = response.json()

    token.access_token = tokens['access_token']
    token.refresh_token = tokens['refresh_token']
    token.expires_in = tokens['expires_in']
    token.x_refresh_token_expires_in = tokens['x_refresh_token_expires_in']
    token.save()

    return token


def get_quickbooks_company_info(request):
    try:
        token = request.headers.get("Authorization").split(" ")[-1]
        decoded_token = AccessToken(token)
        user_id = decoded_token.get("user_id")
        print(user_id)

        if user_id:
            token = QuickBooksToken.objects.get(user=user_id)
            print(token)
    except QuickBooksToken.DoesNotExist:
        return JsonResponse({'error': 'No QuickBooks token found for user'}, status=400)
    
    

    access_token = token.access_token
    realm_id = token.realm_id  
    

    # url = f"https://quickbooks.api.intuit.com/v3/company/{realm_id}/companyinfo/{realm_id}"
    url = 'https://sandbox-quickbooks.api.intuit.com/v3/company/9341451981840406/query?minorversion=70'
    headers = {
        'Authorization': f'Bearer {access_token}',
        'Accept': 'application/json',
        'Content-Type': 'application/text',
        'User-Agent': 'QBOV3-OAuth2-Postman-Collection'
    }

    payload  = 'select * from vendor startposition 1 maxresults 5'

    response = requests.post(url, headers=headers,data=payload)
    print('headers',headers)
    print('payload',payload)
    print(response.status_code)
    if response.status_code == 401:
        token = refresh_quickbooks_token(user_id)
        access_token = token.access_token
        print(access_token)
        headers['Authorization'] = f'Bearer {access_token}'
        response = requests.get(url, headers=headers)
    
    if response.status_code == 200:
        data = response.json()
        token.quickbooks_data = data
        token.save()
        return JsonResponse(data)
    else:
        return JsonResponse({'error': 'Failed to fetch company info'}, status=response.status_code)

@login_required
def sync_quickbooks_customers(request):
    try:
        token = QuickBooksToken.objects.get(user=request.user)
    except QuickBooksToken.DoesNotExist:
        return JsonResponse({'error': 'No QuickBooks token found for user'}, status=400)

    access_token = token.access_token
    realm_id = token.realm_id  # Retrieve the stored realm_id

    url = f"https://quickbooks.api.intuit.com/v3/company/{realm_id}/query"
    query = "SELECT * FROM Customer"
    headers = {
        'Authorization': f'Bearer {access_token}',
        'Accept': 'application/json',
        'Content-Type': 'application/text'
    }

    response = requests.post(url, headers=headers, data=query)
    if response.status_code == 401:
        # Token expired, refresh it
        token = refresh_quickbooks_token(request.user)
        access_token = token.access_token
        headers['Authorization'] = f'Bearer {access_token}'
        response = requests.post(url, headers=headers, data=query)

    if response.status_code == 200:
        customers = response.json()
        # Process and save customers to your database
        return JsonResponse(customers)
    else:
        return JsonResponse({'error': 'Failed to fetch customers'}, status=response.status_code)
