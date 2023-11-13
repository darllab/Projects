Start of Portfolio Project # 1 using SQL, we will do EDA for Amazon Sales Analysis. 
DATASET: https://www.kaggle.com/datasets/thedevastator/unlock-profits-with-e-commerce-sales-data?resource=download from KAGGLE
Credits to the owner of the dataset.

-- Start running a query -- 
-- Extract, Transform and Load --
  
SELECT *
FROM sales_amazon_7

-- Question # 1, what is the total revenue with a specific time period? --

SELECT SUM(amount) AS total_revenue
FROM sales_amazon_7
WHERE date BETWEEN '1/1/2022' AND '12/1/2022'

SELECT date, SUM(amount) AS total_revenue
FROM sales_amazon_7
GROUP BY date

-- Question # 2, what are the top 10 products by sales? --

SELECT category, SUM(amount) as total_sales
FROM sales_amazon_7
GROUP BY category
ORDER BY total_sales DESC
LIMIT 10;

-- Question # 3, What products has the most highest order?  --

SELECT category, COUNT(category) AS total_category_count
FROM sales_amazon_7
GROUP BY category
ORDER by total_category_count DESC
LIMIT 5

-- Question #4, what are the peak sales period? (week, month, day, year)? -- 

SELECT date, SUM(amount) as peak_sales
FROM sales_amazon_7
WHERE date BETWEEN '1/1/2022' AND '12/1/2022'
GROUP BY date 
ORDER BY peak_sales DESC

-- Since the dataset only contains year 2022, I just focused on peak sales period per month -- 



