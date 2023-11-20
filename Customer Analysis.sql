-- CUSTOMER ANALYSIS using E-Commerce Sales dataset --
-- Dataset from Kaggle: https://www.kaggle.com/datasets/thedevastator/unlock-profits-with-e-commerce-sales-data?resource=download--
-- Database: PostgreSQL 

SELECT * 
FROM sales_analysis1

SELECT status
FROM sales_analysis1
WHERE status LIKE '%Cancelled%'

-- What are the top cities/states/countries for sales? --

SELECT ship_city, SUM(amount)
FROM sales_analysis1
GROUP BY ship_city, amount
ORDER BY amount DESC
LIMIT 10;

-- Are there any trends in order cancellations? --

SELECT date(date) AS cancellation_date, COUNT(*) as cancellation_count
FROM sales_analysis1
WHERE status = 'Shipped - Returned to Seller'
GROUP BY cancellation_date
ORDER BY cancellation_count DESC

-- What is the distribution of B2B vs B2C customers? -- 

SELECT 
	COUNT(CASE WHEN b2b = 'False' THEN 1 END) AS customer_false,
	COUNT(CASE WHEN b2b = 'True' THEN 1 END) AS customer_true
FROM sales_analysis1


ANSWERS:

1. What are the top cities/states/countries for sales?
"JALANDHAR"	5495
"KANPUR"	2860
"MAHENDRAGARH"	2796
"NAGPUR"	2598
"THANE"	2598
"SARDARSHAHAR"	2598
"DIGRAS"	2598
"KURNOOL"	2442
"PUNE"	2442
"ALWAR"	2372

2. Are there any trends in order cancellations?



3. What is the distribution of b2b vs b2c customers? 
  b2b	  customer_count
  false	32081
  true	267

