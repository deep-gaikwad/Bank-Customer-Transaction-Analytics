import os
import numpy as np
import pandas as pd

# Reproducible results
np.random.seed(42)

# Create data directory
os.makedirs("data", exist_ok=True)

# ============================================================
# 1. BRANCHES DATA
# ============================================================

branch_count = 50

branch_ids = [f"BR{str(i).zfill(3)}" for i in range(1, branch_count + 1)]

cities = [
    "Mumbai", "Pune", "Delhi", "Bengaluru", "Hyderabad",
    "Chennai", "Kolkata", "Ahmedabad", "Jaipur", "Surat"
]

states = [
    "Maharashtra", "Maharashtra", "Delhi", "Karnataka",
    "Telangana", "Tamil Nadu", "West Bengal", "Gujarat",
    "Rajasthan", "Gujarat"
]

branches = pd.DataFrame({
    "Branch_ID": branch_ids,
    "Branch_Name": [f"Branch {i}" for i in range(1, branch_count + 1)],
    "City": np.random.choice(cities, branch_count),
    "State": np.random.choice(states, branch_count),
    "Manager_Name": [
        f"Manager_{i}" for i in range(1, branch_count + 1)
    ]
})

branches.to_csv("data/branches.csv", index=False)


# ============================================================
# 2. CUSTOMERS DATA
# ============================================================

customer_count = 5000

customer_ids = [
    f"CUST{str(i).zfill(5)}"
    for i in range(1, customer_count + 1)
]

first_names = [
    "Aarav", "Vivaan", "Aditya", "Arjun", "Rahul",
    "Rohan", "Amit", "Kunal", "Sneha", "Priya",
    "Ananya", "Neha", "Pooja", "Isha", "Meera",
    "Kavya", "Simran", "Nisha", "Riya", "Aditi"
]

last_names = [
    "Sharma", "Patil", "Kadam", "Joshi", "More",
    "Gaikwad", "Deshmukh", "Pawar", "Jadhav", "Kulkarni",
    "Verma", "Singh", "Gupta", "Mehta", "Shah"
]

customer_gender = np.random.choice(
    ["Male", "Female"],
    customer_count,
    p=[0.55, 0.45]
)

customer_age = np.random.randint(18, 71, customer_count)

customer_city = np.random.choice(
    cities,
    customer_count
)

customer_income = np.random.randint(
    20000,
    250001,
    customer_count
)

customer_join_date = pd.to_datetime(
    np.random.choice(
        pd.date_range("2018-01-01", "2025-12-31"),
        customer_count
    )
)

customers = pd.DataFrame({
    "Customer_ID": customer_ids,
    "First_Name": np.random.choice(first_names, customer_count),
    "Last_Name": np.random.choice(last_names, customer_count),
    "Gender": customer_gender,
    "Age": customer_age,
    "City": customer_city,
    "Annual_Income": customer_income,
    "Join_Date": customer_join_date
})

customers.to_csv("data/customers.csv", index=False)


# ============================================================
# 3. ACCOUNTS DATA
# ============================================================

account_count = 6000

account_ids = [
    f"ACC{str(i).zfill(6)}"
    for i in range(1, account_count + 1)
]

account_customer_ids = np.random.choice(
    customer_ids,
    account_count
)

account_types = np.random.choice(
    ["Savings", "Current", "Salary"],
    account_count,
    p=[0.60, 0.20, 0.20]
)

account_branches = np.random.choice(
    branch_ids,
    account_count
)

opening_dates = pd.to_datetime(
    np.random.choice(
        pd.date_range("2018-01-01", "2025-12-31"),
        account_count
    )
)

balances = np.round(
    np.random.uniform(1000, 500000, account_count),
    2
)

account_status = np.random.choice(
    ["Active", "Inactive"],
    account_count,
    p=[0.93, 0.07]
)

