
json_string = '''
{
  "QueryResponse": {
    "Vendor": [
      {
        "Balance": 0,
        "Vendor1099": false,
        "CurrencyRef": {
          "value": "USD",
          "name": "United States Dollar"
        },
        "domain": "QBO",
        "sparse": false,
        "Id": "56",
        "SyncToken": "0",
        "MetaData": {
          "CreateTime": "2024-03-04T14:28:52-08:00",
          "LastUpdatedTime": "2024-03-04T14:28:52-08:00"
        },
        "DisplayName": "Bob's Burger Joint",
        "PrintOnCheckName": "Bob's Burger Joint",
        "Active": true,
        "V4IDPseudonym": "00209826f913f27b154a24a067b061293b0348"
      },
      {
        "BillAddr": {
          "Id": "31",
          "Line1": "15 Main St.",
          "City": "Palo Alto",
          "CountrySubDivisionCode": "CA",
          "PostalCode": "94303",
          "Lat": "37.445013",
          "Long": "-122.1391443"
        },
        "Balance": 0,
        "AcctNum": "1345",
        "Vendor1099": false,
        "CurrencyRef": {
          "value": "USD",
          "name": "United States Dollar"
        },
        "domain": "QBO",
        "sparse": false,
        "Id": "30",
        "SyncToken": "0",
        "MetaData": {
          "CreateTime": "2024-02-12T10:07:56-08:00",
          "LastUpdatedTime": "2024-02-17T11:13:46-08:00"
        },
        "GivenName": "Bessie",
        "FamilyName": "Williams",
        "CompanyName": "Books by Bessie",
        "DisplayName": "Books by Bessie",
        "PrintOnCheckName": "Books by Bessie",
        "Active": true,
        "V4IDPseudonym": "0020982553197a57e444a4b7e9cd950d3413d1",
        "PrimaryPhone": {
          "FreeFormNumber": "(650) 555-7745"
        },
        "PrimaryEmailAddr": {
          "Address": "Books@Intuit.com"
        },
        "WebAddr": {
          "URI": "http://www.booksbybessie.co"
        }
      },
      {
        "BillAddr": {
          "Id": "32",
          "Line1": "P.O. Box 5",
          "City": "Middlefield",
          "CountrySubDivisionCode": "CA",
          "PostalCode": "94482",
          "Lat": "43.8249453",
          "Long": "-79.2639122"
        },
        "Balance": 241.23,
        "AcctNum": "7653412",
        "Vendor1099": true,
        "CurrencyRef": {
          "value": "USD",
          "name": "United States Dollar"
        },
        "domain": "QBO",
        "sparse": false,
        "Id": "31",
        "SyncToken": "0",
        "MetaData": {
          "CreateTime": "2024-02-12T10:12:02-08:00",
          "LastUpdatedTime": "2024-02-16T15:28:48-08:00"
        },
        "GivenName": "Nick",
        "FamilyName": "Brosnahan",
        "CompanyName": "Brosnahan Insurance Agency",
        "DisplayName": "Brosnahan Insurance Agency",
        "PrintOnCheckName": "Brosnahan Insurance Agency",
        "Active": true,
        "V4IDPseudonym": "0020986f927d5d58b848339fb8984bc5eb8ff6",
        "PrimaryPhone": {
          "FreeFormNumber": "(650) 555-9912"
        },
        "Mobile": {
          "FreeFormNumber": "(650) 555-9874"
        },
        "Fax": {
          "FreeFormNumber": "(555) 123-4567"
        },
        "WebAddr": {
          "URI": "http://BrosnahanInsuranceAgency.org"
        }
      },
      {
        "BillAddr": {
          "Id": "33",
          "Line1": "10 Main St.",
          "City": "Palo Alto",
          "CountrySubDivisionCode": "CA",
          "PostalCode": "94303",
          "Lat": "37.445013",
          "Long": "-122.1391443"
        },
        "TermRef": {
          "value": "1"
        },
        "Balance": 0,
        "BillRate": 25,
        "Vendor1099": false,
        "CurrencyRef": {
          "value": "USD",
          "name": "United States Dollar"
        },
        "domain": "QBO",
        "sparse": false,
        "Id": "32",
        "SyncToken": "0",
        "MetaData": {
          "CreateTime": "2024-02-12T10:13:24-08:00",
          "LastUpdatedTime": "2024-02-19T12:55:23-08:00"
        },
        "CompanyName": "Cal Telephone",
        "DisplayName": "Cal Telephone",
        "PrintOnCheckName": "Cal Telephone",
        "Active": true,
        "V4IDPseudonym": "002098206bd26a27f14b63ac7553bcaeebaebd",
        "PrimaryPhone": {
          "FreeFormNumber": "(650) 555-1616"
        }
      },
      {
        "Balance": 0,
        "Vendor1099": false,
        "CurrencyRef": {
          "value": "USD",
          "name": "United States Dollar"
        },
        "domain": "QBO",
        "sparse": false,
        "Id": "33",
        "SyncToken": "0",
        "MetaData": {
          "CreateTime": "2024-02-12T10:13:52-08:00",
          "LastUpdatedTime": "2024-02-12T10:13:52-08:00"
        },
        "CompanyName": "Chin's Gas and Oil",
        "DisplayName": "Chin's Gas and Oil",
        "PrintOnCheckName": "Chin's Gas and Oil",
        "Active": true,
        "V4IDPseudonym": "002098ffd6931fff064aff824bb13103d52677"
      }
    ],
    "startPosition": 1,
    "maxResults": 5
  },
  "time": "2024-05-29T14:58:03.036-07:00"
}

'''

