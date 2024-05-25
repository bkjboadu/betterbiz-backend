# using SendGrid's Python Library
# https://github.com/sendgrid/sendgrid-python
import os
from sendgrid import SendGridAPIClient
from sendgrid.helpers.mail import Mail
from django.conf import settings


def send_email(to_emails, subject, content, from_email="bright@betterbizscore.com"):
    message = Mail(
        from_email=from_email,
        to_emails=to_emails,
        subject=subject,
        html_content=content,
    )
    try:
        sg = SendGridAPIClient(os.getenv("SENDGRID_API_KEY"))
        sg.send(message)
        return True
    except Exception as e:
        print(e)
        return e
{   "questions_with_no_scores":{
        "What Industry is your business in?": [],
    },
    "questions_to_score":{
    "Please tell us about your business": [
        {"Incorporated Company": 15},
        {"Sole Proprietor": 30}
    ],
    "How old is your business?": [
        {"0-1": 6},
        {"1-2": 12},
        {"3-5": 18},
        {"3-5": 24},
        {"10+": 30}
    ],
    "How often are you under audit?": [
        {"frequent Audits": 15},
        {"Infrequent Audits": 30}
    ],
    "Please specify your expenses": [
        {"<$50,000": 6},
        {"$50,000-$100,000": 12},
        {"$100,000-$500,000": 18},
        {"$500,000-$1 million": 24},
        {"$1 million": 30}
    ],
    "Please specify your annual revenues": [
        {"<$100,000": 6},
        {"$100,000-$500,000": 12},
        {"$500,000-$1 million": 18},
        {"$1 million-$5 million": 24},
        {"$5 million": 30}
    ],
    "How much working capital does your business have?": [
        {"Negative working capital": 6},
        {"$50,000-$100,000": 12},
        {"$100,000-$500,000": 18},
        {"$500,000-$1 million": 24},
        {"$1 million or more": 30},
        {"$50,000": 6}
    ],
    "Tell us about your Net Profit": [
        {"Less than 5%": 6},
        {"5-10%": 12},
        {"10-15%": 18},
        {"15-20%": 24},
        {"More than 20%": 30}
    ],
    "Tell us about your Cash Flow": [
        {"Negative cash flow": 6},
        {"Breakeven cash flow": 12},
        {"Positive cash flow": 18},
        {"Positive cash flow and growing": 24},
        {"Strong positive cash flow and growing": 30}
    ],
    "EBITDA (Earnings before interest, taxes, depreciation, and amortization)": [
        {"Positive EBITDA": 15},
        {"Negative EBITDA": 30}
    ],
    "Social Media Engagement": [
        {"Less than 1%": 6},
        {"2-3%": 12},
        {"More than 4%": 18},
        {"1-2%": 24},
        {"3-4%": 30}
    ],
    "Customer Acquisition": [
        {"Less than $100": 6},
        {"$100-$200": 12},
        {"$200-$500": 18},
        {"$500-$1000": 24},
        {"More than $1000": 30}
    ],
    "Web Traffic": [
        {"Less than 1,000 visitors per month": 6},
        {"1,000-5,000 visitors per month": 12},
        {"5,000-10,000 visitors per month": 18},
        {"10,000-50,000 visitors per month": 24},
        {"More than 50,000 visitors per month": 30}
    ],
    "Customer Lifetime Value (LTV)": [
        {"Less than $1000": 6},
        {"$1000-$2000": 12},
        {"$2000-$5000": 18},
        {"$5000-$10000": 24},
        {"More than $10000": 30}
    ],
    "CPC Cost Per Click": [
        {"$5": 6},
        {"$4-$3": 12},
        {"$2-$1": 18},
        {"$0.99-$0.50": 24},
        {"<$0.5": 30}
    ],
    "What is your business's repeat business rate?": [
        {"0-20%": 6},
        {"21-40%": 12},
        {"41-60%": 18},
        {"61-80%": 24},
        {"81-100%": 30}
    ],
    "Sales Conversion Rate": [
        {"Less than 10%": 6},
        {"10-20%": 12},
        {"20-30%": 18},
        {"30-40%": 24},
        {"More than 40%": 30}
    ],
    "Sales Growth": [
        {"Less than 5%": 6},
        {"5-10%": 12},
        {"10-20%": 18},
        {"20-30%": 24},
        {"30%": 30}
    ],
    "Upsell and Cross-Sell": [
        {"Less than 10%": 6},
        {"10-20%": 12},
        {"20-30%": 18},
        {"30-40%": 24},
        {"40%": 30}
    ],
    "Utilization Ratio": [
        {"10%": 7.5},
        {"10-30%": 15},
        {"30-50%": 22.5},
        {"50% above": 30}
    ],
    "Length of Credit History": [
        {"7 years above": 7.5},
        {"5-7 years": 15},
        {"2-5 years": 22.5},
        {"Less than 2 years": 30}
    ],
    "Inquiries": [
        {"None within 12 months": 7.5},
        {"1-2": 15},
        {"3-4": 22.5},
        {"5 or more": 30}
    ],
    "Collections": [
        {"1": 9.9},
        {"2-3": 19.8},
        {"4 or more": 29.7}
    ],
    "Tax Filing Accuracy": [
        {"1-2": 9.9},
        {"3-5": 19.8},
        {"6 or more": 29.7}
    ],
    "Audit Preparedness": [
        {"2-3": 9.9},
        {"4-5": 19.8},
        {"6 or more": 29.7}
    ],
    "Number of Security Incidents": [
        {"1-2": 9.9},
        {"3-5": 19.8},
        {"6 or more": 29.7}
    ],
    "Mean Time to Detect (MTTD)": [
        {"Good: 1 hour to 24 hours": 15},
        {"Fair: 1 day to 1 week": 22.5},
        {"Poor: More than 1 week": 30}
    ],
    "User Behavior Analytics (UBA)": [
        {"Good: 2-5 false positives per week": 15},
        {"Fair: 6-10 false positives per week": 22.5},
        {"Poor: More than 10 false positives per week": 30}
    ]
    }
}