--SQL Retail Sales Analysis Project
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
Select * from retail_sales
Limit 10

Select count(*) from retail_sales;

-- Data Cleaning 

select * from retail_sales
where 
    transactions_id is Null
    OR 
	sale_date is null 
	OR 
	sale_time is null
	OR 
	customer_id is null 
	OR 
	gender is null
	OR
	age is null
	OR 
	category is null
	OR
	quantiy is null 
	OR 
	price_per_unit is null
	OR
	cogs is null
	OR
	total_sale is null;

delete from retail_sales
where  
    transactions_id is Null
    OR 
	sale_date is null 
	OR 
	sale_time is null
	OR 
	customer_id is null 
	OR 
	gender is null
	OR
	age is null
	OR 
	category is null
	OR
	quantiy is null 
	OR 
	price_per_unit is null
	OR
	cogs is null
	OR
	total_sale is null;


-- Data Exploration 
-- How many sales we Have
select count(total_sale) as total_Sales from retail_sales

-- How many unique Customer we have
select count(distinct customer_id) as total_sales from retail_sales

select distinct category from retail_sales

--Data Analysis & Business Key Problem 

-- My Analysis & Findings
-- Q.1 :- Write a query to retrieve all columns for sales mode '2022-11-05'
-- Q.2 :- Write a SQL query to retrieve all transactions where the category is 'Clothing' and 
-- the quantity solo is more than 10 in the month of Nov-2022
-- Q.3 :- Write a sql query to calculate the total  sales (total_sales) for each category.
-- Q.4 :- Write a sql query to find the average age of customers who purchased items from the 'Beauty' category.
-- Q.5 :- Write a sql query to find  all transaxtions where the total_sales is greater then 1000.
-- Q.6 :- Write a sql query to find  the total number of transactions (transaction_id) made by each gender in each category.
-- Q.7 :- Write a sql query to calculate the average sale for each month. Find out best selling month in each year.
-- Q.8 :- Write a  sql query to find the top 5 customers based on the highest total sales
-- Q.9 :- write a sql query to find the number of unique customers who purchased item from category.
-- Q,10:- Write a Sql query to create each shift and number of order (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)



-- Q.1 :- Write a query to retrieve all columns for sales mode '2022-11-05'
select * from retail_sales
where sale_date = '2022-11-05';

-- Q.2 :- Write a SQL query to retrieve all transactions where the category is 'Clothing' and 
-- the quantity sold is more than 10 in the month of Nov-2022

select 
  *
from retail_sales
where
    category = 'Clothing'
	AND
	TO_CHAR(sale_date,'YYYY-MM') = '2022-11'
	AND
	quantiy >= 4


-- Q.3 :- Write a sql query to calculate the total  sales (total_sales) for each category.

select 
     category, 
	 sum(total_sale) as net_sales,
	 count(*) as total_order
	 from Retail_sales
	 group by 

-- Q.4 :- Write a sql query to find the average age of customers who purchased items from the 'Beauty' category.

select  
	 round(avg(age), 2) as avg_age
	 from retail_sales
	 where category = 'Beauty'
	 
-- Q.5 :- Write a sql query to find  all transaxtions where the total_sales is greater then 1000.
select * from retail_sales
where total_sale > 1000

--Q.6 :- Write a sql query to find  the total number of transactions (transaction_id) made by each gender in each category.

select gender,
       category,
      count(*) as trans from 
	  retail_sales 
      group by 
	  gender, category
	  order by 1


-- Q.7 :- Write a sql query to calculate the average sale for each month. Find out best selling month in each year.
select 
      year,
	  month,
	  avg_sale
From 
(
select
      Extract(year from sale_date) as year,
	  Extract(month from sale_date) as month,
	  avg(total_sale) as Avg_sale, 
	  Rank() OVER (PARTITION BY EXTRACT(YEAR FROM Sale_date) order by avg(total_sale) desc) as rank 
	  from retail_sales
	  group by 1 , 2
) as t1
where rank = 1

-- Q.8 :- Write a  sql query to find the top 5 customers based on the highest total sales

select customer_id, sum(total_sale) 
from retail_sales
group by 1
order by  2 desc
Limit 5;

-- Q.9 :- write a sql query to find the number of unique customers who purchased item from category.

select category, count(distinct customer_id)
from retail_sales
group by category


-- Q,10:- Write a Sql query to create each shift and number of order 
--        (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)

with hourly_sale
as
(
select *,
    CASE
	     WHEN extract(hour from sale_time) < 12 THEN 'Morning'
		 WHEN extract (hour from sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
		 ELSE 'Evening'
     END as shift
FROM retail_sales
)
select 
     shift, 
	 count(*) as total_sales
	 from hourly_sale
	 group by shift
	 

