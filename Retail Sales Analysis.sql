-- SALES ANALYSIS -- 
-- Extract, Transform and Load --

CREATE TABLE sales_analysis1 (
	order_id VARCHAR(100),
	date DATE,
	status VARCHAR(100),
	fulfillment VARCHAR(50),
	sales_channel VARCHAR(50),
	ship_service_level VARCHAR(50),
	style VARCHAR(50),
	stock_keeping_unit VARCHAR(50),
	category VARCHAR(50),
	size VARCHAR(50),
	asin VARCHAR(50),
	courier_status VARCHAR(50),
	quantity INT,
	currency VARCHAR(50),
	amount DOUBLE PRECISION,
	ship_city VARCHAR(50),
	ship_postal_code VARCHAR(50),
	ship_state VARCHAR(50),
	ship_country VARCHAR(50),
	promotion_ids TEXT,
	b2b BOOLEAN,
	fulfilled_by VARCHAR(50)

)

COPY sales_analysis1 FROM '/private/tmp/Amazon Sale Report.csv' WITH CSV HEADER;

SELECT *
FROM sales_analysis1


-- Question # 1, what is the total revenue with a specific time period? --

SELECT SUM(amount)::NUMERIC(10,2) AS total_revenue
FROM sales_analysis1
WHERE date BETWEEN '1/1/2022' AND '12/1/2022'

SELECT date, SUM(amount)::NUMERIC(10,2) AS total_revenue
FROM sales_analysis1
GROUP BY date

-- Question # 2, what are the top 10 products by sales? --

SELECT category, SUM(amount)::NUMERIC(10,2) as total_sales
FROM sales_analysis1
GROUP BY category
ORDER BY total_sales DESC
LIMIT 10

-- Question # 3, What products has the most highest order?  --

SELECT category, COUNT(category) AS total_category_count
FROM sales_analysis1
GROUP BY category
ORDER by total_category_count DESC
LIMIT 10

-- Question #4, what are the peak sales period? (week, month, day, year)? -- 

SELECT category, MAX(date), SUM(amount)::NUMERIC(10,2) as peak_sales
FROM sales_analysis1
WHERE date BETWEEN '1/1/2022' AND '12/1/2022'
GROUP BY category
ORDER BY peak_sales DESC


-- PRODUCT ANALYSIS --

-- Which categories of products are most popular? --

SELECT category, COUNT(*) AS total_number_category
FROM sales_analysis1
GROUP BY category

-- Are there specific styles that are more popular than others? --

SELECT style, COUNT(style) as total_count_style
FROM sales_analysis1
GROUP BY style
ORDER BY total_count_style DESC
LIMIT 10

-- What is the average quantity of products ordered? -- 

SELECT category, AVG(quantity)::NUMERIC(10,3) AS average_quantity
FROM sales_analysis1
GROUP BY category