import json
data = json.loads(json_string)
data

# import requests

# url = "https://sandbox-quickbooks.api.intuit.com/v3/company/9341451981840406/query?minorversion=70"

# payload = "select * from vendor startposition 1 maxresults 5"
# headers = {
#   'User-Agent': 'QBOV3-OAuth2-Postman-Collection',
#   'Accept': 'application/json',
#   'Content-Type': 'application/text',
#   'Authorization': "Bearer eyJlbmMiOiJBMTI4Q0JDLUhTMjU2IiwiYWxnIjoiZGlyIn0..JliB-wNH_frzbEXnZJ5DJw.RogCJgSbpI4iI7N3E8oNtOzB3kZt9X9dbPExr7GvpYjXFFZJ9alpddJ19uEvl5a6mXdtkxcyOw7eV18kkIN7R5o9IBl9BPa7-UoS8EjcT7s0-wjFVfGIKpRw7av3odYt_CS1nQOLlaNVwLz3-mD77lf3GHH1F-mDMn7-nV4Y1ZVLXAWBrho8Tw6PtPEdgCKvwzL9esJ0E5dXvm64nm3wbDCCJ2-edWfFZswHNbfnCWawFFsTsiSjoq29H7WAk6wOvC6Q94UG0sjBehtClvwG80PhZf4DJqb5OK2hMOHULiCB96Kh4e6hnlzG3kJXdahBywpmPRkzMu6baH3NNXb8DEbOPeiC_fmKuipP2dJHFfMeqtmuVITexW80WrlRZfNw-Xwkb3HxoLLSIzsLRTmzNLbQvrxdyahovyvmffNleCttypRNnZzSCxAa9tht8uE4ZOeGxzqQPs-dxWw2xJxhXP2nlCbe5qWJ6-g93OZKHG7Udll9Yx45t6tntwhG03RmUABat3tjhSOIwIMQ6pEsIo3c2YkcQ8AaPvoXJ7vKWTN0kCtyr3B15pgIslwnjvrTVavqhW71AmtyO0yF14Zg4BFj9Fbl8vsvf1JdJX9O1LzgJGHowrtVPh5NLOuAuBloqNbzSFtvpZJ5NZ2gDHrAdANS-GRThiKjux5zFjqCwlFhjGhXHmpfyyaS07RU0RhW3gKkOueHtmgwtvdkSpMdAaW0Wqo0pDpj9RDbwVvn3n-XrrOOzzTgAQ0PeARrgquo.2cPGBg0lDW4kXD-IklNSzA"
# }

# response = requests.post(url, headers=headers, data=payload)

# print(response.json())