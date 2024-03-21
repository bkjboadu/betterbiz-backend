API Documentation Template


API Endpoint: Sign Up
URL: http://127.0.0.1:8000/api/accounts/signup/
Method: POST
Description: This endpoint is used for creating new user accounts.
Body Parameters:
email: The email address of the user. (required)
password: The password for the account. (required)
name: The name of the user. (optional)
Success Response:
Code: 201 CREATED
Content: { message: "User created successfully." }
Error Response:
Code: 400 BAD REQUEST
Content: { message: "Invalid input data." }
Sample Call:
bash
Copy code
curl -X POST -H "Content-Type: application/json" -d '{"email": "brbojr@gmail.com", "password1": "password123","password2":"password123","name": "Bright Boadu"}' http://127.0.0.1:8000/api/signup/



API Endpoint: Log In
URL: http://127.0.0.1:8000/api/accounts/login/
Method: POST
Description: This endpoint is used for user authentication. On successful authentication, it returns a token.
Body Parameters:
email: The email address of the user. (required)
password: The password for the account. (required)
Success Response:
Code: 200 OK
Content: { token: "JWT_TOKEN_HERE" }
Error Response:
Code: 401 UNAUTHORIZED
Content: { error: "Invalid credentials." }
Sample Call:
bash
Copy code
curl -X POST -H "Content-Type: application/json" -d '{"email": "brbojr@gmail.com", "password": "password123"}' http://127.0.0.1:8000/api/login/

Password Change Request
Endpoint: POST /api/accounts/password-change-request/
Description: This endpoint is used to initiate a password change request. When a user wants to change their password, they need to call this endpoint with their email address.
Request Method: POST
Base URL: http://localhost:8000
Headers:
Content-Type: application/json
Request Body:
The request body must contain the user's email address in JSON format.
json

Password Change Confirm 
Endpoint: GET {{ the link sent to the user email }}
Description: This endpoint is used to set the new password. When a user wants to set their new password, they need to call this endpoint with their new password.
Request Method: POST
Base URL: http://localhost:8000
Headers:
Content-Type: application/json
Request Body:
The request body must contain the user's email address in JSON format.
json

API Endpoint: Retrieve Industries
URL: http://127.0.0.1:8000/api/question/industries
Method: GET
Description: This endpoint provides a list of all industries. It is designed to be accessed after successful authentication. When called, it returns a collection of industries available in the system.
Authentication Required: Yes
Body Parameters: None
Headers:
    Content-Type: application/json
    Authorization: Bearer <Your-Access-Token>
Success Response:
Code: 200 OK
    example:
    {
        "industries": [
            {
                "id": 1,
                "name": "E-commerce"
            },
            {
                "id": 2,
                "name": "Real estate agent"
            },
        ]
    }


API Endpoint: Retrieve Questions by Industry
URL: http://127.0.0.1:8000/api/question/industries/<int:pk>/
Method: GET
Description: This endpoint is utilized to fetch a list of questions associated with a specific industry. It requires authentication and the industry's unique identifier as a parameter in the URL.
Authentication Required: Yes
URL Parameters:
pk (integer): The unique identifier of the industry for which questions are being requested.
Headers:
Content-Type: application/json
Authorization: Bearer <Your-Access-Token>
Success Response:
Code: 200 OK
    example:
    {
        "industry": {
            "id": 1,
            "name": "E-commerce"
        },
        "categories": [
            {
                "category": "Business info",
                "questions": [
                    {
                        "question": "Business Audit",
                        "description": "A business audit is like a financial checkup, where experts review a company's records to ensure accuracy, honesty, and compliance with rules. It helps identify errors, fraud, and areas for improvement.",
                        "answer_options": [
                            {
                                "option_text": "Regular business audits"
                            },
                            {
                                "option_text": "Infrequent business audits"
                            }
                        ]
                    },
                    {
                        "question": "Business Structure",
                        "description": "A business structure refers to the legal and organizational framework of a company. It defines how the business is set up, managed, and taxed. Common structures include sole proprietorship, partnership, limited liability company (LLC), and corporation. Each structure has unique characteristics, impacting factors like liability, management, and taxation. Choosing the right business structure is crucial, as it affects how the company operates and its legal standing.",
                        "answer_options": [
                            {
                                "option_text": "Sole proprietorship"
                            },
                            {
                                "option_text": "Partnership"
                            },
                            {
                                "option_text": "Incorporation"
                            },
                            {
                                "option_text": "Not Registered"
                            }
                        ]
                    }
                ]
            },
        ]
    }


API Documentation: Register Business Endpoint
Endpoint Description
URL: http://localhost:8000/api/business/register-business/
Method: GET | POST
Authentication Required: Yes (Token Authentication)
Permissions: User must be authenticated
Purpose
This API endpoint is used for registering a new business entity in the system. It can handle both GET and POST requests, but the actual business registration functionality is implemented for the POST method. When accessed with a GET request, it can be used to fetch form data or details required for registration (implementation dependent).

Request Format
Headers
Content-Type: application/json

Authorization: Bearer <access_token>

Note: <access_token> should be replaced with the actual JWT token provided upon user authentication.

Body (for POST request)
name (string): Name of the business.
industry (integer): Industry identifier the business belongs to.
logo (string, optional): URL or path to the business logo.
date_founded (date): The founding date of the business in YYYY-MM-DD format.
street_address (string): Street address of the business.
city (string): City where the business is located.
state_province (string): State or province where the business is located.
postal_code (string): Postal code of the business address.
country (string): Country where the business is situated.
facebook_url (string, optional): URL to the business's Facebook page.
twitter_url (string, optional): URL to the business's Twitter profile.
linkedin_url (string, optional): URL to the business's LinkedIn profile.


API Documentation: Register Business Endpoint
Endpoint Description
URL: http://localhost:8000/api/business/register-business/
Method: GET | POST
Authentication Required: Yes (Token Authentication)
Permissions: User must be authenticated
Purpose
This API endpoint is used for registering a new business entity in the system. It can handle both GET and POST requests, but the actual business registration functionality is implemented for the POST method. When accessed with a GET request, it can be used to fetch form data or details required for registration (implementation dependent).

Request Format
Headers
Content-Type: application/json

Authorization: Bearer <access_token>

Note: <access_token> should be replaced with the actual JWT token provided upon user authentication.

Body (for POST request)
name (string): Name of the business.
industry (integer): Industry identifier the business belongs to.
logo (string, optional): URL or path to the business logo.
date_founded (date): The founding date of the business in YYYY-MM-DD format.
street_address (string): Street address of the business.
city (string): City where the business is located.
state_province (string): State or province where the business is located.
postal_code (string): Postal code of the business address.
country (string): Country where the business is situated.
facebook_url (string, optional): URL to the business's Facebook page.
twitter_url (string, optional): URL to the business's Twitter profile.
linkedin_url (string, optional): URL to the business's LinkedIn profile.
Example JSON body:

json
Copy code
{
    "name": "Linkedin inc",
    "industry": 7,
    "logo": "",
    "date_founded": "2022-01-01",
    "street_address": "123 Business St",
    "city": "Accra",
    "state_province": "Business State",
    "postal_code": "12345",
    "country": "Canada",
    "facebook_url": "http://meta.com/business",
    "twitter_url": "http://x.com/business",
    "linkedin_url": "http://linkedin.com/bright/"
}
Response Format
Status Code: 200 (OK) for a successful operation; other codes (e.g., 400, 401, 403, 500) may be returned on error.
Content:
On success: { "status": "business registered" }
On failure: { "status": "failed to register business", "errors": {...} } (details of errors, if any)