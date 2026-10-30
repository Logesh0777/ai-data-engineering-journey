
/*
===========================================================
AI & DATA ENGINEERING JOURNEY
WEEK 2 - DAY 5: MULTI-TABLE SQL JOINS
===========================================================

Business Scenario:
Retail Customer, Orders and Payment Management System

Tables:
    customer
    orders
    payments

Concepts Practised:
    1. Multiple INNER JOINs
    2. Multiple LEFT JOINs
    3. Three-table JOINs
    4. ON vs WHERE
    5. NULL handling
    6. Payment reconciliation
    7. One-to-many relationships
    8. Multi-table business reporting

Daily Target: 10 Problems

===========================================================
OPTIONAL DATABASE SETUP
===========================================================

The customer and orders tables already exist.

Create and populate payments only if you have not already
created and populated it.

===========================================================
*/

-- =========================================================
-- PAYMENT TABLE SETUP
-- Run this setup only once.
-- =========================================================

CREATE TABLE IF NOT EXISTS payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_method VARCHAR(30),
    payment_status VARCHAR(20),
    paid_amount DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- Insert the sample payment transactions only if they
-- have not already been inserted.

INSERT INTO payments
    (payment_id, order_id, payment_method,
     payment_status, paid_amount)
VALUES
    (9001, 101, 'UPI', 'Completed', 7000),
    (9002, 101, 'UPI', 'Completed', 5000),
    (9003, 102, 'Card', 'Completed', 8500),
    (9004, 103, 'UPI', 'Completed', 4500),
    (9005, 104, 'Card', 'Pending', 0),
    (9006, 105, 'UPI', 'Completed', 7200),
    (9007, 106, 'Net Banking', 'Completed', 21000),
    (9008, 107, 'UPI', 'Failed', 0),
    (9009, 108, 'Card', 'Completed', 3000);


-- =========================================================
-- PROBLEM 1
-- Successful Payment Transaction Report
--
-- Business Requirement:
-- Retrieve all completed payment transactions with
-- customer and order information.
-- =========================================================

SELECT
    p.payment_id,
    o.order_id,
    c.customer_name,
    p.payment_method,
    p.paid_amount
FROM payments AS p
INNER JOIN orders AS o
    ON p.order_id = o.order_id
INNER JOIN customer AS c
    ON o.customer_id = c.customer_id
WHERE p.payment_status = 'Completed'
ORDER BY p.payment_id ASC;

/*
Expected Output:

payment_id | order_id | customer_name | payment_method | paid_amount
9001       | 101      | Arun Kumar    | UPI            | 7000
9002       | 101      | Arun Kumar    | UPI            | 5000
9003       | 102      | Priya Sharma  | Card           | 8500
9004       | 103      | Arun Kumar    | UPI            | 4500
9006       | 105      | Sneha R       | UPI            | 7200
9007       | 106      | Anjali M      | Net Banking    | 21000
9009       | 108      | Priya Sharma  | Card           | 3000
*/


-- =========================================================
-- PROBLEM 2
-- Failed and Pending Payment Report
--
-- Business Requirement:
-- Identify payment transactions that failed or are
-- still pending.
-- =========================================================

SELECT
    p.payment_id,
    c.customer_name,
    c.city,
    o.order_id,
    p.payment_status,
    p.paid_amount
FROM payments AS p
INNER JOIN orders AS o
    ON p.order_id = o.order_id
INNER JOIN customer AS c
    ON o.customer_id = c.customer_id
WHERE p.payment_status IN ('Pending', 'Failed')
ORDER BY p.payment_id ASC;

/*
Expected Output:

payment_id | customer_name | city      | order_id | payment_status | paid_amount
9005       | Divya Raj     | Madurai   | 104      | Pending        | 0
9008       | Ravi Kumar    | Bangalore | 107      | Failed         | 0
*/


-- =========================================================
-- PROBLEM 3
-- Completed Payments by Customer City
--
-- Business Requirement:
-- Retrieve completed transactions for customers from
-- Chennai and Coimbatore.
-- =========================================================

SELECT
    p.payment_id,
    c.customer_name,
    c.city,
    o.order_id,
    p.payment_method,
    p.paid_amount
FROM payments AS p
INNER JOIN orders AS o
    ON p.order_id = o.order_id
INNER JOIN customer AS c
    ON o.customer_id = c.customer_id
WHERE c.city IN ('Chennai', 'Coimbatore')
    AND p.payment_status = 'Completed'
ORDER BY
    c.city ASC,
    p.payment_id ASC;

