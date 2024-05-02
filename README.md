Certainly! Below is the detailed documentation for each endpoint in your `AccountViewSet`. This documentation includes descriptions, request methods, URL patterns, required parameters, and example responses to help users understand how to interact with your API.

### AccountViewSet API Documentation

#### Overview
The `AccountViewSet` manages various aspects of user accounts including registration, email verification, password management, and user profile operations.

#### Base URL
Assuming a default setup, the base URL will typically be:
```
/api/accounts/
```

### Endpoints

#### Retrieve User Details
- Endpoint: `GET /get-user-details/`
- Authentication: Required (Bearer Token)
- Description: Fetches the authenticated user's details along with associated business information.
- Success Response:
  - Code: 200 OK
  - Content: `{ "user": {user details}, "businesses": [business details] }`
- Error Responses:
  - Code: 401 Unauthorized
  - Content: `{ "error": "Invalid token" }`
  - Code: 404 Not Found
  - Content: `{ "error": "Token decoding error" }`

#### User Signup
- Endpoint: `POST /signup/`
- Authentication: Not required
- Description: Registers a new user and sends an email verification link.
- Request Body:
  ```json
  {
    "username": "newuser",
    "email": "user@example.com",
    "password": "password123"
  }
  ```
- Success Response:
  - Code: 201 Created
  - Content: `{ "message": "Email verification link sent" }`
- Error Response:
  - Code: 500 Internal Server Error
  - Content: `{ "error": "Error description" }`

#### Send Verification Link
- Endpoint: `GET /{user_id}/getverificationlink/`
- Authentication: Required (Bearer Token)
- Description: Resends the verification email to the user.
- URL Parameters:
  - user_id [integer]: The ID of the user.
- Success Response:
  - Code: 201 Created
  - Content: `{ "message": "Email verification link sent" }`
- Error Response:
  - Code: 500 Internal Server Error
  - Content: `{ "error": "Error sending email" }`

#### Verify Email
- Endpoint: `GET /verify-email/{uidb64}/{token}/`
- Authentication: Not required
- Description: Verifies the user's email using a token sent to their email.
- URL Parameters:
  - uidb64 [string]: Base64 encoded user ID.
  - token [string]: Verification token.
- Success Response:
  - Code: 200 OK
  - Content: `{ "status": "User verified" }`
- Error Response:
  - Code: 400 Bad Request
  - Content: `{ "status": "error" }`

#### Request Password Change
- Endpoint: `POST /passwordchangerequest/`
- Authentication: Not required
- Description: Sends a password reset link to the user's email.
- Request Body:
  ```json
  {
    "email": "user@example.com"
  }
  ```
- Success Response:
  - Code: 200 OK
  - Content: `{ "statue": "Password reset link sent" }`
- Error Response:
  - Code: 404 Not Found
  - Content: `{ "status": "User with this email does not exist" }`

#### Confirm Password Change
- Endpoint: `POST /passwordchangeconfirm/{uidb64}/{token}/`
- Authentication: Not required
- Description: Changes the user's password using a valid token.
- URL Parameters:
  - uidb64 [string]: Base64 encoded user ID.
  - token [string]: Password reset token.
- Request Body:
  ```json
  {
    "new_password1": "newpassword123",
    "new_password2": "newpassword123"
  }
  ```
- Success Response:
  - Code: 200 OK
  - Content: `{ "status": "Password changed" }`
- Error Response:
  - Code: 400 Bad Request
  - Content: `{ "status": "Not authenticated or invalid input" }`

#### Password Reset (Authenticated Users)
- Endpoint: `POST /{user_id}/passwordreset/`
- Authentication: Required (Bearer Token)
- Description: Allows authenticated users to change their password.
- URL Parameters:
  - user_id [integer]: The ID of the user who is changing their password.
- Request Body:
  ```json
  {
    "old_password": "currentpassword",
    "new_password": "newpassword123",
    "confirm_new_password": "newpassword123"
  }
  ```
- Success Response:
  - Code: 200 OK
  - Content: `{ "success": "Password updated successfully" }`
- Error Responses:
  - Code: 400 Bad Request
  - Content: `{ "error": "Incorrect old password" }` or `{ "error": "New passwords do not match" }`

#### Edit Profile
- Endpoint: `PUT/PATCH /{user_id}/edit-profile/`
- Authentication: Required (Bearer Token)
- Description: Allows authenticated users to update their profile details.
- URL Parameters:
  - user_id [integer]: The ID of the user whose profile is being edited.
- Request Body (example for a PATCH request):
  ```json
  {
    "email": "updatedemail@example.com"
  }
  ```
