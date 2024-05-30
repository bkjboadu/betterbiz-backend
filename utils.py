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


def find_balance_sheet_data(balance_sheet_data):
    rows = balance_sheet_data.get('Rows', {}).get('Row', [])
    for row in rows:
        if 'Rows' in row:
            sub_rows = row['Rows'].get('Row', [])
            for sub_row in sub_rows:
                if 'Rows' in sub_row:
                    sub_sub_rows = sub_row['Rows'].get('Row', [])
                    for sub_sub_row in sub_sub_rows:
                        if 'Summary' in sub_sub_row and sub_sub_row.get('group') == 'AR':
                            summary = sub_sub_row['Summary'].get('ColData', [])
                            total_account_receivable = float(summary[1].get('value'))
                        if 'Summary' in sub_sub_row and sub_sub_row.get('group') == 'BankAccounts':
                            summary = sub_sub_row['Summary'].get('ColData', [])
                            total_bank_accounts =  float(summary[1].get('value'))
    return total_account_receivable,total_bank_accounts

def find_financial_data(data):
    total_expenses = None
    net_income = None
    
    rows = data.get('Rows', {}).get('Row', [])
    for row in rows:
        if 'Summary' in row:
            summary = row['Summary'].get('ColData', [])
            for col in summary:
                if col['value'] == 'Total Expenses':
                    total_expenses = summary[1]['value']
                elif col['value'] == 'Net Income':
                    net_income = summary[1]['value']
        if 'Rows' in row:
            sub_rows = row['Rows'].get('Row', [])
            for sub_row in sub_rows:
                if 'Summary' in sub_row:
                    summary = sub_row['Summary'].get('ColData', [])
                    for col in summary:
                        if col['value'] == 'Total Expenses':
                            total_expenses = summary[1]['value']
                        elif col['value'] == 'Net Income':
                            net_income = summary[1]['value']
    return total_expenses, net_income


def check_expenses_point(value=5237.31,options=[{'<$50,000': 6}, {'$50,000-$100,000': 12}, {'$100,000-$500,000': 18}, {'$500,000-$1 million': 24}, {'$1 million': 30}]):
    if value < 50000:
        return options[0]['<$50,000']
    elif 50000 <= value < 100000:
        return options[1]['$50,000-$100,000']
    elif 100000 <= value < 500000:
        return options[2]['$100,000-$500,000']
    elif 500000 <= value < 1000000:
        return options[3]['$500,000-$1 million']
    else:
        return options[4]['$1 million']

    return value

def check_netincome_point(value=5,options=[{'Less than 5%': 6},{'5-10%': 12},{'10-15%': 18},{'15-20%': 24},{'More than 20%': 30}]):
    if value < 5:
        return options[0]['Less than 5%']
    elif 5 <= value < 10:
        return options[1]['5-10%']
    elif 10 <= value < 15:
        return options[2]['10-15%']
    elif 15 <= value < 20:
        return options[3]['15-20%']
    else:
        return options[4]['More than 20%']

    return value

def check_annual_revenue_point(value=5281.52,options=[{'<$100,000': 6},{'$100,000-$500,000': 12},{'$500,000-$1 million': 18},{'$1 million-$5 million': 24},{'$5 million': 30}]):
    if value < 100000:
        return options[0]['<$100,000']
    elif 100000 <= value < 500000:
        return options[1]['$100,000-$500,000']
    elif 500000 <= value < 1000000:
        return options[2]['$500,000-$1 million']
    elif 1000000 <= value < 5000000:
        return options[3]['$1 million-$5 million']
    else:
        return options[4]['$5 million']

    return value

def check_cashflow_point(value=2001.54,options=[{'Negative cash flow': 6},{'Breakeven cash flow': 12},{'Positive cash flow': 18}]):
    if value < 0:
        return options[0]['Negative cash flow']
    elif value == 0:
        return options[1]['Breakeven cash flow']
    else:
        return options[2]['Positive cash flow']

    return value

def  update_user_response(user_response:dict,point:list,keys_to_update:list):
    for key,value in zip(keys_to_update,point):
        user_response['questions_to_score'][key] = value
    return user_response


    