/*
Expected Output:

payment_id | customer_name | city       | order_id | payment_method | paid_amount
9001       | Arun Kumar    | Chennai    | 101      | UPI            | 7000
9002       | Arun Kumar    | Chennai    | 101      | UPI            | 5000
9004       | Arun Kumar    | Chennai    | 103      | UPI            | 4500
9003       | Priya Sharma  | Coimbatore | 102      | Card           | 8500
9009       | Priya Sharma  | Coimbatore | 108      | Card           | 3000
*/


-- =========================================================
-- PROBLEM 4
-- UPI Transactions for High-Value Orders
--
-- Business Requirement:
-- Identify completed UPI payment transactions for orders
-- worth at least ₹7,000.
-- =========================================================

SELECT
    p.payment_id,
    c.customer_name,
    o.order_id,
    o.order_amount,
    p.payment_method,
    p.paid_amount
FROM payments AS p
INNER JOIN orders AS o
    ON p.order_id = o.order_id
INNER JOIN customer AS c
    ON o.customer_id = c.customer_id
WHERE p.payment_method = 'UPI'
    AND o.order_amount >= 7000
    AND p.payment_status = 'Completed'
ORDER BY
    o.order_amount DESC,
    p.payment_id ASC;

/*
Expected Output:

payment_id | customer_name | order_id | order_amount | payment_method | paid_amount
9001       | Arun Kumar    | 101      | 12000        | UPI            | 7000
9002       | Arun Kumar    | 101      | 12000        | UPI            | 5000
9006       | Sneha R       | 105      | 7200         | UPI            | 7200
*/


-- =========================================================
-- PROBLEM 5
-- Complete Customer Payment Activity Report
--
-- Business Requirement:
-- Display every customer, their orders and all associated
-- payment transactions, including customers without orders.
-- =========================================================

SELECT
    c.customer_id,
    c.customer_name,
    o.order_id,
    p.payment_id,
    p.payment_status,
    p.paid_amount
FROM customer AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
LEFT JOIN payments AS p
    ON o.order_id = p.order_id
ORDER BY
    c.customer_id ASC,
    p.payment_id ASC;

/*
Expected Output:

customer_id | customer_name | order_id | payment_id | payment_status | paid_amount
1           | Arun Kumar    | 101      | 9001       | Completed      | 7000
1           | Arun Kumar    | 101      | 9002       | Completed      | 5000
1           | Arun Kumar    | 103      | 9004       | Completed      | 4500
2           | Priya Sharma  | 102      | 9003       | Completed      | 8500
2           | Priya Sharma  | 108      | 9009       | Completed      | 3000
3           | Ravi Kumar    | 107      | 9008       | Failed         | 0
4           | Divya Raj     | 104      | 9005       | Pending        | 0
5           | Karthik S     | NULL     | NULL       | NULL           | NULL
6           | Sneha R       | 105      | 9006       | Completed      | 7200
7           | Vijay P       | NULL     | NULL       | NULL           | NULL
8           | Anjali M      | 106      | 9007       | Completed      | 21000
9           | Rahul N       | NULL     | NULL       | NULL           | NULL
10          | Meena K       | NULL     | NULL       | NULL           | NULL
*/


-- =========================================================
-- PROBLEM 6
-- Orders Without Successful Payments
--
-- Business Requirement:
-- Identify orders that do not have any completed
-- payment transaction.
-- =========================================================

SELECT
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.order_amount
FROM customer AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id
LEFT JOIN payments AS p
    ON o.order_id = p.order_id
    AND p.payment_status = 'Completed'
WHERE p.payment_id IS NULL
ORDER BY o.order_id ASC;

/*
Expected Output:

customer_id | customer_name | order_id | order_amount
4           | Divya Raj     | 104      | 15000
3           | Ravi Kumar    | 107      | 6000

Important:
The Completed condition is placed in ON.
IS NULL identifies orders without a completed payment.
*/


-- =========================================================
-- PROBLEM 7
-- Regional Payment Performance Report
--
-- Business Requirement:
-- Retrieve completed UPI and Net Banking transactions
-- from customers in Bangalore and Hyderabad.
-- =========================================================

SELECT
    p.payment_id,
    c.customer_name,
    c.city,
    o.order_id,
    p.payment_method,
    p.paid_amount
FROM payments AS p
INNER JOIN orders AS o
    ON p.order_id = o.order_id
INNER JOIN customer AS c
    ON o.customer_id = c.customer_id
WHERE c.city IN ('Bangalore', 'Hyderabad')
    AND p.payment_method IN ('UPI', 'Net Banking')
    AND p.payment_status = 'Completed'
ORDER BY p.payment_id ASC;

