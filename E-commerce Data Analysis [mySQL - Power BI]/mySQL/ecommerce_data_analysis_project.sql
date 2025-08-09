-- check column with blank
select count(*) from ecommerce_data where CID = "";
select count(*) from ecommerce_data where TID = "";
select count(*) from ecommerce_data where Gender = "";
select count(*) from ecommerce_data where `Age Group` = "";
select count(*) from ecommerce_data where `Purchase Date` = "";
select count(*) from ecommerce_data where `Product Category` = "";
select count(*) from ecommerce_data where `Discount Availed` = "";
select count(*) from ecommerce_data where `Discount Name` = ""; -- yes
select count(*) from ecommerce_data where `Discount Amount (INR)` = ""; -- yes
select count(*) from ecommerce_data where `Gross Amount` = "";
select count(*) from ecommerce_data where `Net Amount` = "";
select count(*) from ecommerce_data where `Purchase Method` = "";
select count(*) from ecommerce_data where `Location` = "";

-- change blank to null
set sql_safe_updates = 0;

update ecommerce_data
set `Discount Name` = null
where `Discount Name` = "";

update ecommerce_data
set `Discount Amount (INR)` = null
where `Discount Amount (INR)` = "";

set sql_safe_updates = 1;

-- see the data
select * from ecommerce_data;

-- 1 Total Transactions – How many unique transactions were recorded in the dataset?
SELECT COUNT(DISTINCT TID) AS total_transactions
FROM ecommerce_data;

-- 2 Total Revenue – What is the total gross revenue and total net revenue?
SELECT
  ROUND(SUM(`Gross Amount`), 2) AS total_gross_revenue,
  ROUND(SUM(`Net Amount`), 2) AS total_net_revenue
FROM ecommerce_data;

-- 3 Average Net Amount per Transaction – What is the average revenue generated from each transaction?
SELECT
  ROUND(AVG(`Net Amount`), 2) AS avg_net_per_transaction
FROM ecommerce_data;
-- 4 Total Unique Customers – How many distinct customers made purchases?
SELECT
  COUNT(DISTINCT CID) AS total_customers
FROM ecommerce_data;

-- 5 Average Transactions per Customer – On average, how many transactions does each customer make?
SELECT 
  ROUND(COUNT(DISTINCT TID) / COUNT(DISTINCT CID), 2) AS avg_transactions_per_customer
FROM ecommerce_data;

-- 6 Customer Demographics – What is the customer count for each age group?
SELECT
	`Age Group`,
	COUNT(DISTINCT CID) AS customer_count
FROM ecommerce_data
GROUP BY `Age Group`
ORDER BY FIELD(`Age Group`, "under 18", "18-25", "25-45", "45-60", "60 and above");

-- 7 Product Popularity – Which product categories have the highest number of transactions?
SELECT
  `Product Category`,
  COUNT(DISTINCT TID) AS transaction_count
FROM ecommerce_data
GROUP BY `Product Category`
ORDER BY transaction_count DESC;

-- 8 Average Discount by Product Category – What is the average discount amount (in INR) for each product category?
SELECT
  `Product Category`,
  ROUND(AVG(`Discount Amount (INR)`), 2) AS avg_discount_inr
FROM ecommerce_data
WHERE `Discount Amount (INR)` > 0
GROUP BY `Product Category`
ORDER BY avg_discount_inr DESC;

-- 9 Payment Method Distribution – What is the distribution of transactions by purchase method?
SELECT
  `Purchase Method`,
  COUNT(*) AS transaction_count
FROM ecommerce_data
GROUP BY `Purchase Method`
ORDER BY transaction_count DESC;

-- 10 Discount Usage Rate – What percentage of transactions availed discounts?
SELECT
  CONCAT(ROUND(
    COUNT(CASE WHEN `Discount Availed` = 'Yes' THEN 1 END) * 100.0 / COUNT(*), 2
  ), '%') AS discount_availed_percentage
FROM ecommerce_data;

-- 11 Monthly Transaction & Revenue Trends – How many transactions and how much revenue were generated each month?
SELECT
  DATE_FORMAT(`Purchase Date`, '%Y-%m') AS month,
  COUNT(*) AS total_transactions,
  ROUND(SUM(`Net Amount`), 2) AS total_revenue
FROM ecommerce_data
GROUP BY month
ORDER BY month;