def update_questionnaire(questions,userresponse,total_account_receivable,total_bank_accounts,total_expenses,net_income):
    expenses_options = questions['Please specify your expenses'] 
    revenues_options = questions['Please specify your annual revenues']
    cashflow_options = questions['Tell us about your Cash Flow']
    netprofit = questions['Tell us about your Net Profit']
    
    expenses_point = check_expenses_point(float(total_expenses),expenses_options)
    revenues_point = check_annual_revenue_point(float(total_account_receivable),revenues_options)
    cashflow_point = check_cashflow_point(float(total_bank_accounts),cashflow_options)
    netincome_point = check_netincome_point(float(net_income),netprofit)

    updated_userresponse = update_user_response(userresponse,[expenses_point,revenues_point,cashflow_point,netincome_point],['expenses','revenue', 'cashFlow','netProfit'])
    return updated_userresponse


# updated_response = update_questionnaire(questions['questions_to_score'],userresponse,total_account_receivable,total_bank_accounts,total_expenses,net_income)
# updated_response

profit_loss_report = {'Header': {'Time': '2024-05-29T15:21:25-07:00',
  'ReportName': 'ProfitAndLoss',
  'ReportBasis': 'Accrual',
  'StartPeriod': '2023-05-30',
  'EndPeriod': '2024-05-29',
  'SummarizeColumnsBy': 'Total',
  'Currency': 'USD',
  'Option': [{'Name': 'AccountingStandard', 'Value': 'GAAP'},
   {'Name': 'NoReportData', 'Value': 'false'}]},
 'Columns': {'Column': [{'ColTitle': '',
    'ColType': 'Account',
    'MetaData': [{'Name': 'ColKey', 'Value': 'account'}]},
   {'ColTitle': 'Total',
    'ColType': 'Money',
    'MetaData': [{'Name': 'ColKey', 'Value': 'total'}]}]},
 'Rows': {'Row': [{'Header': {'ColData': [{'value': 'Income'}, {'value': ''}]},
    'Rows': {'Row': [{'ColData': [{'value': 'Design income', 'id': '82'},
        {'value': '2250.00'}],
       'type': 'Data'},
      {'ColData': [{'value': 'Discounts given', 'id': '86'},
        {'value': '-89.50'}],
       'type': 'Data'},
      {'Header': {'ColData': [{'value': 'Landscaping Services', 'id': '45'},
         {'value': '1477.50'}]},
       'Rows': {'Row': [{'Header': {'ColData': [{'value': 'Job Materials',
             'id': '46'},
            {'value': ''}]},
          'Rows': {'Row': [{'ColData': [{'value': 'Fountains and Garden Lighting',
               'id': '48'},
              {'value': '2246.50'}],
             'type': 'Data'},
            {'ColData': [{'value': 'Plants and Soil', 'id': '49'},
              {'value': '2351.97'}],
             'type': 'Data'},
            {'ColData': [{'value': 'Sprinklers and Drip Systems', 'id': '50'},
              {'value': '138.00'}],
             'type': 'Data'}]},
          'Summary': {'ColData': [{'value': 'Total Job Materials'},
            {'value': '4736.47'}]},
          'type': 'Section'},
         {'Header': {'ColData': [{'value': 'Labor', 'id': '51'},
            {'value': ''}]},
          'Rows': {'Row': [{'ColData': [{'value': 'Installation', 'id': '52'},
              {'value': '250.00'}],
             'type': 'Data'},
            {'ColData': [{'value': 'Maintenance and Repair', 'id': '53'},
              {'value': '50.00'}],
             'type': 'Data'}]},
          'Summary': {'ColData': [{'value': 'Total Labor'},
            {'value': '300.00'}]},
          'type': 'Section'}]},
       'Summary': {'ColData': [{'value': 'Total Landscaping Services'},
         {'value': '6513.97'}]},
       'type': 'Section'},
      {'ColData': [{'value': 'Pest Control Services', 'id': '54'},
        {'value': '110.00'}],
       'type': 'Data'},
      {'ColData': [{'value': 'Sales of Product Income', 'id': '79'},
        {'value': '912.75'}],
       'type': 'Data'},
      {'ColData': [{'value': 'Services', 'id': '1'}, {'value': '503.55'}],
       'type': 'Data'}]},
    'Summary': {'ColData': [{'value': 'Total Income'}, {'value': '10200.77'}]},
    'type': 'Section',
    'group': 'Income'},
   {'Header': {'ColData': [{'value': 'Cost of Goods Sold'}, {'value': ''}]},
    'Rows': {'Row': [{'ColData': [{'value': 'Cost of Goods Sold', 'id': '80'},
        {'value': '405.00'}],
       'type': 'Data'}]},
    'Summary': {'ColData': [{'value': 'Total Cost of Goods Sold'},
      {'value': '405.00'}]},
    'type': 'Section',
    'group': 'COGS'},
   {'Summary': {'ColData': [{'value': 'Gross Profit'}, {'value': '9795.77'}]},
    'type': 'Section',
    'group': 'GrossProfit'},
   {'Header': {'ColData': [{'value': 'Expenses'}, {'value': ''}]},
    'Rows': {'Row': [{'ColData': [{'value': 'Advertising', 'id': '7'},
        {'value': '74.86'}],
       'type': 'Data'},
      {'Header': {'ColData': [{'value': 'Automobile', 'id': '55'},
         {'value': '113.96'}]},
       'Rows': {'Row': [{'ColData': [{'value': 'Fuel', 'id': '56'},
           {'value': '349.41'}],
          'type': 'Data'}]},
       'Summary': {'ColData': [{'value': 'Total Automobile'},
         {'value': '463.37'}]},
       'type': 'Section'},
      {'ColData': [{'value': 'Equipment Rental', 'id': '29'},
        {'value': '112.00'}],
       'type': 'Data'},
      {'ColData': [{'value': 'Insurance', 'id': '11'}, {'value': '241.23'}],
       'type': 'Data'},
      {'Header': {'ColData': [{'value': 'Job Expenses', 'id': '58'},
         {'value': '155.07'}]},
       'Rows': {'Row': [{'Header': {'ColData': [{'value': 'Job Materials',
             'id': '63'},
            {'value': ''}]},
          'Rows': {'Row': [{'ColData': [{'value': 'Decks and Patios',
               'id': '64'},
              {'value': '234.04'}],
             'type': 'Data'},
            {'ColData': [{'value': 'Plants and Soil', 'id': '66'},
              {'value': '353.12'}],
             'type': 'Data'},
            {'ColData': [{'value': 'Sprinklers and Drip Systems', 'id': '67'},
              {'value': '215.66'}],
             'type': 'Data'}]},
          'Summary': {'ColData': [{'value': 'Total Job Materials'},
            {'value': '802.82'}]},
          'type': 'Section'}]},
       'Summary': {'ColData': [{'value': 'Total Job Expenses'},
         {'value': '957.89'}]},
       'type': 'Section'},
      {'Header': {'ColData': [{'value': 'Legal & Professional Fees',
          'id': '12'},
         {'value': '75.00'}]},
       'Rows': {'Row': [{'ColData': [{'value': 'Accounting', 'id': '69'},
           {'value': '640.00'}],
          'type': 'Data'},
         {'ColData': [{'value': 'Bookkeeper', 'id': '70'}, {'value': '55.00'}],
          'type': 'Data'},
         {'ColData': [{'value': 'Lawyer', 'id': '71'}, {'value': '400.00'}],
          'type': 'Data'}]},
       'Summary': {'ColData': [{'value': 'Total Legal & Professional Fees'},
         {'value': '1170.00'}]},
       'type': 'Section'},
      {'Header': {'ColData': [{'value': 'Maintenance and Repair', 'id': '72'},
         {'value': '185.00'}]},
       'Rows': {'Row': [{'ColData': [{'value': 'Equipment Repairs',
            'id': '75'},
           {'value': '755.00'}],
          'type': 'Data'}]},
       'Summary': {'ColData': [{'value': 'Total Maintenance and Repair'},
         {'value': '940.00'}]},
       'type': 'Section'},
      {'ColData': [{'value': 'Meals and Entertainment', 'id': '13'},
        {'value': '28.49'}],
       'type': 'Data'},
      {'ColData': [{'value': 'Office Expenses', 'id': '15'},
        {'value': '18.08'}],
       'type': 'Data'},
      {'ColData': [{'value': 'Rent or Lease', 'id': '17'},
        {'value': '900.00'}],
       'type': 'Data'},
      {'Header': {'ColData': [{'value': 'Utilities', 'id': '24'},
         {'value': ''}]},
       'Rows': {'Row': [{'ColData': [{'value': 'Gas and Electric', 'id': '76'},
           {'value': '200.53'}],
          'type': 'Data'},
         {'ColData': [{'value': 'Telephone', 'id': '77'}, {'value': '130.86'}],
          'type': 'Data'}]},
       'Summary': {'ColData': [{'value': 'Total Utilities'},
         {'value': '331.39'}]},
       'type': 'Section'}]},
    'Summary': {'ColData': [{'value': 'Total Expenses'},
      {'value': '5237.31'}]},
    'type': 'Section',
    'group': 'Expenses'},
   {'Summary': {'ColData': [{'value': 'Net Operating Income'},
      {'value': '4558.46'}]},
    'type': 'Section',
    'group': 'NetOperatingIncome'},
   {'Header': {'ColData': [{'value': 'Other Expenses'}, {'value': ''}]},
    'Rows': {'Row': [{'ColData': [{'value': 'Miscellaneous', 'id': '14'},
        {'value': '2916.00'}],
       'type': 'Data'}]},
    'Summary': {'ColData': [{'value': 'Total Other Expenses'},
      {'value': '2916.00'}]},
    'type': 'Section',
    'group': 'OtherExpenses'},
   {'Summary': {'ColData': [{'value': 'Net Other Income'},
      {'value': '-2916.00'}]},
    'type': 'Section',
    'group': 'NetOtherIncome'},
   {'Summary': {'ColData': [{'value': 'Net Income'}, {'value': '1642.46'}]},
    'type': 'Section',
    'group': 'NetIncome'}]}}
    
