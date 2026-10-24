# Week 1 - Day 1 SQL

## Topics Learned

- SELECT
- FROM
- WHERE
- ORDER BY
- LIMIT
- DISTINCT

## Database

Retail AI

## Table

customers

## Exercises Completed

10 SQL exercises

## Day 1 Challenge

Find the top 3 highest-value customers from Tamil Nadu.

## Skills Practised

- Selecting columns
- Filtering rows
- Sorting data
- Limiting results
- Removing duplicate values

## Day 2 — SQL Conditions

### Topics Learned

- AND
- OR
- IN
- NOT IN
- BETWEEN
- Combining multiple conditions
- Parentheses with AND / OR
- Filtering and sorting business data

### Exercises Completed

10 SQL exercises

### Assessments Completed

3 SQL assessments

### Business Challenge

Identified high-value customers based on city and annual spending.

### Key Learning

Learned how to translate multiple business requirements into SQL conditions.

## Day 3 — LIKE, NULL & Text Searching

### Topics Learned

- LIKE
- NOT LIKE
- % wildcard
- _ wildcard
- IS NULL
- IS NOT NULL
- Text searching
- Combining LIKE with AND
- Data quality filtering
- ORDER BY and LIMIT with text filters

### Practical Exercises

- Find names starting with a character
- Find names ending with a character
- Find names containing specific text
- Exclude names containing specific text
- Identify missing city values
- Filter records with available city information
- Combine text and numerical conditions

### Business Challenge

Created a customer marketing query that filters customers based on:

- Customer name
- City
- Annual spending
- Missing data
- Sorting
- Top-N selection

### Assessment

Day 3 Assessment completed.

Final correction test: **Passed**

### Key Learning

SQL clause order:

SELECT  
FROM  
WHERE  
ORDER BY  
LIMIT

## Day 4 — Aggregate Functions & GROUP BY

### Topics Learned

- COUNT()
- SUM()
- AVG()
- MIN()
- MAX()
- GROUP BY
- HAVING
- Aggregate functions with WHERE
- Multiple aggregate functions
- ORDER BY with aggregate results
- LIMIT with grouped results

### What I Practiced

- Counting customers
- Calculating total customer spending
- Calculating average spending
- Finding maximum and minimum spending
- Grouping customers by city
- Grouping customers by state
- Filtering grouped results using HAVING
- Sorting aggregated results
- Finding top-N groups

### Business Analysis Queries

I practiced answering questions such as:

- How many customers are there?
- How many customers are from a particular city/state?
- What is the total spending?
- What is the average spending?
- Which city has the highest total spending?
- Which states have spending above a threshold?
- Which cities have at least 2 customers?
- What are the top 2 cities by average customer spending?

### Key Learning

#### WHERE vs HAVING

WHERE filters individual rows:

```sql
WHERE annual_spend > 60000

## Day 5 — Advanced GROUP BY & Business Analysis

### Topics Learned

- Multiple aggregate functions in a single query
- `COUNT()`
- `SUM()`
- `AVG()`
- `WHERE` with `GROUP BY`
- `GROUP BY` with `HAVING`
- Multiple conditions in `HAVING`
- `ORDER BY` with aggregate results
- Sorting with `DESC`
- Top-N analysis using `LIMIT`
- Writing business-oriented SQL queries

### Practical Exercises

- Calculate customer count, total spending, and average spending by city.
- Filter customers by annual spending before grouping.
- Find cities with at least two qualifying customers.
- Identify cities using total and average spending thresholds.
- Sort cities by total annual spending.
- Retrieve the top three cities by total spending.
- Combine `WHERE`, `GROUP BY`, `HAVING`, and `ORDER BY`.
- Create business reports using multiple aggregate functions.

### Main Business Challenge

**Objective:** Identify the top three cities by total annual spending.

Requirements:
- Consider customers with annual spending greater than ₹45,000.
- Group customers by city.
- Include only cities with at least two qualifying customers.
- Calculate customer count, total spending, and average spending.
- Sort by total spending from highest to lowest.
- Return only the top three cities.

**Concepts Used:** `WHERE`, `COUNT()`, `SUM()`, `AVG()`, `GROUP BY`, `HAVING`, `ORDER BY`, `DESC`, and `LIMIT`.

### Important Concepts Learned

#### WHERE vs HAVING

- `WHERE` filters individual rows before grouping.
- `HAVING` filters groups after aggregation.

#### SQL Query Processing Order

```text
FROM
  ↓
WHERE
  ↓
GROUP BY
  ↓
HAVING
  ↓
SELECT
  ↓
ORDER BY
  ↓
