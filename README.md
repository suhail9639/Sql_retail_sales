# 📊 Retail Sales Analysis using SQL
## 📝 Project Overview
**Project Title:** Retail Sales Analysis SQL
**Level:** Beginner  
**Database:** retail_sale_db 


---

## 🎯 Project Objectives
- Design and create a retail sales database  
- Perform data cleaning to ensure data quality  
- Conduct exploratory data analysis (EDA)  
- Answer business-driven questions using SQL  
- Generate insights related to customers, sales, and product categories  

---


## 🛠 Tools & Technologies
- SQL (PostgreSQL)
- Data Cleaning & Validation
- Aggregation Functions
- Window Functions
- Business Analysis

---

## 📌 Project Workflow
1. Database and table creation  
2. Data cleaning (handling NULL values)  
3. Data exploration  
4. Business problem solving using SQL queries  
5. Insight generation  

---

## 📈 Business Questions Solved 
 Q.1 :- Write a query to retrieve all columns for sales mode '2022-11-05'
 
 Q.2 :- Write a SQL query to retrieve all transactions where the category is 'Clothing' the quantity sold is more than 10 in  the month of Nov-2022
 
 Q.3 :- Write a Sql query to calculate the total  sales (total_sales) for each category.
 
 Q.4 :- Write a Sql query to find the average age of customers who purchased items from the 'Beauty' category.
 
 Q.5 :- Write a Sql query to find  all transaxtions where the total_sales is greater then 1000.
 
 Q.6 :- Write a Sql query to find  the total number of transactions (transaction_id) made by each gender in each category.
 
 Q.7 :- Write a Sql query to calculate the average sale for each month. Find out best selling month in each year.
 
 Q.8 :- Write a  Sql query to find the top 5 customers based on the highest total sales
 
 Q.9 :- Write a Sql query to find the number of unique customers who purchased item from category.
 
 Q,10:- Write a Sql query to create each shift and number of order (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)

## 🗂 Dataset Information
The dataset contains transactional retail sales data.

### Table: `retail_sales`

| Column Name | Description |
|------------|------------|
| transaction_id | Unique transaction identifier |
| sale_date | Date of transaction |
| sale_time | Time of transaction |
| customer_id | Unique customer ID |
| gender | Customer gender |
| age | Customer age |
| category | Product category |
| quantity | Quantity sold |
| price_per_unit | Price per unit |
| cogs | Cost of goods sold |
| total_sale | Total sales amount |

---
```sql
--SQL Retail Sales Analysis Project
CREATE DATABASE sql_project;

-- Create Table
CREATE TABLE retail_sales
(
    transactions_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(15),
    age INT,
    category VARCHAR(25),
    quantity INT,
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sale FLOAT
);
```
## Data Exploration & Cleaning

In this step, basic checks were performed to understand the data and improve its quality before analysis.

Record Count:
Checked the total number of rows available in the dataset.

Customer Count:
Calculated the number of unique customers to understand customer reach.

Category Count:
Identified all distinct product categories present in the data.

Null Value Handling:
Searched for missing (NULL) values in important columns and removed those records to ensure clean and reliable analysis.
```sql
-- Total number of records
SELECT COUNT(*) FROM retail_sales;

-- Unique customers
SELECT COUNT(DISTINCT customer_id) FROM retail_sales;

-- Unique product categories
SELECT DISTINCT category FROM retail_sales;

-- Check for NULL values
SELECT *
FROM retail_sales
WHERE
    sale_date IS NULL OR
    sale_time IS NULL OR
    customer_id IS NULL OR
    gender IS NULL OR
    age IS NULL OR
    category IS NULL OR
    quantity IS NULL OR
    price_per_unit IS NULL OR
    cogs IS NULL OR
    total_sale IS NULL;

-- Remove records with NULL values
DELETE FROM retail_sales
WHERE
    sale_date IS NULL OR
    sale_time IS NULL OR
    customer_id IS NULL OR
    gender IS NULL OR
    age IS NULL OR
    category IS NULL OR
    quantity IS NULL OR
    price_per_unit IS NULL OR
    cogs IS NULL OR
    total_sale IS NULL;
```	

## Data Analysis & Findings
The following SQL queries were developed to answer specific business questions

```sql
-- Q1: Retrieve all columns for sales made on '2022-11-05'
SELECT *
FROM retail_sales
WHERE sale_date = '2022-11-05';


-- Q2: Retrieve all Clothing transactions with quantity > 10 in Nov-2022
SELECT *
FROM retail_sales
WHERE category = 'Clothing'
  AND TO_CHAR(sale_date, 'YYYY-MM') = '2022-11'
  AND quantity > 10;


-- Q3: Calculate total sales for each category
SELECT
    category,
    SUM(total_sale) AS net_sales,
    COUNT(*) AS total_orders
FROM retail_sales
GROUP BY category;


-- Q4: Average age of customers who purchased Beauty products
SELECT
    ROUND(AVG(age), 2) AS avg_age
FROM retail_sales
WHERE category = 'Beauty';


-- Q5: Transactions where total sale is greater than 1000
SELECT *
FROM retail_sales
WHERE total_sale > 1000;


-- Q6: Total number of transactions by gender and category
SELECT
    gender,
    category,
    COUNT(*) AS total_transactions
FROM retail_sales
GROUP BY gender, category
ORDER BY gender;


-- Q7: Best selling month (highest average sale) in each year
SELECT
    year,
    month,
    avg_sale
FROM (
    SELECT
        EXTRACT(YEAR FROM sale_date) AS year,
        EXTRACT(MONTH FROM sale_date) AS month,
        AVG(total_sale) AS avg_sale,
        RANK() OVER (
            PARTITION BY EXTRACT(YEAR FROM sale_date)
            ORDER BY AVG(total_sale) DESC
        ) AS rank
    FROM retail_sales
    GROUP BY 1, 2
) t
WHERE rank = 1;


-- Q8: Top 5 customers based on highest total sales
SELECT
    customer_id,
    SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;


-- Q9: Number of unique customers per category
SELECT
    category,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM retail_sales
GROUP BY category;


-- Q10: Orders by time shift (Morning, Afternoon, Evening)
WITH hourly_sales AS (
    SELECT *,
        CASE
            WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
            WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
            ELSE 'Evening'
        END AS shift
    FROM retail_sales
)
SELECT
    shift,
    COUNT(*) AS total_orders
FROM hourly_sales
GROUP BY shift;

```