balance_sheet_report = {'Header': {'Time': '2024-05-29T15:22:23-07:00',
  'ReportName': 'BalanceSheet',
  'ReportBasis': 'Accrual',
  'StartPeriod': '2023-05-30',
  'EndPeriod': '2024-05-29',
  'SummarizeColumnsBy': 'Total',
  'Currency': 'USD',
  'Option': [{'Name': 'AccountingStandard', 'Value': 'GAAP'},
   {'Name': 'NoReportData', 'Value': 'false'}]},
 'Columns': {'Column': [{'ColTitle': '',
    'ColType': 'Account',
    'MetaData': [{'Name': 'ColKey', 'Value': 'account'}]},
   {'ColTitle': 'Total',
    'ColType': 'Money',
    'MetaData': [{'Name': 'ColKey', 'Value': 'total'}]}]},
 'Rows': {'Row': [{'Header': {'ColData': [{'value': 'ASSETS'}, {'value': ''}]},
    'Rows': {'Row': [{'Header': {'ColData': [{'value': 'Current Assets'},
         {'value': ''}]},
       'Rows': {'Row': [{'Header': {'ColData': [{'value': 'Bank Accounts'},
            {'value': ''}]},
          'Rows': {'Row': [{'ColData': [{'value': 'Checking', 'id': '35'},
              {'value': '1201.00'}],
             'type': 'Data'},
            {'ColData': [{'value': 'Savings', 'id': '36'},
              {'value': '800.00'}],
             'type': 'Data'}]},
          'Summary': {'ColData': [{'value': 'Total Bank Accounts'},
            {'value': '2001.00'}]},
          'type': 'Section',
          'group': 'BankAccounts'},
         {'Header': {'ColData': [{'value': 'Accounts Receivable'},
            {'value': ''}]},
          'Rows': {'Row': [{'ColData': [{'value': 'Accounts Receivable (A/R)',
               'id': '84'},
              {'value': '5281.52'}],
             'type': 'Data'}]},
          'Summary': {'ColData': [{'value': 'Total Accounts Receivable'},
            {'value': '5281.52'}]},
          'type': 'Section',
          'group': 'AR'},
         {'Header': {'ColData': [{'value': 'Other Current Assets'},
            {'value': ''}]},
          'Rows': {'Row': [{'ColData': [{'value': 'Inventory Asset',
               'id': '81'},
              {'value': '596.25'}],
             'type': 'Data'},
            {'ColData': [{'value': 'Undeposited Funds', 'id': '4'},
              {'value': '2062.52'}],
             'type': 'Data'}]},
          'Summary': {'ColData': [{'value': 'Total Other Current Assets'},
            {'value': '2658.77'}]},
          'type': 'Section',
          'group': 'OtherCurrentAssets'}]},
       'Summary': {'ColData': [{'value': 'Total Current Assets'},
         {'value': '9941.29'}]},
       'type': 'Section',
       'group': 'CurrentAssets'},
      {'Header': {'ColData': [{'value': 'Fixed Assets'}, {'value': ''}]},
       'Rows': {'Row': [{'Header': {'ColData': [{'value': 'Truck', 'id': '37'},
            {'value': ''}]},
          'Rows': {'Row': [{'ColData': [{'value': 'Original Cost', 'id': '38'},
              {'value': '13495.00'}],
             'type': 'Data'}]},
          'Summary': {'ColData': [{'value': 'Total Truck'},
            {'value': '13495.00'}]},
          'type': 'Section'}]},
       'Summary': {'ColData': [{'value': 'Total Fixed Assets'},
         {'value': '13495.00'}]},
       'type': 'Section',
       'group': 'FixedAssets'}]},
    'Summary': {'ColData': [{'value': 'TOTAL ASSETS'}, {'value': '23436.29'}]},
    'type': 'Section',
    'group': 'TotalAssets'},
   {'Header': {'ColData': [{'value': 'LIABILITIES AND EQUITY'},
      {'value': ''}]},
    'Rows': {'Row': [{'Header': {'ColData': [{'value': 'Liabilities'},
         {'value': ''}]},
       'Rows': {'Row': [{'Header': {'ColData': [{'value': 'Current Liabilities'},
            {'value': ''}]},
          'Rows': {'Row': [{'Header': {'ColData': [{'value': 'Accounts Payable'},
               {'value': ''}]},
             'Rows': {'Row': [{'ColData': [{'value': 'Accounts Payable (A/P)',
                  'id': '33'},
                 {'value': '1602.67'}],
                'type': 'Data'}]},
             'Summary': {'ColData': [{'value': 'Total Accounts Payable'},
               {'value': '1602.67'}]},
             'type': 'Section',
             'group': 'AP'},
            {'Header': {'ColData': [{'value': 'Credit Cards'}, {'value': ''}]},
             'Rows': {'Row': [{'ColData': [{'value': 'Mastercard', 'id': '41'},
                 {'value': '157.72'}],
                'type': 'Data'}]},
             'Summary': {'ColData': [{'value': 'Total Credit Cards'},
               {'value': '157.72'}]},
             'type': 'Section',
             'group': 'CreditCards'},
            {'Header': {'ColData': [{'value': 'Other Current Liabilities'},
               {'value': ''}]},
             'Rows': {'Row': [{'ColData': [{'value': 'Arizona Dept. of Revenue Payable',
                  'id': '89'},
                 {'value': '0.00'}],
                'type': 'Data'},
               {'ColData': [{'value': 'Board of Equalization Payable',
                  'id': '90'},
                 {'value': '370.94'}],
                'type': 'Data'},
               {'ColData': [{'value': 'Loan Payable', 'id': '43'},
                 {'value': '4000.00'}],
                'type': 'Data'}]},
             'Summary': {'ColData': [{'value': 'Total Other Current Liabilities'},
               {'value': '4370.94'}]},
             'type': 'Section',
             'group': 'OtherCurrentLiabilities'}]},
          'Summary': {'ColData': [{'value': 'Total Current Liabilities'},
            {'value': '6131.33'}]},
          'type': 'Section',
          'group': 'CurrentLiabilities'},
         {'Header': {'ColData': [{'value': 'Long-Term Liabilities'},
            {'value': ''}]},
          'Rows': {'Row': [{'ColData': [{'value': 'Notes Payable', 'id': '44'},
              {'value': '25000.00'}],
             'type': 'Data'}]},
          'Summary': {'ColData': [{'value': 'Total Long-Term Liabilities'},
            {'value': '25000.00'}]},
          'type': 'Section',
          'group': 'LongTermLiabilities'}]},
       'Summary': {'ColData': [{'value': 'Total Liabilities'},
         {'value': '31131.33'}]},
       'type': 'Section',
       'group': 'Liabilities'},
      {'Header': {'ColData': [{'value': 'Equity'}, {'value': ''}]},
       'Rows': {'Row': [{'ColData': [{'value': 'Opening Balance Equity',
            'id': '34'},
           {'value': '-9337.50'}],
          'type': 'Data'},
         {'ColData': [{'value': 'Retained Earnings', 'id': '2'},
           {'value': '149.62'}],
          'type': 'Data'},
         {'ColData': [{'value': 'Net Income'}, {'value': '1492.84'}],
          'type': 'Data',
          'group': 'NetIncome'}]},
       'Summary': {'ColData': [{'value': 'Total Equity'},
         {'value': '-7695.04'}]},
       'type': 'Section',
       'group': 'Equity'}]},
    'Summary': {'ColData': [{'value': 'TOTAL LIABILITIES AND EQUITY'},
      {'value': '23436.29'}]},
    'type': 'Section',
    'group': 'TotalLiabilitiesAndEquity'}]}}


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