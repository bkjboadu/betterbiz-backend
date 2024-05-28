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

    auth = (client_id, client_secret)
    
    headers = {'Accept': 'application/json'}
    data = {
        'grant_type': 'authorization_code',
        'code': code,
        'redirect_uri': redirect_uri
    }

    response = requests.post(token_url, auth=auth, headers=headers, data=data)
    tokens = response.json()
    

    user = request.user
    business = Business.objects.get(id=business_id)

    business.has_connected_quickbooks = True
    business.save()

    

    # Save tokens to the database
    QuickBooksToken.objects.update_or_create(
        user=user,
        defaults={
            'access_token': tokens['access_token'],
            'refresh_token': tokens['refresh_token'],
            'token_type': tokens['token_type'],
            'expires_in': tokens['expires_in'],
            'x_refresh_token_expires_in': tokens['x_refresh_token_expires_in'],
            'realm_id': realm_id
        }
    )

    

    query_string = request.META['QUERY_STRING']
    dashboard_url = f"https://betterbiz.thelendingline.com/dashboard/?{query_string}"
    return redirect(dashboard_url)


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

@login_required
def get_quickbooks_company_info(request):
    try:
        token = QuickBooksToken.objects.get(user=request.user)
    except QuickBooksToken.DoesNotExist:
        return JsonResponse({'error': 'No QuickBooks token found for user'}, status=400)
    
    print(request.user)

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
        token = refresh_quickbooks_token(request.user)
        access_token = token.access_token
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

# import requests
# from django.shortcuts import redirect
# from django.conf import settings
# from django.urls import reverse
# from django.http import JsonResponse
# from django.contrib.auth.decorators import login_required
# from miners.models import QuickBooksToken
# from business.models import Business
# import secrets
# import logging
# from urllib.parse import urlencode
# from django.shortcuts import redirect, get_object_or_404

# logger = logging.getLogger(__name__)

# # @login_required
# # def quickbooks_login(request, business_id):
# #     print('Quickbooks login initiated')
# #     logger.debug('Quickbooks login initiated')
# #     authorization_url = "https://appcenter.intuit.com/connect/oauth2"
# #     client_id = settings.SOCIALACCOUNT_PROVIDERS['quickbooks']['APP']['client_id']
# #     redirect_uri = settings.SOCIALACCOUNT_PROVIDERS['quickbooks']['APP']['redirect_uri']
# #     scope = "com.intuit.quickbooks.accounting"
# #     state = secrets.token_urlsafe(16) + f'|{business_id}'

# #     params = {
# #         "client_id": client_id,
# #         "response_type": "code",
# #         "scope": scope,
# #         "redirect_uri": redirect_uri,
# #         "state": state
# #     }

# #     # quickbooks_login_url = requests.Request('GET', authorization_url, params=params).prepare().url
# #     # custom_login_url = reverse('custom_login', kwargs={'business_id': business_id}) + f'?next={quickbooks_login_url}'
# #     # return redirect(custom_login_url)
# #     login_url = requests.Request('GET', authorization_url, params=params).prepare().url
# #     print(login_url)
# #     return redirect(login_url)


# @login_required
# def quickbooks_login(request):
#     print('Quicbooks login initiated')
#     logger.debug('Quickbooks login initiated')
#     authorization_url = "https://appcenter.intuit.com/connect/oauth2"
#     client_id = settings.SOCIALACCOUNT_PROVIDERS['quickbooks']['APP']['client_id']
#     redirect_uri = settings.SOCIALACCOUNT_PROVIDERS['quickbooks']['APP']['redirect_uri']
#     scope = "com.intuit.quickbooks.accounting"
#     state = secrets.token_urlsafe(16)

#     print(redirect_uri)

#     params = {
#         "client_id": client_id,
#         "response_type": "code",
#         "scope": scope,
#         "redirect_uri": redirect_uri,
#         "state": state
#     }

#     login_url = requests.Request('GET', authorization_url, params=params).prepare().url
#     # return redirect('https://betterbiz.thelendingline.com/dashboard')
#     print(login_url)
#     return redirect(login_url)

