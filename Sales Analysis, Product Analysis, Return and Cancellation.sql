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


-- SALES ANALYSIS --	

	
-- What is the total revenue with a specific time period? --

SELECT SUM(amount)::NUMERIC(10,2) AS total_revenue
FROM sales_analysis1
WHERE date BETWEEN '1/1/2022' AND '12/1/2022'

SELECT date, SUM(amount)::NUMERIC(10,2) AS total_revenue
FROM sales_analysis1
GROUP BY date

-- What are the top 10 products by sales? --

SELECT category, SUM(amount)::NUMERIC(10,2) as total_sales
FROM sales_analysis1
GROUP BY category
ORDER BY total_sales DESC
LIMIT 10

-- What products has the most highest order?  --

SELECT category, COUNT(category) AS total_category_count
FROM sales_analysis1
GROUP BY category
ORDER by total_category_count DESC
LIMIT 10

-- What are the peak sales period? (week, month, day, year)? -- 

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

	

-- RETURN AND CANCELLATION RATE --

-- What is the return and cancellation rate -- 

SELECT status, COUNT(*) * 100.0 / (SELECT COUNT(*) FROM sales_analysis1) AS percentage_rate
FROM sales_analysis1
WHERE status IN ('Cancelled', 'Shipped - Returned to Seller')
GROUP BY status;


-- Are there specific products or categories that have a higher return rate? --

SELECT category, COUNT(status) as return_product
FROM sales_analysis1
WHERE status = 'Shipped - Returned to Seller'
GROUP BY category
ORDER BY return_product DESC


ANSWER TO THE QUESTIONS:

SALES ANALYSIS:
1. What is the total revenue generated over a specific time period?
-- The total revenue generated is 78592678.30 

2. What are the top 10 products by sales?

Set		39204124.03
Kurta		21299546.70
Western Dress	11216072.69
Top	        5347792.30
Ethnic Dress	791217.66
Blouse		458408.18
Bottom		150667.98
Saree		123933.76
Dupatta		915.00

3. What products has the most highest order?

Western Dress	15500
Top		10622
Ethnic Dress	1159
Blouse		926
Bottom		440
Saree		164
Dupatta		3

4. What are the peak sales periods (day, week, month, year)?

2022-06-29	39204124.03
2022-06-29	21299546.70
2022-06-29	11216072.69
2022-06-29	5347792.30
2022-06-29	791217.66
2022-06-29	458408.18
2022-06-29	150667.98
2022-06-28	123933.76
2022-06-26	915.00


PRODUCT ANALYSIS

1. Which top 5 categories of products are most popular?
-- Set, Kurta, Western Dresses, Top and Ethnic Dresses

2. Are there specific styles that are more popular than others?

Style		total_count_style
"JNE3797"	4224
"JNE3405"	2263
"J0230"		1868
"SET268"	1860
"J0341"		1630
"J0003"		1627
"SET324"	1284
"SET345"	1250
"JNE3373"	1173
"JNE3440"	1054

3. What is the average quantity of products ordered?

Category	average_quantity
"Blouse"	0.932
"Bottom"	0.905
"Dupatta"	1.000
"Ethnic Dress"	0.909
"Saree"		0.927
"Set"		0.901
"Top"		0.932
"Western Dress"	0.900
"kurta"		0.903


RETURN AND CANCELLATION ANALYSIS

1. What is the return and cancellation rate?
	
status				rate_status
"Shipped - Returned to Seller"	1953
"Cancelled"			18332

2. Are there specific products or categories that have a higher return rate?

category	return_product
"Set"		766
"kurta"		715
"Western Dress"	314
"Top"		124
"Ethnic Dress"	16
"Blouse"	12
"Bottom"	5
"Saree"		1

You can see the dashboard in my Tableau Public: https://public.tableau.com/app/profile/darlla.bulagner/viz/PortfolioProject2_16998509900550/Dashboard1
