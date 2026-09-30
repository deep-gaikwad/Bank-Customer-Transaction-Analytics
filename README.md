# Bank Customer Transaction Analytics

A complete end-to-end **Bank Customer Transaction Analytics** project focused on analyzing customers, accounts, transactions, branches, and loans using **SQL, Python, Pandas, and Matplotlib**.

The project demonstrates a practical data analytics workflow from database design and SQL analysis to data exploration, business insights, and data visualization.

---

## **Project Overview**

This project analyzes banking data across five connected datasets:

- Customers
- Accounts
- Transactions
- Branches
- Loans

The analysis focuses on customer profiles, account behavior, transaction patterns, branch performance, and loan activity.

---

## **Datasets**

### **1. Customers**

Customer demographic and income information.

**Key Fields:** Customer ID, First Name, Last Name, Gender, Age, City, Annual Income, Join Date

### **2. Accounts**

Customer bank account information.

**Key Fields:** Account ID, Customer ID, Account Type, Branch ID, Opening Date, Balance, Account Status

### **3. Transactions**

Customer banking transaction records.

**Key Fields:** Transaction ID, Account ID, Transaction Date, Transaction Type, Amount, Channel, Transaction Status

### **4. Branches**

Branch-level information.

**Key Fields:** Branch ID, Branch Name, City, State, Manager Name

### **5. Loans**

Customer loan information.

**Key Fields:** Loan ID, Customer ID, Loan Type, Loan Amount, Interest Rate, Loan Date, Loan Tenure, Loan Status

---

## **Tools & Technologies**

| Tool | Purpose |
|---|---|
| **MySQL** | Database management and SQL analysis |
| **Python** | Data analysis and processing |
| **Pandas** | Data cleaning and manipulation |
| **Matplotlib** | Data visualization |
| **Excel** | Data handling and analysis |
| **Git & GitHub** | Version control and project documentation |

---

## **SQL Analysis**

The project includes SQL queries covering important banking business questions.

### **Customer Analysis**
- Customer count by city
- Gender distribution
- Customer income analysis
- Customer demographic analysis
- High-income customer identification

### **Account Analysis**
- Account type distribution
- Active vs inactive accounts
- Account balance analysis
- Customer account relationships
- Branch-wise account analysis

### **Transaction Analysis**
- Transaction type analysis
- Total transaction amount
- Average transaction amount
- Transaction status analysis
- Transaction channel analysis
- Monthly transaction trends
- Customer transaction analysis
- High-value transaction identification

### **Branch Analysis**
- Branch-wise customer activity
- Branch account distribution
- Branch transaction analysis
- Branch performance analysis

### **Loan Analysis**
- Loan type distribution
- Loan status analysis
- Total loan amount
- Average loan amount
- Interest rate analysis
- Loan customer analysis
- Approved vs rejected loans

---

## **Python & Pandas Analysis**

Python and Pandas were used for:

- Loading datasets
- Data inspection
- Data cleaning
- Handling missing values
- Data type conversion
- Data aggregation
- GroupBy analysis
- Merging related datasets
- Statistical analysis
- Business insight generation

**Analysis Workflow:**

```text
Load Data
   ↓
Inspect Data
   ↓
Clean Data
   ↓
Transform Data
   ↓
Analyze Data
   ↓
Generate Insights
   ↓
Visualize Results
Matplotlib Visualizations
Visualizations Created
City-wise Customer Count — Bar Chart
Gender Distribution — Pie Chart
Age Distribution — Histogram
City-wise Annual Income — Bar Chart
Account Type Distribution — Bar Chart
Account Balance by Account Type — Bar Chart
Transaction Type Analysis — Bar Chart
Transaction Amount Distribution — Histogram
Monthly Transaction Trend — Line Chart
City-wise Transaction Amount — Bar Chart
Customer Income vs Account Balance — Scatter Plot
Transaction Amount vs Customer Income — Line Chart
Top 10 Customers by Transaction Amount — Horizontal Bar Chart
Loan Status Analysis — Stacked Bar Chart
Correlation Analysis — Heatmap-style Visualization
Key Business Areas
Customer Behavior

Analysis of customer demographics, age groups, cities, and annual income.

Account Performance

Analysis of account types, account status, and account balances.

Transaction Behavior

Analysis of transaction amounts, transaction types, channels, and transaction trends.

Branch Activity

Analysis of branch-level customer and account activity.

Loan Portfolio

Analysis of loan types, loan amounts, interest rates, and loan statuses.

Project Structure
Bank-Customer-Transaction-Analytics/
│
├── data/
├── sql/
├── python/
├── output/
├── Bank_Customer_Matplotlib_Analysis.ipynb
├── generate_bank_data.py
├── README.md
└── requirements.txt
Skills Demonstrated

SQL | MySQL | Database Design | Data Cleaning | Data Analysis | EDA | Pandas | Python | Matplotlib | Data Visualization | Business Analysis | Joins | Subqueries | Group By | Window Functions | Statistical Analysis | Git & GitHub

Learning Outcomes
Work with relational datasets
Write business-focused SQL queries
Analyze datasets using Pandas
Perform exploratory data analysis
Create meaningful visualizations
Identify patterns and trends
Translate raw data into business insights
Organize and document a professional analytics project
Conclusion

The Bank Customer Transaction Analytics project demonstrates an end-to-end approach to banking data analysis using SQL and Python.

By combining customer, account, transaction, branch, and loan data, the project provides a structured view of banking operations and customer behavior while demonstrating practical skills required for a Data Analyst role.

Author

Deep Gaikwad

Aspiring Data Analyst

Skills: Excel | SQL | Python | Pandas | Power BI | Data Analysis | Matplotlib
