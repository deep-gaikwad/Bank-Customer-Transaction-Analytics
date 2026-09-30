USE bank_customer_analytics;

-- 1. Account Summary

SELECT
    COUNT(*) AS total_accounts,
    COUNT(DISTINCT Customer_ID) AS unique_customers,
    ROUND(SUM(Balance), 2) AS total_balance,
    ROUND(AVG(Balance), 2) AS average_balance,
    ROUND(MIN(Balance), 2) AS minimum_balance,
    ROUND(MAX(Balance), 2) AS maximum_balance
FROM accounts;


-- 2. Account Type Analysis

SELECT
    Account_Type,
    COUNT(*) AS total_accounts,
    COUNT(DISTINCT Customer_ID) AS unique_customers,
    ROUND(SUM(Balance), 2) AS total_balance,
    ROUND(AVG(Balance), 2) AS average_balance
FROM accounts
GROUP BY Account_Type
ORDER BY total_accounts DESC;


-- 3. Account Status Analysis

SELECT
    Account_Status,
    COUNT(*) AS total_accounts,
    COUNT(DISTINCT Customer_ID) AS unique_customers,
    ROUND(SUM(Balance), 2) AS total_balance,
    ROUND(AVG(Balance), 2) AS average_balance
FROM accounts
GROUP BY Account_Status
ORDER BY total_accounts DESC;


-- 4. Branch-wise Account and Balance Analysis

SELECT
    b.Branch_ID,
    b.Branch_Name,
    b.City,
    b.State,
    COUNT(a.Account_ID) AS total_accounts,
    COUNT(DISTINCT a.Customer_ID) AS unique_customers,
    ROUND(SUM(a.Balance), 2) AS total_balance,
    ROUND(AVG(a.Balance), 2) AS average_balance
FROM branches b
LEFT JOIN accounts a
    ON b.Branch_ID = a.Branch_ID
GROUP BY
    b.Branch_ID,
    b.Branch_Name,
    b.City,
    b.State
ORDER BY total_balance DESC;
