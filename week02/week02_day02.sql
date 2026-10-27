/*
SQL Learning Roadmap — Week 2, Day 2
Topic: Combining filter conditions with AND, OR, and parentheses
Folder: week02/
Table scope: customer and orders only
Roadmap rule: Filtering practice only — no JOINs, GROUP BY, or aggregate functions.

CORE NOTES
1. AND: every condition must be true.
2. OR: at least one condition must be true.
3. Parentheses: make the intended logic explicit when AND and OR are combined.
4. In SQL, AND is evaluated before OR. Do not rely on memory alone; use parentheses
   to show the condition you actually intend.
*/

-- ============================================================
-- PART A — WORKED EXAMPLES
-- ============================================================

-- Example 1: Both conditions must be true.
-- Return orders above 7,000 placed on or after 7 October 2026.
SELECT order_id, customer_id, order_date, order_amount
FROM orders
WHERE order_amount > 7000
  AND order_date >= DATE '2026-10-07'
ORDER BY order_amount DESC;

-- Example 2: Either condition may be true.
-- Return orders of 4,500 or less, OR orders of 15,000 or more.
SELECT order_id, customer_id, order_amount
FROM orders
WHERE order_amount <= 4500
   OR order_amount >= 15000
ORDER BY order_amount DESC;

-- Example 3: Use parentheses to combine groups of conditions.
-- Return customers from Chennai or Coimbatore whose names start with K or P.
SELECT customer_id, customer_name, city
FROM customer
WHERE city IN ('Chennai', 'Coimbatore')
  AND (customer_name LIKE 'K%' OR customer_name LIKE 'P%')
ORDER BY city, customer_name;

-- Example 4: Combine a range with a date condition.
-- Keep orders between 6,000 and 15,000 inclusive that were placed on/after 5 October.
SELECT order_id, customer_id, order_date, order_amount
FROM orders
WHERE order_amount BETWEEN 6000 AND 15000
  AND order_date >= DATE '2026-10-05'
ORDER BY order_date ASC;

-- ============================================================
-- PART B — PRACTICE QUESTIONS WITH SOLUTIONS
-- Try each question yourself before reading its solution.
-- ============================================================

-- Q1. Find orders from 2 October through 11 October 2026, inclusive,
-- with an amount of at least 6,000. Sort by amount, highest first.
SELECT order_id, customer_id, order_date, order_amount
FROM orders
WHERE order_date BETWEEN DATE '2026-10-02' AND DATE '2026-10-11'
  AND order_amount >= 6000
ORDER BY order_amount DESC;

-- Q2. Find customers who are from neither Chennai nor Coimbatore
-- and whose name contains 'Kumar'.
SELECT customer_id, customer_name, city
FROM customer
WHERE city NOT IN ('Chennai', 'Coimbatore')
  AND customer_name LIKE '%Kumar%'
ORDER BY customer_name;

-- Q3. Find orders whose amount is below 5,000 OR whose order date is
-- 9 October 2026. Sort newest date first, then highest amount first.
SELECT order_id, customer_id, order_date, order_amount
FROM orders
WHERE order_amount < 5000
   OR order_date = DATE '2026-10-09'
ORDER BY order_date DESC, order_amount DESC;

-- Q4. Find customers from Chennai or Coimbatore whose names start with A or K.
-- Parentheses ensure the name condition applies to both cities.
SELECT customer_id, customer_name, city
FROM customer
WHERE city IN ('Chennai', 'Coimbatore')
  AND (customer_name LIKE 'A%' OR customer_name LIKE 'K%')
ORDER BY customer_name;

-- Q5. Find orders between 3,000 and 12,000 inclusive that were placed
-- on or before 7 October 2026.
SELECT order_id, customer_id, order_date, order_amount
FROM orders
WHERE order_amount BETWEEN 3000 AND 12000
  AND order_date <= DATE '2026-10-07'
ORDER BY order_amount ASC;

-- Q6. Find orders that are either less than 5,000 or greater than 15,000.
-- This checks the use of OR with two exclusive conditions.
SELECT order_id, customer_id, order_amount
FROM orders
WHERE order_amount < 5000
   OR order_amount > 15000
ORDER BY order_amount DESC;

-- Q7. Find customers whose city is Bangalore or Hyderabad,
-- and whose name contains the lowercase letter 'a'.
-- LIKE is case-sensitive in PostgreSQL; the pattern below looks for lowercase a.
SELECT customer_id, customer_name, city
FROM customer
WHERE city IN ('Bangalore', 'Hyderabad')
  AND customer_name LIKE '%a%'
ORDER BY city, customer_name;

-- Q8. Find orders from 5 October onward whose amount is between
-- 6,000 and 15,000 inclusive, OR orders exactly equal to 3,000.
-- Intended logic: (date >= 5 Oct AND amount between 6000 and 15000)
-- OR an order amount exactly equal to 3,000. Parentheses make this explicit.
SELECT order_id, customer_id, order_date, order_amount
FROM orders
WHERE (order_date >= DATE '2026-10-05'
       AND order_amount BETWEEN 6000 AND 15000)
   OR order_amount = 3000
ORDER BY order_date ASC;

/*
REVIEW CHECKLIST
[ ] I can explain the difference between AND and OR.
[ ] I use parentheses when mixing AND and OR.