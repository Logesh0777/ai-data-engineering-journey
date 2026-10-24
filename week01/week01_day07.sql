-- SQL LEARNING JOURNEY
-- Week 01 - Day 07
-- Topic: CASE WHEN and Conditional Logic
-- Database: PostgreSQL
-- Table: customer


-- EXERCISE 1
-- Classify customers by annual spending


SELECT customer_name,
       annual_spend,
       CASE
           WHEN annual_spend > 90000 THEN 'Premium'
           WHEN annual_spend > 50000 THEN 'Regular'
           ELSE 'Budget'
       END AS customer_category
FROM customer;


-- EXERCISE 2
-- Classify customers and show the top 5 spenders


SELECT customer_name,
       annual_spend,
       CASE
           WHEN annual_spend > 90000 THEN 'Premium'
           WHEN annual_spend > 50000 THEN 'Regular'
           ELSE 'Budget'
       END AS customer_category
FROM customer
ORDER BY annual_spend DESC
LIMIT 5;


-- EXERCISE 3
-- Create four spending categories


SELECT customer_name,
       annual_spend,
       CASE
           WHEN annual_spend >= 100000 THEN 'Platinum'
           WHEN annual_spend >= 75000 THEN 'Gold'
           WHEN annual_spend >= 50000 THEN 'Silver'
           ELSE 'Bronze'
       END AS spending_category
FROM customer;


-- EXERCISE 4
-- Use CASE with multiple conditions


SELECT customer_name,
       state,
       annual_spend,
       CASE
           WHEN annual_spend >= 80000
                AND state = 'Tamil Nadu'
               THEN 'TN High Value'
           WHEN annual_spend >= 80000
               THEN 'High Value'
           WHEN annual_spend >= 50000
               THEN 'Regular'
           ELSE 'Budget'
       END AS customer_category
FROM customer;


-- EXERCISE 5
-- Top 5 customers from Tamil Nadu or Karnataka


SELECT customer_name,
       state,
       annual_spend,
       CASE
           WHEN annual_spend >= 100000 THEN 'Platinum'
           WHEN annual_spend >= 75000 THEN 'Gold'
           WHEN annual_spend >= 50000 THEN 'Silver'
           ELSE 'Bronze'
       END AS spending_category
FROM customer
WHERE state IN ('Tamil Nadu', 'Karnataka')
ORDER BY annual_spend DESC
LIMIT 5;


-- DAY 7 FINAL ASSESSMENT


-- Q1: High, Medium and Low spending levels

SELECT customer_name,
       annual_spend,
       CASE
           WHEN annual_spend >= 70000 THEN 'High'
           WHEN annual_spend >= 45000 THEN 'Medium'
           ELSE 'Low'
       END AS spending_level
FROM customer;


-- Q2: Premium customers with special Tamil Nadu category

SELECT customer_name,
       state,
       annual_spend,
       CASE
           WHEN annual_spend >= 80000
                AND state = 'Tamil Nadu'
               THEN 'TN Premium'
           WHEN annual_spend >= 80000
               THEN 'Premium'
           WHEN annual_spend >= 50000
               THEN 'Regular'
           ELSE 'Budget'
       END AS customer_category
FROM customer;


-- Q3: Platinum, Gold, Silver and Bronze categories

SELECT customer_name,
       annual_spend,
       CASE
           WHEN annual_spend >= 100000 THEN 'Platinum'
           WHEN annual_spend >= 75000 THEN 'Gold'
           WHEN annual_spend >= 50000 THEN 'Silver'
           ELSE 'Bronze'
       END AS spending_category
FROM customer;


-- Q4: Top 3 spenders from Tamil Nadu or Karnataka

SELECT customer_name,
       state,
       annual_spend,
       CASE
           WHEN annual_spend >= 100000 THEN 'Platinum'
           WHEN annual_spend >= 75000 THEN 'Gold'
           WHEN annual_spend >= 50000 THEN 'Silver'
           ELSE 'Bronze'
       END AS spending_category
FROM customer
WHERE state IN ('Tamil Nadu', 'Karnataka')
ORDER BY annual_spend DESC
LIMIT 3;


-- Q5: Return only VIP and Valuable customers

SELECT customer_name,
       city,
       annual_spend,
       CASE
           WHEN annual_spend >= 90000 THEN 'VIP'
           WHEN annual_spend >= 65000 THEN 'Valuable'
           ELSE 'Standard'
       END AS customer_category
FROM customer
WHERE annual_spend >= 65000
ORDER BY annual_spend DESC;



-- END OF WEEK 1 DAY 7
