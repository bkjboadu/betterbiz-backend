from allauth.socialaccount.providers.oauth2.provider import OAuth2Provider

class QuickBooksOAuth2Provider(OAuth2Provider):
    id = 'quickbooks'  # This will be used as the provider_id
    name = 'QuickBooks'

    def get_default_scope(self):
        return [
            'com.intuit.quickbooks.accounting'
        ]

    def extract_uid(self, data):
        return str(data['realmId'])

    def extract_common_fields(self, data):
        return dict(email=data.get('email', ''))