/*
Expected Output:

payment_id | customer_name | city      | order_id | payment_method | paid_amount
9006       | Sneha R       | Hyderabad | 105      | UPI            | 7200
9007       | Anjali M      | Bangalore | 106      | Net Banking    | 21000
*/


-- =========================================================
-- PROBLEM 8
-- Payment Transactions by Order Date
--
-- Business Requirement:
-- Retrieve completed payment transactions for customers
-- from Chennai and Madurai whose orders were placed
-- between October 1 and October 7, 2026.
-- =========================================================

SELECT
    p.payment_id,
    c.customer_name,
    c.city,
    o.order_date,
    o.order_id,
    p.paid_amount
FROM payments AS p
INNER JOIN orders AS o
    ON p.order_id = o.order_id
INNER JOIN customer AS c
    ON o.customer_id = c.customer_id
WHERE c.city IN ('Chennai', 'Madurai')
    AND o.order_date BETWEEN '2026-10-01' AND '2026-10-07'
    AND p.payment_status = 'Completed'
ORDER BY
    o.order_date ASC,
    p.payment_id ASC;

/*
Expected Output:

payment_id | customer_name | city    | order_date | order_id | paid_amount
9001       | Arun Kumar    | Chennai | 2026-10-01 | 101      | 7000
9002       | Arun Kumar    | Chennai | 2026-10-01 | 101      | 5000
9004       | Arun Kumar    | Chennai | 2026-10-04 | 103      | 4500
*/


-- =========================================================
-- PROBLEM 9
-- Customer Payment Reconciliation Report
--
-- Business Requirement:
-- Display every customer and order, but show payment
-- details only for completed payment transactions.
-- =========================================================

SELECT
    c.customer_id,
    c.customer_name,
    o.order_id,
    p.payment_id,
    p.payment_status,
    p.paid_amount
FROM customer AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
LEFT JOIN payments AS p
    ON o.order_id = p.order_id
    AND p.payment_status = 'Completed'
ORDER BY
    c.customer_id ASC,
    o.order_id ASC,
    p.payment_id ASC;

/*
Expected Output:

customer_id | customer_name | order_id | payment_id | payment_status | paid_amount
1           | Arun Kumar    | 101      | 9001       | Completed      | 7000
1           | Arun Kumar    | 101      | 9002       | Completed      | 5000
1           | Arun Kumar    | 103      | 9004       | Completed      | 4500
2           | Priya Sharma  | 102      | 9003       | Completed      | 8500
2           | Priya Sharma  | 108      | 9009       | Completed      | 3000
3           | Ravi Kumar    | 107      | NULL       | NULL           | NULL
4           | Divya Raj     | 104      | NULL       | NULL           | NULL
5           | Karthik S     | NULL     | NULL       | NULL           | NULL
6           | Sneha R       | 105      | 9006       | Completed      | 7200
7           | Vijay P       | NULL     | NULL       | NULL           | NULL
8           | Anjali M      | 106      | 9007       | Completed      | 21000
9           | Rahul N       | NULL     | NULL       | NULL           | NULL
10          | Meena K       | NULL     | NULL       | NULL           | NULL
*/


-- =========================================================
-- PROBLEM 10
-- Regional Order and Payment Report
--
-- Business Requirement:
-- Display customers from Bangalore and Madurai.
-- Match only orders worth at least ₹7,000.
-- Preserve customers without qualifying orders.
-- =========================================================

SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    o.order_id,
    o.order_amount,
    p.payment_id,
    p.payment_status
FROM customer AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
    AND o.order_amount >= 7000
LEFT JOIN payments AS p
    ON o.order_id = p.order_id
WHERE c.city IN ('Bangalore', 'Madurai')
ORDER BY c.customer_id ASC;

/*
Expected Output:

customer_id | customer_name | city      | order_id | order_amount | payment_id | payment_status
3           | Ravi Kumar    | Bangalore | NULL     | NULL         | NULL       | NULL
4           | Divya Raj     | Madurai   | 104      | 15000        | 9005       | Pending
8           | Anjali M      | Bangalore | 106      | 21000        | 9007       | Completed
9           | Rahul N       | Madurai   | NULL     | NULL         | NULL       | NULL
*/


-- =========================================================
-- END OF WEEK 2 - DAY 5
-- =========================================================

/*
FINAL LEARNING OUTCOMES

1. Successfully joined three related tables.
2. Practised INNER JOIN and LEFT JOIN.
3. Applied filters across multiple tables.
4. Understood ON versus WHERE.
5. Handled unmatched records using NULL.
6. Solved payment reconciliation problems.
7. Practised realistic retail finance reporting.

Next:
Continue SQL practice and complete the independent
multi-table JOIN milestone assessment before progressing.
*/
