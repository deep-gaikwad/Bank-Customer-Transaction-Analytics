USE bank_customer_analytics;

-- 1. Customer Profile Summary

SELECT
    COUNT(*) AS total_customers,
    ROUND(AVG(Age), 2) AS average_age,
    ROUND(AVG(Annual_Income), 2) AS average_annual_income,
    ROUND(MIN(Annual_Income), 2) AS minimum_income,
    ROUND(MAX(Annual_Income), 2) AS maximum_income
FROM customers;

-- 2. Customer Count by Gender

SELECT
    Gender,
    COUNT(*) AS total_customers,
    ROUND(AVG(Age), 2) AS average_age,
    ROUND(AVG(Annual_Income), 2) AS average_annual_income
FROM customers
GROUP BY Gender
ORDER BY total_customers DESC;

-- 3. Customer Distribution by City

SELECT
    City,
    COUNT(*) AS total_customers,
    ROUND(AVG(Age), 2) AS average_age,
    ROUND(AVG(Annual_Income), 2) AS average_annual_income
FROM customers
GROUP BY City
ORDER BY total_customers DESC;

-- 4. Customer Distribution by Age Group

SELECT
    CASE
        WHEN Age < 25 THEN '18-24'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS age_group,
    COUNT(*) AS total_customers,
    ROUND(AVG(Annual_Income), 2) AS average_annual_income
FROM customers
GROUP BY age_group
ORDER BY
    CASE age_group
        WHEN '18-24' THEN 1
        WHEN '25-34' THEN 2
        WHEN '35-44' THEN 3
        WHEN '45-54' THEN 4
        WHEN '55+' THEN 5
    END;


-- 5. Customer Join Year Analysis

SELECT
    YEAR(Join_Date) AS join_year,
    COUNT(*) AS new_customers
FROM customers
GROUP BY YEAR(Join_Date)
ORDER BY join_year;


-- 6. Customer Segmentation by Annual Income

SELECT
    CASE
        WHEN Annual_Income < 50000 THEN 'Low Income'
        WHEN Annual_Income BETWEEN 50000 AND 99999 THEN 'Middle Income'
        WHEN Annual_Income BETWEEN 100000 AND 149999 THEN 'Upper Middle Income'
        ELSE 'High Income'
    END AS income_group,
    COUNT(*) AS total_customers,
    ROUND(AVG(Age), 2) AS average_age,
    ROUND(AVG(Annual_Income), 2) AS average_income
FROM customers
GROUP BY income_group
ORDER BY average_income;