-- 12 Monthly Discount Impact – What is the monthly breakdown of transactions and revenue based on discount usage?
SELECT
  DATE_FORMAT(`Purchase Date`, '%Y-%m') AS month,
  `Discount Availed` AS discount_used,
  COUNT(*) AS total_transactions,
  ROUND(SUM(`Net Amount`), 2) AS total_revenue
FROM ecommerce_data
GROUP BY month, discount_used
ORDER BY month, discount_used;

-- 13 Revenue by Payment Method – For each purchase method, how many transactions, total revenue, and average transaction value were recorded?
SELECT
  `Purchase Method` AS payment_method,
  COUNT(*) AS total_transactions,
  ROUND(SUM(`Net Amount`), 2) AS total_revenue,
  ROUND(AVG(`Net Amount`), 2) AS avg_transaction_value
FROM ecommerce_data
GROUP BY payment_method
ORDER BY total_revenue DESC;

-- 14 Gender-Based Analysis – For each gender, how many transactions, total revenue, and average transaction value were recorded?
SELECT
  Gender,
  COUNT(*) AS total_transactions,
  ROUND(SUM(`Net Amount`), 2) AS total_revenue,
  ROUND(AVG(`Net Amount`), 2) AS avg_transaction_value
FROM ecommerce_data
GROUP BY Gender
ORDER BY total_revenue DESC;

-- 15 Age Group Performance – For each age group, how many transactions, total revenue, and average transaction value were recorded?
SELECT
  `Age Group` AS age_group,
  COUNT(*) AS total_transactions,
  ROUND(SUM(`Net Amount`), 2) AS total_revenue,
  ROUND(AVG(`Net Amount`), 2) AS avg_transaction_value
FROM ecommerce_data
GROUP BY age_group
ORDER BY FIELD(age_group, "under 18", "18-25", "25-45", "45-60", "60 and above");

-- 16 Gender Discount Usage – What is the percentage of discount usage by gender?
SELECT 
  Gender,
  ROUND(
    COUNT(CASE WHEN `Discount Availed` = 'Yes' THEN 1 END) 
    / COUNT(*) * 100, 
    2
  ) AS discount_usage_percentage
FROM ecommerce_data
GROUP BY Gender;

-- 17 Gender-Payment Relationship – Within each gender, what is the percentage distribution of purchase methods?
SELECT
  Gender,
  `Purchase Method` AS payment_method,
  COUNT(*) AS total_transactions,
  ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY Gender), 2) AS percentage_within_gender
FROM ecommerce_data
GROUP BY Gender, `Purchase Method`
ORDER BY Gender, total_transactions DESC;

-- 18 City Performance – Which cities generate the highest revenue, and what percentage of total revenue does each city contribute?
SELECT
  Location AS city,
  COUNT(*) AS total_transactions,
  ROUND(SUM(`Net Amount`), 2) AS total_revenue,
  ROUND(SUM(`Net Amount`) / (SELECT SUM(`Net Amount`) FROM ecommerce_data) * 100, 2) AS revenue_percentage
FROM ecommerce_data
GROUP BY city
ORDER BY total_revenue DESC;

-- 19 Discount Impact by Product Category – For each product category, what percentage of transactions were made with discounts versus without discounts?
SELECT
  `Product Category`,
  SUM(CASE WHEN `Discount Availed` = 'Yes' THEN 1 ELSE 0 END) AS discount_transactions,
  SUM(CASE WHEN `Discount Availed` = 'No' THEN 1 ELSE 0 END) AS non_discount_transactions,
  COUNT(*) AS total_transactions,
  ROUND(SUM(CASE WHEN `Discount Availed` = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS discount_percentage
FROM ecommerce_data
GROUP BY `Product Category`
ORDER BY discount_percentage DESC;

-- 20 Average Net Spending by Product Category – What is the average net spending per transaction for each product category?
SELECT
  `Product Category`,
  ROUND(AVG(`Net Amount`), 2) AS avg_net_spending
FROM ecommerce_data
GROUP BY `Product Category`
ORDER BY avg_net_spending DESC;

-- 21 Discount Name Performance – For each discount name, how many transactions were made and what is the average discount amount?
SELECT
  `Discount Name`,
  COUNT(*) AS transaction_count,
  ROUND(AVG(`Discount Amount (INR)`), 2) AS avg_discount_inr
FROM ecommerce_data
WHERE `Discount Availed` = 'Yes'
GROUP BY `Discount Name`
ORDER BY avg_discount_inr DESC;