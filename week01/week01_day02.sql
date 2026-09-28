
-- WEEK 1 - DAY 2
-- SQL CONDITIONS



-- Exercise 1
-- Find customers from Tamil Nadu who spend more than 60000

SELECT customer_name, annual_spend
FROM customer
WHERE state = 'Tamil Nadu'
AND annual_spend > 60000;


-- Exercise 2
-- Find customers from Chennai who spend more than 50000

SELECT customer_name, annual_spend
FROM customer
WHERE city = 'Chennai'
AND annual_spend > 50000;


-- Exercise 3
-- Find customers from Chennai or Bangalore

SELECT customer_name, city
FROM customer
WHERE city = 'Chennai'
OR city = 'Bangalore';


-- Exercise 4
-- Find customers from Coimbatore or Madurai

SELECT customer_name, city
FROM customer
WHERE city = 'Coimbatore'
OR city = 'Madurai';


-- Exercise 5
-- Use IN for Coimbatore and Madurai

SELECT customer_name, city
FROM customer
WHERE city IN ('Coimbatore', 'Madurai');


-- Exercise 6
-- Customer IDs 2, 4, 7, 9

SELECT customer_name
FROM customer
WHERE customer_id IN (2, 4, 7, 9);


-- Exercise 7
-- Spending between 50000 and 90000

SELECT customer_name, annual_spend
FROM customer
WHERE annual_spend BETWEEN 50000 AND 90000;


-- Exercise 8
-- Tamil Nadu customers spending between 40000 and 80000

SELECT customer_name
FROM customer
WHERE state = 'Tamil Nadu'
AND annual_spend BETWEEN 40000 AND 80000;


-- Exercise 9
-- Chennai or Bangalore AND spending > 60000

SELECT customer_name
FROM customer
WHERE city IN ('Chennai', 'Bangalore')
AND annual_spend > 60000;


-- Exercise 10
-- Chennai, Coimbatore or Bangalore AND spending > 50000

SELECT customer_name
FROM customer
WHERE city IN ('Chennai', 'Coimbatore', 'Bangalore')
AND annual_spend > 50000;


-- DAY 2 MAIN BUSINESS CHALLENGE

SELECT customer_name, city, annual_spend
FROM customer
WHERE city IN ('Chennai', 'Coimbatore', 'Bangalore')
AND annual_spend BETWEEN 50000 AND 100000
ORDER BY annual_spend DESC;


-- ASSESSMENT A

SELECT customer_name, annual_spend
FROM customer
WHERE state = 'Tamil Nadu'
AND annual_spend BETWEEN 50000 AND 90000;


-- ASSESSMENT B

SELECT customer_name
FROM customer
WHERE city IN ('Chennai', 'Bangalore', 'Hyderabad');


-- ASSESSMENT C

SELECT customer_name, annual_spend
FROM customer
WHERE city IN ('Chennai', 'Coimbatore')
ORDER BY annual_spend DESC
LIMIT 3;