LIMIT
```

#### Aggregate Functions

| Function | Purpose |
|---|---|
| `COUNT(*)` | Counts rows |
| `SUM()` | Calculates the total |
| `AVG()` | Calculates the average |
| `MAX()` | Finds the highest value |
| `MIN()` | Finds the lowest value |

#### Top-N Analysis

Used `ORDER BY ... DESC` with `LIMIT` to retrieve the highest-ranking results.

### Day 5 Assessment

**Score: 7/7 — 100%**

Completed all seven assessment questions covering grouped analysis, filtering, aggregate calculations, and top-N queries.

### Skills Checklist

- [x] Use multiple aggregate functions in one query.
- [x] Filter records with `WHERE` before grouping.
- [x] Group data using `GROUP BY`.
- [x] Filter aggregated groups using `HAVING`.
- [x] Apply multiple aggregate conditions.
- [x] Sort using aggregate results.
- [x] Retrieve top-N results using `LIMIT`.
- [x] Translate business requirements into SQL queries.

### Key Learning

SQL aggregation helps turn individual records into meaningful business insights, such as customer counts, city-wise spending, state-wise performance, and top-performing locations.

## Day 6 — SQL Revision & Business Analysis

### Topics Practiced

- `SELECT`, `FROM` and `WHERE`
- `AND` and `OR`
- Parentheses for combining conditions
- `IN` and `BETWEEN`
- `LIKE` for text searching
- `COUNT()`, `SUM()` and `AVG()`
- `GROUP BY` and `HAVING`
- `ORDER BY` and `DESC`
- `LIMIT` for Top-N analysis
- Translating business requirements into SQL queries

### Practical Exercises

1. Find the top four customers from Tamil Nadu or Karnataka within a spending range.
2. Combine city and spending conditions using `AND`, `OR`, and parentheses.
3. Calculate state-wise customer counts and total spending.
4. Find the top two cities by average spending using filtering and grouping.
5. Identify the top two cities for high-value customers using multiple filters and aggregate conditions.

### Main Business Challenge

**Objective:** Identify the top two cities for high-value customers.

Requirements:
- Customer name contains lowercase `a`.
- Annual spending is greater than ₹40,000.
- Calculate customer count, total spending, and average spending by city.
- Include cities with at least two qualifying customers.
- Require total spending above ₹100,000.
- Sort by total spending from highest to lowest.
- Return only the top two cities.

**Concepts Used:** `LIKE`, `WHERE`, `COUNT()`, `SUM()`, `AVG()`, `GROUP BY`, `HAVING`, `ORDER BY`, and `LIMIT`.

### Key Learning

#### AND, OR, and Parentheses

- `AND` requires both conditions to be true.
- `OR` allows either condition to be true.
- Parentheses make complex filtering logic explicit.

#### WHERE vs HAVING

- `WHERE` filters individual rows before grouping.
- `HAVING` filters groups after aggregation.

#### SQL Query Flow

```text
FROM
  ↓
WHERE
  ↓
GROUP BY
  ↓
HAVING
  ↓
SELECT
  ↓
ORDER BY
  ↓
LIMIT
```

### Day 6 Assessment

**Final business challenge: Passed**

### Skills Checklist

- [x] Filter using multiple conditions.
- [x] Combine `AND` and `OR` correctly.
- [x] Use parentheses to control condition grouping.
- [x] Apply aggregate functions.
- [x] Group and filter aggregated results.
- [x] Sort aggregate results.
- [x] Retrieve Top-N results.
- [x] Translate business requirements into SQL.

### Key Takeaway

Accurate SQL requires more than valid syntax. The query must also match every business requirement, including the correct filters, thresholds, grouping conditions, sorting direction, and result limit.

## Day 7 — CASE WHEN & Conditional Logic

### Topics Learned

- `CASE WHEN`
- `THEN`, `ELSE` and `END`
- Creating conditional categories
- Multiple conditions using `AND`
- Setting numerical thresholds
- Ordering conditions from most specific to least specific
- Combining `CASE` with `WHERE`
- Combining `CASE` with `ORDER BY` and `LIMIT`

### Practical Exercises

- Classify customers by annual spending.
- Create Premium, Regular and Budget categories.
- Create Platinum, Gold, Silver and Bronze spending levels.
- Use multiple conditions inside `CASE WHEN`.
- Apply spending categories to selected states.
- Retrieve top customers using `ORDER BY` and `LIMIT`.
- Filter results to show only qualifying spending categories.

### Main Business Concept

**Objective:** Categorize customers based on their annual spending and identify high-value customers.

`CASE WHEN` creates a calculated category for each row. `WHERE` controls which rows are returned.

### Key Learning

- `CASE` starts the conditional expression.
- `WHEN` checks a condition.
- `THEN` specifies the result when the condition is true.
- `ELSE` supplies the default result.
- `END` finishes the expression.
- SQL uses the result of the first matching `WHEN`.
- Conditions should be ordered carefully to avoid misclassification.

### Example SQL Structure

```sql
SELECT customer_name,
       annual_spend,
       CASE
           WHEN annual_spend >= 100000 THEN 'Platinum'
           WHEN annual_spend >= 75000 THEN 'Gold'
           WHEN annual_spend >= 50000 THEN 'Silver'
           ELSE 'Bronze'
       END AS spending_category
FROM customer;
```

### Day 7 Assessment

**Final score: 48/50 — 96%**

Final correction completed successfully.

### Skills Checklist

- [x] Use `CASE WHEN` to create categories.
- [x] Apply multiple spending thresholds.
- [x] Combine conditions using `AND`.
- [x] Order conditions correctly.
- [x] Create meaningful calculated column aliases.
- [x] Combine categories with `WHERE`.
- [x] Sort results with `ORDER BY DESC`.
- [x] Return the top N rows using `LIMIT`.
- [x] Translate business rules into conditional SQL.

### Key Takeaway

Conditional logic allows SQL to transform numerical values into meaningful business categories, making results easier to interpret in reports, dashboards and customer-segmentation analyses.