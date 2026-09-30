USE bank_customer_analytics;

-- 1. Transaction Summary

SELECT
    COUNT(*) AS total_transactions,
    ROUND(SUM(Amount), 2) AS total_transaction_amount,
    ROUND(AVG(Amount), 2) AS average_transaction_amount,
    ROUND(MIN(Amount), 2) AS minimum_transaction_amount,
    ROUND(MAX(Amount), 2) AS maximum_transaction_amount
FROM transactions;


-- 2. Transaction Type Analysis

SELECT
    Transaction_Type,
    COUNT(*) AS total_transactions,
    ROUND(SUM(Amount), 2) AS total_amount,
    ROUND(AVG(Amount), 2) AS average_amount
FROM transactions
GROUP BY Transaction_Type
ORDER BY total_amount DESC;


-- 3. Transaction Status Analysis

SELECT
    Transaction_Status,
    COUNT(*) AS total_transactions,
    ROUND(SUM(Amount), 2) AS total_amount,
    ROUND(AVG(Amount), 2) AS average_amount
FROM transactions
GROUP BY Transaction_Status
ORDER BY total_transactions DESC;


-- 4. Monthly Transaction Analysis

SELECT
    YEAR(Transaction_Date) AS transaction_year,
    MONTH(Transaction_Date) AS transaction_month,
    COUNT(*) AS total_transactions,
    ROUND(SUM(Amount), 2) AS total_amount,
    ROUND(AVG(Amount), 2) AS average_amount
FROM transactions
GROUP BY
    YEAR(Transaction_Date),
    MONTH(Transaction_Date)
ORDER BY
    transaction_year,
    transaction_month;


-- 5. Customer Transaction Analysis

SELECT
    c.Customer_ID,
    CONCAT(c.First_Name, ' ', c.Last_Name) AS customer_name,
    c.City,
    c.Gender,
    COUNT(t.Transaction_ID) AS total_transactions,
    ROUND(SUM(t.Amount), 2) AS total_transaction_amount,
    ROUND(AVG(t.Amount), 2) AS average_transaction_amount
FROM customers c
INNER JOIN accounts a
    ON c.Customer_ID = a.Customer_ID
INNER JOIN transactions t
    ON a.Account_ID = t.Account_ID
GROUP BY
    c.Customer_ID,
    c.First_Name,
    c.Last_Name,
    c.City,
    c.Gender
ORDER BY total_transaction_amount DESC
LIMIT 1000;


-- 6. City-wise Transaction Analysis

SELECT
    c.City,
    COUNT(DISTINCT c.Customer_ID) AS total_customers,
    COUNT(t.Transaction_ID) AS total_transactions,
    ROUND(SUM(t.Amount), 2) AS total_transaction_amount,
    ROUND(AVG(t.Amount), 2) AS average_transaction_amount
FROM customers c
INNER JOIN accounts a
    ON c.Customer_ID = a.Customer_ID
INNER JOIN transactions t
    ON a.Account_ID = t.Account_ID
GROUP BY c.City
ORDER BY total_transaction_amount DESC;


-- 7. Transaction Channel Analysis

SELECT
    Channel,
    COUNT(*) AS total_transactions,
    ROUND(SUM(Amount), 2) AS total_amount,
    ROUND(AVG(Amount), 2) AS average_amount
FROM transactions
GROUP BY Channel
ORDER BY total_amount DESC;


-- 8. Account Type Transaction Analysis

SELECT
    a.Account_Type,
    COUNT(t.Transaction_ID) AS total_transactions,
    ROUND(SUM(t.Amount), 2) AS total_amount,
    ROUND(AVG(t.Amount), 2) AS average_amount
FROM accounts a
INNER JOIN transactions t
    ON a.Account_ID = t.Account_ID
GROUP BY a.Account_Type
ORDER BY total_amount DESC;


-- 9. High-Value Transaction Analysis

SELECT
    Transaction_ID,
    Account_ID,
    Transaction_Date,
    Transaction_Type,
    Amount,
    Channel,
    Transaction_Status
FROM transactions
ORDER BY Amount DESC
LIMIT 20;


-- 10. Account-wise Transaction Analysis

SELECT
    a.Account_ID,
    a.Customer_ID,
    a.Account_Type,
    COUNT(t.Transaction_ID) AS total_transactions,
    ROUND(SUM(t.Amount), 2) AS total_transaction_amount,
    ROUND(AVG(t.Amount), 2) AS average_transaction_amount
FROM accounts a
INNER JOIN transactions t
    ON a.Account_ID = t.Account_ID
GROUP BY
    a.Account_ID,
    a.Customer_ID,
    a.Account_Type
ORDER BY total_transaction_amount DESC
LIMIT 1000;