# # @login_required
# # def quickbooks_callback(request):
# #     print('It connected')
# #     logger.debug('Callback received')
# #     code = request.GET.get('code')
# #     state = request.GET.get('state')
# #     realm_id = request.GET.get('realmId')

# #     # Extract business_id from state
# #     state_parts = state.split('|')
# #     if len(state_parts) == 2:
# #         state, business_id = state_parts
# #     else:
# #         business_id = None

# #     token_url = "https://oauth.platform.intuit.com/oauth2/v1/tokens/bearer"
# #     client_id = settings.SOCIALACCOUNT_PROVIDERS['quickbooks']['APP']['client_id']
# #     client_secret = settings.SOCIALACCOUNT_PROVIDERS['quickbooks']['APP']['secret']
# #     redirect_uri = settings.SOCIALACCOUNT_PROVIDERS['quickbooks']['APP']['redirect_uri']

# #     auth = (client_id, client_secret)
# #     headers = {'Accept': 'application/json'}
# #     data = {
# #         'grant_type': 'authorization_code',
# #         'code': code,
# #         'redirect_uri': redirect_uri
# #     }

# #     response = requests.post(token_url, auth=auth, headers=headers, data=data)
# #     tokens = response.json()
# #     print(tokens)

# #     user = request.user
# #     business = Business.objects.get(id=business_id)

# #     # Save tokens to the database
# #     QuickBooksToken.objects.update_or_create(
# #         user=user,
# #         business=business,
# #         defaults={
# #             'access_token': tokens['access_token'],
# #             'refresh_token': tokens['refresh_token'],
# #             'token_type': tokens['token_type'],
# #             'expires_in': tokens['expires_in'],
# #             'x_refresh_token_expires_in': tokens['x_refresh_token_expires_in'],
# #             'realm_id': realm_id
# #         }
# #     )

# #     business.has_connected_quickbooks = True
# #     business.save()

# #     query_string = request.META['QUERY_STRING']
# #     dashboard_url = f"https://betterbiz.thelendingline.com/dashboard/?{query_string}"
# #     # return redirect(dashboard_url)
# #     return JsonResponse(tokens)


# # @login_required
# # def quickbooks_callback(request):
# #     print('It connected')
# #     logger.debug('Callback received')
# #     code = request.GET.get('code')
# #     state = request.GET.get('state')
# #     realm_id = request.GET.get('realmId')

# #     token_url = "https://oauth.platform.intuit.com/oauth2/v1/tokens/bearer"
# #     client_id = settings.SOCIALACCOUNT_PROVIDERS['quickbooks']['APP']['client_id']
# #     client_secret = settings.SOCIALACCOUNT_PROVIDERS['quickbooks']['APP']['secret']
# #     redirect_uri = settings.SOCIALACCOUNT_PROVIDERS['quickbooks']['APP']['redirect_uri']

# #     auth = (client_id, client_secret)
# #     print('auth',auth)
# #     headers = {'Accept': 'application/json'}
# #     data = {
# #         'grant_type': 'authorization_code',
# #         'code': code,
# #         'redirect_uri': redirect_uri
# #     }

# #     response = requests.post(token_url, auth=auth, headers=headers, data=data)
# #     tokens = response.json()
# #     print(tokens)

# #     user = request.user

# #     # Save tokens to the database
# #     QuickBooksToken.objects.update_or_create(
# #         user=user,
# #         defaults={
# #             'access_token': tokens['access_token'],
# #             'refresh_token': tokens['refresh_token'],
# #             'token_type': tokens['token_type'],
# #             'expires_in': tokens['expires_in'],
# #             'x_refresh_token_expires_in': tokens['x_refresh_token_expires_in'],
# #             'realm_id': realm_id
# #         }
# #     )

# #     # user.quickbooks = True
# #     # user.save()

