--SQL LEARNING JOURNEY
-- Week 01 - Day 05
-- Topic: Advanced GROUP BY and Business Analysis
-- Database: PostgreSQL
-- Table: customer


-- EXERCISE 1
-- City-wise customer count, total and average spending
-- Concepts: COUNT, SUM, AVG, GROUP BY

SELECT city,
       COUNT(*) AS customer_count,
       SUM(annual_spend) AS total_spend,
       AVG(annual_spend) AS average_spend
FROM customer
GROUP BY city;

-- EXERCISE 2
-- Count and total spending by city
-- Only customers spending more than 50000
-- Concepts: WHERE, COUNT, SUM, GROUP BY

SELECT city,
       COUNT(*) AS customer_count,
       SUM(annual_spend) AS total_spend
FROM customer
WHERE annual_spend > 50000
GROUP BY city;

-- EXERCISE 3
-- Cities with at least 2 qualifying customers
-- Only customers spending more than 40000
-- Concepts: WHERE, GROUP BY, HAVING, COUNT

SELECT city,
       COUNT(*) AS customer_count
FROM customer
WHERE annual_spend > 40000
GROUP BY city
HAVING COUNT(*) >= 2;

-- EXERCISE 4
-- Cities with total spending above 100000
-- and average spending above 50000
-- Concepts: SUM, AVG, GROUP BY, HAVING, AND

SELECT city,
       SUM(annual_spend) AS total_spend,
       AVG(annual_spend) AS average_spend
FROM customer
GROUP BY city
HAVING SUM(annual_spend) > 100000
   AND AVG(annual_spend) > 50000;

-- EXERCISE 5
-- Sort cities by total annual spending
-- Highest spending first
-- Concepts: SUM, GROUP BY, ORDER BY, DESC

SELECT city,
       SUM(annual_spend) AS total_spend
FROM customer
GROUP BY city
ORDER BY total_spend DESC;

-- EXERCISE 6
-- Find the top 3 cities by total annual spending
-- Concepts: SUM, GROUP BY, ORDER BY, LIMIT

SELECT city,
       SUM(annual_spend) AS total_spend
FROM customer
GROUP BY city
ORDER BY total_spend DESC
LIMIT 3;

-- EXERCISE 7
-- Top 3 cities by total spending
-- Only cities with at least 2 customers
-- Concepts: COUNT, SUM, HAVING, ORDER BY, LIMIT

SELECT city,
       COUNT(*) AS customer_count,
       SUM(annual_spend) AS total_spend
FROM customer
GROUP BY city
HAVING COUNT(*) >= 2
ORDER BY total_spend DESC
LIMIT 3;

-- EXERCISE 8
-- Cities meeting three business conditions:
-- At least 2 customers
-- Total spending above 130000
-- Average spending above 60000
-- Concepts: COUNT, SUM, AVG, HAVING, AND

SELECT city,
       COUNT(*) AS customer_count,
       SUM(annual_spend) AS total_spend,
       AVG(annual_spend) AS average_spend
FROM customer
GROUP BY city
HAVING COUNT(*) >= 2
   AND SUM(annual_spend) > 130000
   AND AVG(annual_spend) > 60000;

-- EXERCISE 9
-- Tamil Nadu customers spending more than 50000
-- Count and total spending for each city
-- Sort by total spending, highest first
-- Concepts: WHERE, COUNT, SUM, GROUP BY, ORDER BY

SELECT city,
       COUNT(*) AS customer_count,
       SUM(annual_spend) AS total_spend
FROM customer
WHERE state = 'Tamil Nadu'
  AND annual_spend > 50000
GROUP BY city
ORDER BY total_spend DESC;

-- Note:
-- HAVING COUNT(*) >= 1 and
-- HAVING SUM(annual_spend) > 50000
-- are unnecessary here because WHERE already requires
-- each qualifying customer to spend more than 50000.

-- EXERCISE 10
-- Cities with at least 2 qualifying customers
-- Only customers spending more than 40000
-- Sort by average spending, highest first
-- Concepts: WHERE, COUNT, AVG, GROUP BY, HAVING

SELECT city,
       COUNT(*) AS customer_count,
       AVG(annual_spend) AS average_spend
FROM customer
WHERE annual_spend > 40000
GROUP BY city
HAVING COUNT(*) >= 2
ORDER BY average_spend DESC;

-- DAY 5 MAIN BUSINESS CHALLENGE
-- Top 3 cities by total annual spending
-- Only customers spending more than 45000
-- Only cities with at least 2 qualifying customers
-- Concepts: WHERE, COUNT, SUM, AVG, GROUP BY,
-- HAVING, ORDER BY, LIMIT

SELECT city,
       COUNT(*) AS customer_count,
       SUM(annual_spend) AS total_spend,
       AVG(annual_spend) AS average_spend
FROM customer
WHERE annual_spend > 45000
GROUP BY city
HAVING COUNT(*) >= 2
ORDER BY total_spend DESC
LIMIT 3;

-- DAY 5 FINAL ASSESSMENT

-- Q1: Customer count, total spending and average
-- spending for each state

SELECT state,
       COUNT(*) AS customer_count,
       SUM(annual_spend) AS total_spend,
       AVG(annual_spend) AS average_spend
FROM customer
GROUP BY state;


-- Q2: Number of customers in each city
-- Only customers spending more than 60000

SELECT city,
       COUNT(*) AS customer_count
FROM customer
WHERE annual_spend > 60000
GROUP BY city;


-- Q3: Cities with at least 2 customers
-- Show customer count and average spending

SELECT city,
       COUNT(*) AS customer_count,
       AVG(annual_spend) AS average_spend
FROM customer
GROUP BY city
HAVING COUNT(*) >= 2;


-- Q4: States with total annual spending
-- above 150000; highest total first

SELECT state,
       SUM(annual_spend) AS total_spend
FROM customer
GROUP BY state
HAVING SUM(annual_spend) > 150000
ORDER BY total_spend DESC;


-- Q5: Cities with at least 2 customers
-- Each qualifying customer's spending must exceed 50000

SELECT city,
       COUNT(*) AS customer_count,
       SUM(annual_spend) AS total_spend
FROM customer
WHERE annual_spend > 50000
GROUP BY city
HAVING COUNT(*) >= 2;


-- Q6: Top 3 cities by average annual spending

SELECT city,
       AVG(annual_spend) AS average_spend
FROM customer
GROUP BY city
ORDER BY average_spend DESC
LIMIT 3;


-- Q7: Top 2 cities for high-value customers
-- Eligible states: Tamil Nadu, Karnataka, Telangana
-- Individual annual spending must exceed 50000
-- Only cities with at least 2 qualifying customers
-- Rank by total annual spending

SELECT city,
       COUNT(*) AS customer_count,
       SUM(annual_spend) AS total_spend,
       AVG(annual_spend) AS average_spend
FROM customer
WHERE state IN ('Tamil Nadu', 'Karnataka', 'Telangana')
  AND annual_spend > 50000
GROUP BY city
HAVING COUNT(*) >= 2
ORDER BY total_spend DESC
LIMIT 2;


-- END OF WEEK 1 DAY 5