-- SQL LEARNING JOURNEY
-- Week 01 - Day 06
-- Topic: SQL Revision and Business Analysis
-- Database: PostgreSQL
-- Table: customer



-- EXERCISE 1
-- Find the top 4 customers from Tamil Nadu or Karnataka
-- Annual spending must be between 40000 and 100000
-- Sort from highest to lowest spending
-- Concepts: IN, BETWEEN, ORDER BY, DESC, LIMIT


SELECT customer_name,
       city,
       annual_spend
FROM customer
WHERE state IN ('Tamil Nadu', 'Karnataka')
  AND annual_spend BETWEEN 40000 AND 100000
ORDER BY annual_spend DESC
LIMIT 4;



-- EXERCISE 2
-- Find customers who meet either condition:
-- 1. Chennai or Madurai and spending above 50000
-- 2. Bangalore and spending above 40000
-- Sort from highest to lowest spending
-- Concepts: IN, AND, OR, parentheses, ORDER BY


SELECT customer_name,
       city,
       annual_spend
FROM customer
WHERE (city IN ('Chennai', 'Madurai')
       AND annual_spend > 50000)
   OR (city = 'Bangalore'
       AND annual_spend > 40000)
ORDER BY annual_spend DESC;


-- EXERCISE 3
-- State-wise customer count and total spending
-- Consider only customers spending above 50000
-- Include states with at least 2 qualifying customers
-- Sort by total spending, highest first
-- Concepts: WHERE, COUNT, SUM, GROUP BY, HAVING


SELECT state,
       COUNT(*) AS customer_count,
       SUM(annual_spend) AS total_spend
FROM customer
WHERE annual_spend > 50000
GROUP BY state
HAVING COUNT(*) >= 2
ORDER BY total_spend DESC;


-- EXERCISE 4
-- Top 2 cities by average annual spending
-- Consider customers spending above 40000
-- Include cities with at least 2 qualifying customers
-- Concepts: WHERE, COUNT, AVG, GROUP BY, HAVING,
-- ORDER BY, DESC, LIMIT


SELECT city,
       COUNT(*) AS customer_count,
       AVG(annual_spend) AS average_spend
FROM customer
WHERE annual_spend > 40000
GROUP BY city
HAVING COUNT(*) >= 2
ORDER BY average_spend DESC
LIMIT 2;



-- EXERCISE 5 - FINAL BUSINESS CHALLENGE
-- Find the top 2 cities for high-value customers
--
-- Requirements:
-- 1. Customer name contains lowercase 'a'
-- 2. Annual spending is above 40000
-- 3. Group customers by city
-- 4. Calculate count, total and average spending
-- 5. Keep cities with at least 2 qualifying customers
-- 6. Total spending must exceed 100000
-- 7. Sort by total spending, highest first
-- 8. Return the top 2 cities
--
-- Concepts: LIKE, WHERE, COUNT, SUM, AVG,
-- GROUP BY, HAVING, ORDER BY, DESC, LIMIT


SELECT city,
       COUNT(*) AS customer_count,
       SUM(annual_spend) AS total_spend,
       AVG(annual_spend) AS average_spend
FROM customer
WHERE customer_name LIKE '%a%'
  AND annual_spend > 40000
GROUP BY city
HAVING COUNT(*) >= 2
   AND SUM(annual_spend) > 100000
ORDER BY total_spend DESC
LIMIT 2;


-- END OF WEEK 1 DAY 6

