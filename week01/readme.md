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