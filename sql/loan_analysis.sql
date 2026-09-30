-- 1. Loan Summary

SELECT
    COUNT(*) AS total_loans,
    ROUND(SUM(Loan_Amount), 2) AS total_loan_amount,
    ROUND(AVG(Loan_Amount), 2) AS average_loan_amount,
    ROUND(MIN(Loan_Amount), 2) AS minimum_loan_amount,
    ROUND(MAX(Loan_Amount), 2) AS maximum_loan_amount
FROM loans;

-- 2. Loan Type Analysis

SELECT
    Loan_Type,
    COUNT(*) AS total_loans,
    ROUND(SUM(Loan_Amount), 2) AS total_loan_amount,
    ROUND(AVG(Loan_Amount), 2) AS average_loan_amount
FROM loans
GROUP BY Loan_Type
ORDER BY total_loan_amount DESC;


-- 3. Loan Status Analysis

SELECT
    Loan_Status,
    COUNT(*) AS total_loans,
    ROUND(SUM(Loan_Amount), 2) AS total_loan_amount,
    ROUND(AVG(Loan_Amount), 2) AS average_loan_amount
FROM loans
GROUP BY Loan_Status
ORDER BY total_loans DESC;


-- 4. Customer-wise Loan Analysis

SELECT
    c.Customer_ID,
    CONCAT(c.First_Name, ' ', c.Last_Name) AS customer_name,
    c.City,
    COUNT(l.Loan_ID) AS total_loans,
    ROUND(SUM(l.Loan_Amount), 2) AS total_loan_amount,
    ROUND(AVG(l.Loan_Amount), 2) AS average_loan_amount
FROM customers c
INNER JOIN loans l
    ON c.Customer_ID = l.Customer_ID
GROUP BY
    c.Customer_ID,
    c.First_Name,
    c.Last_Name,
    c.City
ORDER BY total_loan_amount DESC;


-- 5. City-wise Loan Analysis

SELECT
    c.City,
    COUNT(DISTINCT c.Customer_ID) AS total_customers,
    COUNT(l.Loan_ID) AS total_loans,
    ROUND(SUM(l.Loan_Amount), 2) AS total_loan_amount,
    ROUND(AVG(l.Loan_Amount), 2) AS average_loan_amount
FROM customers c
INNER JOIN loans l
    ON c.Customer_ID = l.Customer_ID
GROUP BY c.City
ORDER BY total_loan_amount DESC;SELECT
    c.City,
    COUNT(DISTINCT c.Customer_ID) AS total_customers,
    COUNT(l.Loan_ID) AS total_loans,
    ROUND(SUM(l.Loan_Amount), 2) AS total_loan_amount,
    ROUND(AVG(l.Loan_Amount), 2) AS average_loan_amount
FROM customers c
INNER JOIN loans l
    ON c.Customer_ID = l.Customer_ID
GROUP BY c.City
ORDER BY total_loan_amount DESC;
