-- CUSTOMER ANALYSIS using E-Commerce Sales dataset --
-- Dataset from Kaggle: https://www.kaggle.com/datasets/thedevastator/unlock-profits-with-e-commerce-sales-data?resource=download

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

SELECT b2b, COUNT(*) as customer_count
FROM sales_analysis1
GROUP BY b2b