accounts = pd.DataFrame({
    "Account_ID": account_ids,
    "Customer_ID": account_customer_ids,
    "Account_Type": account_types,
    "Branch_ID": account_branches,
    "Opening_Date": opening_dates,
    "Balance": balances,
    "Account_Status": account_status
})

accounts.to_csv("data/accounts.csv", index=False)


# ============================================================
# 4. TRANSACTIONS DATA
# ============================================================

transaction_count = 50000

transaction_ids = [
    f"TXN{str(i).zfill(7)}"
    for i in range(1, transaction_count + 1)
]

transaction_accounts = np.random.choice(
    account_ids,
    transaction_count
)

transaction_types = np.random.choice(
    ["Deposit", "Withdrawal", "Transfer", "Payment"],
    transaction_count,
    p=[0.35, 0.25, 0.20, 0.20]
)

transaction_amounts = np.round(
    np.random.uniform(100, 100000, transaction_count),
    2
)

transaction_dates = pd.to_datetime(
    np.random.choice(
        pd.date_range("2023-01-01", "2025-12-31"),
        transaction_count
    )
)

transaction_channels = np.random.choice(
    ["ATM", "Online", "Branch", "Mobile App", "UPI"],
    transaction_count,
    p=[0.20, 0.25, 0.15, 0.20, 0.20]
)

transaction_status = np.random.choice(
    ["Success", "Failed", "Pending"],
    transaction_count,
    p=[0.94, 0.04, 0.02]
)

transactions = pd.DataFrame({
    "Transaction_ID": transaction_ids,
    "Account_ID": transaction_accounts,
    "Transaction_Date": transaction_dates,
    "Transaction_Type": transaction_types,
    "Amount": transaction_amounts,
    "Channel": transaction_channels,
    "Transaction_Status": transaction_status
})

transactions.to_csv("data/transactions.csv", index=False)


# ============================================================
# 5. LOANS DATA
# ============================================================

loan_count = 2500

loan_ids = [
    f"LOAN{str(i).zfill(5)}"
    for i in range(1, loan_count + 1)
]

loan_customer_ids = np.random.choice(
    customer_ids,
    loan_count
)

loan_types = np.random.choice(
    ["Home Loan", "Personal Loan", "Car Loan", "Education Loan"],
    loan_count,
    p=[0.25, 0.35, 0.25, 0.15]
)

loan_amounts = np.round(
    np.random.uniform(50000, 5000000, loan_count),
    2
)

interest_rates = np.round(
    np.random.uniform(6.5, 15.0, loan_count),
    2
)

loan_dates = pd.to_datetime(
    np.random.choice(
        pd.date_range("2019-01-01", "2025-12-31"),
        loan_count
    )
)

loan_status = np.random.choice(
    ["Active", "Closed", "Defaulted"],
    loan_count,
    p=[0.65, 0.30, 0.05]
)

loan_tenure = np.random.choice(
    [12, 24, 36, 60, 84, 120, 180, 240],
    loan_count
)

loans = pd.DataFrame({
    "Loan_ID": loan_ids,
    "Customer_ID": loan_customer_ids,
    "Loan_Type": loan_types,
    "Loan_Amount": loan_amounts,
    "Interest_Rate": interest_rates,
    "Loan_Date": loan_dates,
    "Loan_Tenure_Months": loan_tenure,
    "Loan_Status": loan_status
})

loans.to_csv("data/loans.csv", index=False)


# ============================================================
# FINAL SUMMARY
# ============================================================

print("=" * 60)
print("BANKING DATASET GENERATED SUCCESSFULLY")
print("=" * 60)

print(f"Branches      : {len(branches):,}")
print(f"Customers     : {len(customers):,}")
print(f"Accounts      : {len(accounts):,}")
print(f"Transactions  : {len(transactions):,}")
print(f"Loans         : {len(loans):,}")

print("\nFiles created:")

for file in sorted(os.listdir("data")):
    print(f" - data/{file}")

print("\nDataset generation completed successfully!")
