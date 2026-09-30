-- 1. Branch Summary

SELECT
    COUNT(*) AS total_branches,
    COUNT(DISTINCT City) AS total_cities
FROM branches;


-- 2. Branch-wise Account Analysis

SELECT
    b.Branch_ID,
    b.Branch_Name,
    b.City,
    COUNT(a.Account_ID) AS total_accounts,
    ROUND(SUM(a.Balance), 2) AS total_balance,
    ROUND(AVG(a.Balance), 2) AS average_balance
FROM branches b
INNER JOIN accounts a
    ON b.Branch_ID = a.Branch_ID
GROUP BY
    b.Branch_ID,
    b.Branch_Name,
    b.City
ORDER BY total_balance DESC;


-- 3. Branch-wise Customer Analysis

SELECT
    b.Branch_ID,
    b.Branch_Name,
    b.City,
    COUNT(DISTINCT a.Customer_ID) AS total_customers
FROM branches b
INNER JOIN accounts a
    ON b.Branch_ID = a.Branch_ID
GROUP BY
    b.Branch_ID,
    b.Branch_Name,
    b.City
ORDER BY total_customers DESC;


-- 4. Branch-wise Transaction Analysis

SELECT
    b.Branch_ID,
    b.Branch_Name,
    b.City,
    COUNT(t.Transaction_ID) AS total_transactions,
    ROUND(SUM(t.Amount), 2) AS total_transaction_amount,
    ROUND(AVG(t.Amount), 2) AS average_transaction_amount
FROM branches b
INNER JOIN accounts a
    ON b.Branch_ID = a.Branch_ID
INNER JOIN transactions t
    ON a.Account_ID = t.Account_ID
GROUP BY
    b.Branch_ID,
    b.Branch_Name,
    b.City
ORDER BY total_transaction_amount DESC;


-- 5. Branch-wise Account Status Analysis

SELECT
    b.Branch_ID,
    b.Branch_Name,
    b.City,
    a.Account_Status,
    COUNT(a.Account_ID) AS total_accounts
FROM branches b
INNER JOIN accounts a
    ON b.Branch_ID = a.Branch_ID
GROUP BY
    b.Branch_ID,
    b.Branch_Name,
    b.City,
    a.Account_Status
ORDER BY
    b.Branch_ID,
    total_accounts DESC;
