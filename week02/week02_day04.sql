/*
===========================================================
AI & DATA ENGINEERING JOURNEY
Week 2 - Day 4: SQL JOINs Practice
===========================================================

Tables:
    customer(customer_id, customer_name, city)
    orders(order_id, customer_id, order_date, order_amount)

Concepts:
    INNER JOIN
    LEFT JOIN
    ON vs WHERE
    NULL handling
    DISTINCT
    Multi-column sorting
    Business reporting

Daily practice target: 10 problems
===========================================================
*/



-- PROBLEM 1
-- Customers from Bangalore or Madurai, including customers
-- without orders below ₹7,000.


SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    o.order_id,
    o.order_amount
FROM customer AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
    AND o.order_amount < 7000
WHERE c.city IN ('Bangalore', 'Madurai')
ORDER BY
    c.city ASC,
    c.customer_id ASC,
    o.order_id ASC;

/*
Expected output:

customer_id | customer_name | city      | order_id | order_amount
3           | Ravi Kumar    | Bangalore | 107      | 6000
8           | Anjali M      | Bangalore | NULL     | NULL
4           | Divya Raj     | Madurai   | NULL     | NULL
9           | Rahul N       | Madurai   | NULL     | NULL
*/


-- PROBLEM 2
-- Find orders of ₹7,000 or more placed by customers from
-- Chennai or Coimbatore.

SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    o.order_id,
    o.order_amount
FROM customer AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE c.city IN ('Chennai', 'Coimbatore')
    AND o.order_amount >= 7000
ORDER BY
    o.order_amount DESC,
    c.customer_id ASC;

/*
Expected output:

customer_id | customer_name | city       | order_id | order_amount
1           | Arun Kumar    | Chennai    | 101      | 12000
2           | Priya Sharma  | Coimbatore | 102      | 8500
*/


-- PROBLEM 3
-- Find customers from Chennai or Coimbatore who have no
-- orders of ₹7,000 or more. Include customers with no orders.


SELECT
    c.customer_id,
    c.customer_name,
    c.city
FROM customer AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
    AND o.order_amount >= 7000
WHERE c.city IN ('Chennai', 'Coimbatore')
    AND o.order_id IS NULL
ORDER BY c.customer_id ASC;

/*
Expected output:

customer_id | customer_name | city
5           | Karthik S     | Chennai
7           | Vijay P       | Coimbatore
*/


-- PROBLEM 4
-- Find each customer who has at least one order of ₹7,000
-- or more. Return each customer only once.

SELECT DISTINCT
    c.customer_id,
    c.customer_name,
    c.city
FROM customer AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id
    AND o.order_amount >= 7000
ORDER BY c.customer_id ASC;

/*
Expected output:

customer_id | customer_name | city
1           | Arun Kumar    | Chennai
2           | Priya Sharma  | Coimbatore
4           | Divya Raj     | Madurai
6           | Sneha R       | Hyderabad
8           | Anjali M      | Bangalore
*/


-- PROBLEM 5
-- Find customers who have never placed any order.


SELECT
    c.customer_id,
    c.customer_name
FROM customer AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL
ORDER BY c.customer_id ASC;

/*
Expected output:

customer_id | customer_name
5           | Karthik S
7           | Vijay P
9           | Rahul N
10          | Meena K
*/


-- PROBLEM 6
-- Return all individual orders below ₹7,000 with the
-- customer's name. Sort by amount, lowest first.


SELECT
    o.order_id,
    c.customer_name,
    o.order_amount
FROM customer AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_amount < 7000
ORDER BY
    o.order_amount ASC,
    c.customer_id ASC;

/*
Expected output:

order_id | customer_name | order_amount
108      | Priya Sharma  | 3000
103      | Arun Kumar    | 4500
107      | Ravi Kumar    | 6000
*/


-- PROBLEM 7
-- Return every customer and their orders. Customers with
-- no orders must still appear.


SELECT
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.order_amount
FROM customer AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
ORDER BY
    c.customer_id ASC,
    o.order_id ASC;

/*
Expected output:

customer_id | customer_name | order_id | order_amount
1           | Arun Kumar    | 101      | 12000
1           | Arun Kumar    | 103      | 4500
2           | Priya Sharma  | 102      | 8500
2           | Priya Sharma  | 108      | 3000
3           | Ravi Kumar    | 107      | 6000
4           | Divya Raj     | 104      | 15000
5           | Karthik S     | NULL     | NULL
6           | Sneha R       | 105      | 7200
7           | Vijay P       | NULL     | NULL
8           | Anjali M      | 106      | 21000
9           | Rahul N       | NULL     | NULL
10          | Meena K       | NULL     | NULL
*/


-- PROBLEM 8
-- Generate a report of all orders placed by Chennai
-- customers. Show the highest-value order first.


SELECT
    o.order_id,
    c.customer_name,
    c.city,
    o.order_amount
FROM orders AS o
INNER JOIN customer AS c
    ON o.customer_id = c.customer_id
WHERE c.city = 'Chennai'
ORDER BY o.order_amount DESC;

/*
Expected output:

order_id | customer_name | city    | order_amount
101      | Arun Kumar    | Chennai | 12000
103      | Arun Kumar    | Chennai | 4500
*/


-- PROBLEM 9
-- Find customers who have no orders below ₹5,000.
-- Customers with no orders must be included.


SELECT
    c.customer_id,
    c.customer_name,
    c.city
FROM customer AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
    AND o.order_amount < 5000
WHERE o.order_id IS NULL
ORDER BY c.customer_id ASC;

/*
Expected output:

customer_id | customer_name | city
3           | Ravi Kumar    | Bangalore
4           | Divya Raj     | Madurai
5           | Karthik S     | Chennai
6           | Sneha R       | Hyderabad
7           | Vijay P       | Coimbatore
8           | Anjali M      | Bangalore
9           | Rahul N       | Madurai
10          | Meena K       | Hyderabad
*/


-- PROBLEM 10
-- Create a customer-order report for orders placed between
-- October 1 and October 10, 2026, including both dates.


SELECT
    o.order_id,
    c.customer_name,
    c.city,
    o.order_date,
    o.order_amount
FROM orders AS o
INNER JOIN customer AS c
    ON o.customer_id = c.customer_id
WHERE o.order_date BETWEEN '2026-10-01' AND '2026-10-10'
ORDER BY
    o.order_date ASC,
    o.order_id ASC;

/*
Expected output:

order_id | customer_name | city       | order_date | order_amount
101      | Arun Kumar    | Chennai    | 2026-10-01 | 12000
102      | Priya Sharma  | Coimbatore | 2026-10-02 | 8500
103      | Arun Kumar    | Chennai    | 2026-10-04 | 4500
104      | Divya Raj     | Madurai    | 2026-10-05 | 15000
105      | Sneha R       | Hyderabad  | 2026-10-07 | 7200
106      | Anjali M      | Bangalore  | 2026-10-09 | 21000
*/


-- END OF WEEK 2 - DAY 4
-- Next: Finish the independent JOIN checkpoint before
-- moving on to a new SQL topic.
