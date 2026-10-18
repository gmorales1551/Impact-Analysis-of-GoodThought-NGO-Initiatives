# Impact Analysis of GoodThought NGO Initiatives

## Project Overview
An intermediate PostgreSQL analysis exploring GoodThought NGO's database, uncovering key insights from over 13 years of transformative projects, assignments, and donor activities.

## Business Objectives
- **Top Donation Assignments:** Calculate and list the top five assignments based on total donation value, categorized by donor type with rounded monetary amounts.
- **Regional Impact Leaders:** Identify the assignment with the highest impact score in each region (ensuring at least one donation per assignment) using advanced window functions.

## Technical Skills Defined
- **PostgreSQL / SQL**
- **Window Functions (`ROW_NUMBER()`, `PARTITION BY`)**
- **Aggregate Functions & Grouping (`SUM()`, `COUNT()`, `GROUP BY`)**
- **Multi-table Joins (`INNER JOIN`)**
- **Conditional Filtering (`HAVING`)**

## Files Included
- `goodthought_ngo_analysis.sql`: Contains the SQL queries used to aggregate regional impact scores and financial donation totals.
