CREATE DATABASE IF NOT EXISTS bank_customer_analytics;

USE bank_customer_analytics;

-- ============================================================
-- 1. BRANCHES TABLE
-- ============================================================

DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS loans;
DROP TABLE IF EXISTS accounts;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS branches;

CREATE TABLE branches (
    Branch_ID VARCHAR(10) PRIMARY KEY,
    Branch_Name VARCHAR(100) NOT NULL,
    City VARCHAR(50) NOT NULL,
    State VARCHAR(50) NOT NULL,
    Manager_Name VARCHAR(100) NOT NULL
);

-- ============================================================
-- 2. CUSTOMERS TABLE
-- ============================================================

CREATE TABLE customers (
    Customer_ID VARCHAR(20) PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Gender VARCHAR(10),
    Age INT,
    City VARCHAR(50),
    Annual_Income DECIMAL(12,2),
    Join_Date DATE
);

-- ============================================================
-- 3. ACCOUNTS TABLE
-- ============================================================

CREATE TABLE accounts (
    Account_ID VARCHAR(20) PRIMARY KEY,
    Customer_ID VARCHAR(20) NOT NULL,
    Account_Type VARCHAR(20),
    Branch_ID VARCHAR(10) NOT NULL,
    Opening_Date DATE,
    Balance DECIMAL(15,2),
    Account_Status VARCHAR(20),

    CONSTRAINT fk_accounts_customer
        FOREIGN KEY (Customer_ID)
        REFERENCES customers(Customer_ID),

    CONSTRAINT fk_accounts_branch
        FOREIGN KEY (Branch_ID)
        REFERENCES branches(Branch_ID)
);

-- ============================================================
-- 4. TRANSACTIONS TABLE
-- ============================================================

CREATE TABLE transactions (
    Transaction_ID VARCHAR(20) PRIMARY KEY,
    Account_ID VARCHAR(20) NOT NULL,
    Transaction_Date DATE,
    Transaction_Type VARCHAR(20),
    Amount DECIMAL(15,2),
    Channel VARCHAR(30),
    Transaction_Status VARCHAR(20),

    CONSTRAINT fk_transactions_account
        FOREIGN KEY (Account_ID)
        REFERENCES accounts(Account_ID)
);

-- ============================================================
-- 5. LOANS TABLE
-- ============================================================

CREATE TABLE loans (
    Loan_ID VARCHAR(20) PRIMARY KEY,
    Customer_ID VARCHAR(20) NOT NULL,
    Loan_Type VARCHAR(30),
    Loan_Amount DECIMAL(15,2),
    Interest_Rate DECIMAL(5,2),
    Loan_Date DATE,
    Loan_Tenure_Months INT,
    Loan_Status VARCHAR(20),

    CONSTRAINT fk_loans_customer
        FOREIGN KEY (Customer_ID)
        REFERENCES customers(Customer_ID)
);

-- ============================================================
-- DATABASE CHECK
-- ============================================================

SHOW TABLES;