# #     query_string = request.META['QUERY_STRING']
# #     dashboard_url = f"https://betterbiz.thelendingline.com/dashboard/?{query_string}"
# #     # return redirect(dashboard_url)
# #     return JsonResponse(tokens)
# #     # return redirect('https://betterbiz.thelendingline.com/dashboard')

# def refresh_quickbooks_token(user):
#     token = QuickBooksToken.objects.get(user=user)
#     refresh_token = token.refresh_token
#     token_url = "https://oauth.platform.intuit.com/oauth2/v1/tokens/bearer"

#     client_id = settings.SOCIALACCOUNT_PROVIDERS['quickbooks']['APP']['client_id']
#     client_secret = settings.SOCIALACCOUNT_PROVIDERS['quickbooks']['APP']['secret']

#     auth = (client_id, client_secret)
#     headers = {'Accept': 'application/json'}
#     data = {
#         'grant_type': 'refresh_token',
#         'refresh_token': refresh_token
#     }

#     response = requests.post(token_url, auth=auth, headers=headers, data=data)
#     tokens = response.json()

#     token.access_token = tokens['access_token']
#     token.refresh_token = tokens['refresh_token']
#     token.expires_in = tokens['expires_in']
#     token.x_refresh_token_expires_in = tokens['x_refresh_token_expires_in']
#     token.save()

#     return token

# @login_required
# def get_quickbooks_company_info(request):
#     try:
#         token = QuickBooksToken.objects.get(user=request.user)
#     except QuickBooksToken.DoesNotExist:
#         return JsonResponse({'error': 'No QuickBooks token found for user'}, status=400)
    
#     print(request.user)

#     access_token = token.access_token
#     realm_id = token.realm_id  
    

#     # url = f"https://quickbooks.api.intuit.com/v3/company/{realm_id}/companyinfo/{realm_id}"
#     url = 'https://sandbox-quickbooks.api.intuit.com/v3/company/9341451981840406/query?minorversion=70'
#     headers = {
#         'Authorization': f'Bearer {access_token}',
#         'Accept': 'application/json',
#         'Content-Type': 'application/text',
#         'User-Agent': 'QBOV3-OAuth2-Postman-Collection'
#     }

#     payload  = 'select * from vendor startposition 1 maxresults 5'

#     response = requests.post(url, headers=headers,data=payload)
#     print('headers',headers)
#     print('payload',payload)
#     print(response.status_code)
#     if response.status_code == 401:
#         token = refresh_quickbooks_token(request.user)
#         access_token = token.access_token
#         headers['Authorization'] = f'Bearer {access_token}'
#         response = requests.get(url, headers=headers)
    
#     if response.status_code == 200:
#         data = response.json()
#         token.quickbooks_data = data
#         token.save()
#         return JsonResponse(data)
#     else:
#         return JsonResponse({'error': 'Failed to fetch company info'}, status=response.status_code)

# @login_required
# def sync_quickbooks_customers(request):
#     try:
#         token = QuickBooksToken.objects.get(user=request.user)
#     except QuickBooksToken.DoesNotExist:
#         return JsonResponse({'error': 'No QuickBooks token found for user'}, status=400)

#     access_token = token.access_token
#     realm_id = token.realm_id  # Retrieve the stored realm_id

#     url = f"https://quickbooks.api.intuit.com/v3/company/{realm_id}/query"
#     query = "SELECT * FROM Customer"
#     headers = {
#         'Authorization': f'Bearer {access_token}',
#         'Accept': 'application/json',
#         'Content-Type': 'application/text'
#     }

#     response = requests.post(url, headers=headers, data=query)
#     if response.status_code == 401:
#         # Token expired, refresh it
#         token = refresh_quickbooks_token(request.user)
#         access_token = token.access_token
#         headers['Authorization'] = f'Bearer {access_token}'
#         response = requests.post(url, headers=headers, data=query)

#     if response.status_code == 200:
#         customers = response.json()
#         # Process and save customers to your database
#         return JsonResponse(customers)
#     else:
#         return JsonResponse({'error': 'Failed to fetch customers'}, status=response.status_code)
