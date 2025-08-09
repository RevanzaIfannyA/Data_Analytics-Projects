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

-- 1
SELECT COUNT(DISTINCT TID) AS total_transactions
FROM ecommerce_data;
-- 2
SELECT
  ROUND(SUM(`Gross Amount`), 2) AS total_gross_revenue,
  ROUND(SUM(`Net Amount`), 2) AS total_net_revenue
FROM ecommerce_data;
-- 3
SELECT
  ROUND(AVG(`Net Amount`), 2) AS avg_net_per_transaction
FROM ecommerce_data;
-- 4
SELECT
  ROUND(COUNT(DISTINCT TID) / COUNT(DISTINCT CID), 2) AS avg_transactions_per_customer
FROM ecommerce_data;
-- 5
SELECT
  COUNT(DISTINCT CID) AS total_customers
FROM ecommerce_data;
-- 6
SELECT
	`Age Group`,
	COUNT(DISTINCT CID) AS customer_count
FROM ecommerce_data
GROUP BY `Age Group`
ORDER BY FIELD(`Age Group`, "under 18", "18-25", "25-45", "45-60", "60 and above");
-- 7
SELECT
  `Product Category`,
  COUNT(DISTINCT TID) AS transaction_count
FROM ecommerce_data
GROUP BY `Product Category`
ORDER BY transaction_count DESC;
-- 8
SELECT
  `Product Category`,
  ROUND(AVG(`Discount Amount (INR)`), 2) AS avg_discount_inr
FROM ecommerce_data
WHERE `Discount Amount (INR)` > 0
GROUP BY `Product Category`
ORDER BY avg_discount_inr DESC;

-- 9
SELECT
  `Purchase Method`,
  COUNT(*) AS transaction_count
FROM ecommerce_data
GROUP BY `Purchase Method`
ORDER BY transaction_count DESC;

-- 10
SELECT
  CONCAT(ROUND(
    COUNT(CASE WHEN `Discount Availed` = 'Yes' THEN 1 END) * 100.0 / COUNT(*), 2
  ), '%') AS discount_availed_percentage
FROM ecommerce_data;

-- 11
SELECT
  DATE_FORMAT(`Purchase Date`, '%Y-%m') AS month,
  COUNT(*) AS total_transactions,
  ROUND(SUM(`Net Amount`), 2) AS total_revenue
FROM ecommerce_data
GROUP BY month
ORDER BY month;

-- 12
SELECT
  DATE_FORMAT(`Purchase Date`, '%Y-%m') AS month,
  `Discount Availed` AS discount_used,
  COUNT(*) AS total_transactions,
  ROUND(SUM(`Net Amount`), 2) AS total_revenue
FROM ecommerce_data
GROUP BY month, discount_used
ORDER BY month, discount_used;

-- 13
SELECT
  `Purchase Method` AS payment_method,
  COUNT(*) AS total_transactions,
  ROUND(SUM(`Net Amount`), 2) AS total_revenue,
  ROUND(AVG(`Net Amount`), 2) AS avg_transaction_value
FROM ecommerce_data
GROUP BY payment_method
ORDER BY total_revenue DESC;

-- 14
SELECT
  Gender,
  COUNT(*) AS total_transactions,
  ROUND(SUM(`Net Amount`), 2) AS total_revenue,
  ROUND(AVG(`Net Amount`), 2) AS avg_transaction_value
FROM ecommerce_data
GROUP BY Gender
ORDER BY total_revenue DESC;

-- 15
SELECT
  `Age Group` AS age_group,
  COUNT(*) AS total_transactions,
  ROUND(SUM(`Net Amount`), 2) AS total_revenue,
  ROUND(AVG(`Net Amount`), 2) AS avg_transaction_value
FROM ecommerce_data
GROUP BY age_group
ORDER BY FIELD(age_group, "under 18", "18-25", "25-45", "45-60", "60 and above");

-- 16
SELECT
  Gender,
  ROUND(
    COUNT(CASE WHEN `Discount Availed` = 'Yes' THEN 1 END) 
    / COUNT(*) * 100, 
    2
  ) AS discount_usage_percentage
FROM ecommerce_data
GROUP BY Gender;

-- 17
SELECT
  Gender,
  `Purchase Method` AS payment_method,
  COUNT(*) AS total_transactions,
  ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY Gender), 2) AS percentage_within_gender
FROM ecommerce_data
GROUP BY Gender, `Purchase Method`
ORDER BY Gender, total_transactions DESC;

-- 18
SELECT
  Location AS city,
  COUNT(*) AS total_transactions,
  ROUND(SUM(`Net Amount`), 2) AS total_revenue,
  ROUND(SUM(`Net Amount`) / (SELECT SUM(`Net Amount`) FROM ecommerce_data) * 100, 2) AS revenue_percentage
FROM ecommerce_data
GROUP BY city
ORDER BY total_revenue DESC;

-- 19
SELECT
  `Product Category`,
  SUM(CASE WHEN `Discount Availed` = 'Yes' THEN 1 ELSE 0 END) AS discount_transactions,
  SUM(CASE WHEN `Discount Availed` = 'No' THEN 1 ELSE 0 END) AS non_discount_transactions,
  COUNT(*) AS total_transactions,
  ROUND(SUM(CASE WHEN `Discount Availed` = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS discount_percentage
FROM ecommerce_data
GROUP BY `Product Category`
ORDER BY discount_percentage DESC;

-- 20
SELECT
  `Product Category`,
  ROUND(AVG(`Net Amount`), 2) AS avg_net_spending
FROM ecommerce_data
GROUP BY `Product Category`
ORDER BY avg_net_spending DESC;

-- 21
SELECT
  `Discount Name`,
  COUNT(*) AS transaction_count,
  ROUND(AVG(`Discount Amount (INR)`), 2) AS avg_discount_inr
FROM ecommerce_data
WHERE `Discount Availed` = 'Yes'
GROUP BY `Discount Name`
ORDER BY avg_discount_inr DESC;