- Success Response:
  - Code: 200 OK
  - Content: `{ "email": "updatedemail@example.com", ... }`
- Error Responses:
  - Code: 400 Bad Request
  - Content: `{ "errors": { field errors } }`
  - Code: 404 Not Found
  - Content: `{ "error": "User not found" }`



### IndustryViewSet API Documentation

#### Base URL
Assumes the base URL will be something like `/api/industries/`

#### Retrieve Industry Questions
- Endpoint: `GET /{industry_id}/questions/`
- Description: Retrieves the questions associated with a specific industry along with its categories.
- URL Parameters:
  - industry_id [integer]: The ID of the industry.
- Success Response:
  - Code: 200 OK
  - Content: Includes industry details and categories.
- Sample Call:
  ```bash
  curl -X GET http://<your-domain>/api/industries/{industry_id}/questions/
  ```

#### Add Category to Industry
- Endpoint: `POST /{industry_id}/add-category/`
- Description: Adds an existing category to an industry.
- URL Parameters:
  - industry_id [integer]: The ID of the industry.
- Request Body:
  ```json
  {
    "category_name": "Technology"
  }
  ```
- Success Response:
  - Code: 200 OK
  - Content: `{ "status": "Technology Category added to Software Industry" }`
- Sample Call:
  ```bash
  curl -X POST http://<your-domain>/api/industries/{industry_id}/add-category/ -d '{"category_name":"Technology"}'
  ```

#### Remove Category from Industry
- Endpoint: `GET /{industry_id}/remove-category/{category_id}/`
- Description: Removes a category from an industry.
- URL Parameters:
  - industry_id [integer]: The ID of the industry.
  - category_id [integer]: The ID of the category to be removed.
- Success Response:
  - Code: 200 OK
  - Content: `{ "status": "Software Industry removed from Category Technology" }`
- Sample Call:
  ```bash
  curl -X GET http://<your-domain>/api/industries/{industry_id}/remove-category/{category_id}/
  ```

### CategoryViewSet API Documentation

#### Base URL
Assumes the base URL will be something like `/api/categories/`

#### Add Question to Category
- Endpoint: `POST /{category_id}/add-question/`
- Description: Adds a question along with answer options to a specific category.
- URL Parameters:
  - category_id [integer]: The ID of the category.
- Request Body:
  ```json
  {
    "question": "What is the impact of technology?",
    "description": "Discuss the wide-ranging effects of technology on industry.",
    "options": [
      {"option_text": "Positive", "points": 5},
      {"option_text": "Negative", "points": -5}
    ]
  }
  ```
- Success Response:
  - Code: 200 OK
  - Content: `{ "status": "Question and options have been created" }`
- Sample Call:
  ```bash
  curl -X POST http://<your-domain>/api/categories/{category_id}/add-question/ -d '{"question":"What is the impact of technology?","description":"Discuss the impact.","options":[{"option_text":"Positive","points":5},{"option_text":"Negative","points":-5}]}'
  ```

#### Remove Question from Category
- Endpoint: `GET /{category_id}/remove-question/{question_id}/`
- Description: Removes a specific question from a category.
- URL Parameters:
  - category_id [integer]: The ID of the category.
  - question_id [integer]: The ID of the question to be removed.
- Success Response:
  - Code: 200 OK
  - Content: `{ "status": "Question removed" }`
- Sample Call:
  ```bash
  curl -X GET http://<your-domain>/api/categories/{category_id}/remove-question/{question_id}/
  ```

#### Edit Question in Category
Endpoint: POST /{category_id}/edit-question/{question_id}/
Description: Edits an existing question and its answer options within a category.
URL Parameters:
category_id [integer]: The ID of the category.
question_id [integer]: The ID of the question to be edited.
Request Body:
json
Copy code
{
  "question": "Updated question text",
  "description": "Updated description of the question",
  "answer_options": [
    {"id": 1, "option_text": "Updated option text", "points": 10},
    {"id": 2, "option_text": "Another updated option text", "points": 5}
  ]
}
Success Response:
Code: 200 OK
Content: { "status": "Question and options updated" }
Error Response:
Code: 400 Bad Request
Content: { "status": "Invalid data" }
Sample Call:
bash
Copy code
curl -X POST http://<your-domain>/api/categories/{category_id}/edit-question/{question_id}/ -H "Content-Type: application/json" -d '{"question":"Updated question text","description":"Updated description","answer_options":[{"id":1,"option_text":"Updated option text","points":10},{"id":2,"option_text":"Another updated option text","points":5}]}'
A