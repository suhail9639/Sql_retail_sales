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
 Q,10:- Write a Sql query to create each shift and number of order (Example Morning <=12, Afternoon Between 12 & 17,                  Evening >17)


 -- Creating Table 
 CREATE DATABASE sql_project;

-- Create Table
Create Table retail_sales
             (
                 transactions_id INT PRIMARY KEY,
				 sale_date	DATE, 
				 sale_time	TIME,
				 customer_id INT,
				 gender VARCHAR(15),
				 age INT,
				 category VARCHAR(25),
				 quantiy INT,
				 price_per_unit FLOAT,
				 cogs FLOAT,
				 total_sale FLOAT
             );







