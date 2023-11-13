DATASET from Kaggle: https://www.kaggle.com/datasets/harshsingh2209/supply-chain-analysis
CREDITS TO THE OWNER OF THIS DATASET. 

About Dataset
Supply chain analytics is a valuable part of data-driven decision-making in various industries such as manufacturing, retail, healthcare, and logistics. It is the process of collecting, analyzing and interpreting data related to the movement of products and services from suppliers to customers.

Here is a dataset we collected from a Fashion and Beauty startup. The dataset is based on the supply chain of Makeup products. Below are all the features in the dataset:

Product Type
SKU
Price
Availability
Number of products sold
Revenue generated
Customer demographics
Stock levels
Lead times
Order quantities
Shipping times
Shipping carriers
Shipping costs
Supplier name
Location
Lead time
Production volumes
Manufacturing lead time
Manufacturing costs
Inspection results
Defect rates
Transportation modes
Routes
Costs
-- START QUERY --

CREATE TABLE supply_chain (
	product_type TEXT,
	SKU TEXT,
	price REAL,
	availability INT,
	number_of_product_sold INT,
	revenue_generated REAL,
	customer_demographic TEXT,
	stock_levels INT,
	lead_times INT,
	order_quantities INT,
	shipping_times INT,
	shipping_carriers TEXT,
	shipping_costs REAL,
	supplier_name TEXT,
	location TEXT,
	lead_time INT,
	production_volume INT,
	manufacturing_lead_time INT,
	manufacturing_costs REAL,
	inspection_results TEXT,
	defect_rates TEXT,
	transportation_modes TEXT,
	routes TEXT,
	costs REAL

)

COPY supply_chain FROM '/private/tmp/supply_chain_data.csv' WITH CSV HEADER;

SELECT *
FROM supply_chain

-- COST ANALYSIS --
-- What are the most costly products to produce? --

SELECT MAX(product_type), SUM(costs)::NUMERIC(10,2)
FROM supply_chain
GROUP BY product_type

-- How do manufacturing costs relate to selling prices? --

SELECT product_type, SUM(manufacturing_costs)::NUMERIC(10,2) AS manufacturing_costs
FROM supply_chain
GROUP BY product_type

SELECT product_type, SUM(price)::NUMERIC(10,2) AS manufacturing_price
FROM supply_chain
GROUP BY product_type

-- What is the overall profitability (revenue - costs) for each product? --

SELECT product_type,
	revenue_generated - costs AS overall_profitability
FROM supply_chain	
ORDER BY product_type DESC



-- LOGISTIC ANALYSIS --

-- What are the most common transportation modes used? --

SELECT DISTINCT(transportation_modes)
FROM supply_chain

-- How do different transportation modes affect lead times and costs? --

SELECT transportation_modes, SUM(lead_times) AS total_leadtimes
FROM supply_chain
GROUP BY transportation_modes
ORDER BY total_leadtimes DESC

SELECT transportation_modes, SUM(costs)::NUMERIC(10,2) AS total_cost
FROM supply_chain
GROUP BY transportation_modes
ORDER BY total_cost DESC

-- Which routes are most commonly used, and what is their impact on costs and lead times? --

SELECT routes, SUM(lead_times) AS lead_times, SUM(costs)::NUMERIC(10,2) AS total_costs
FROM supply_chain
GROUP BY routes


-- You can view the dashboard here on Tableau Public, here's the link for Cost Analysis: https://public.tableau.com/app/profile/darlla.bulagner/viz/CostAnalysisPortfolioProject/Dashboard1 --


ANSWER THE QUESTIONS:

COST ANALYSIS:

1. What are the most costly products to produce? 
-- We can conclude that the most costly products that has produce is Skincare. 

2. How do manufacturing costs relate to selling prices?
-- As the manufacturing cost highly, the selling prices also increase. The business needs to increase prices so that
they can recover to their costs.

3. What is the overall profitability (revenue - costs) for each product?
-- skincare	219,398.84
-- haircare	157,126.53
-- cosmetics	148,154.87



LOGISTICS ANALYSIS:

1. What are the most common transportation modes used?
-- The common transportation modes used are Air, Rail, Sea and Road.

2. How do different transportation modes affect lead times and costs?
-- If these tranportation modes takes longer lead time, the company may have suffer higher costs for them to deliver the shipment on time.
-- Because the longer the lead time, these carrier may have need to charge the company additional courier fee. 
-- Also, the couriers charged depends on how much days delayed. If they're gonna put some costs for these modes, they're gonna pass it on the consumers.

3. Which routes are most commonly used, and what is their impact on costs and lead times? 
-- Routes A and B are the most commonly used. The longer the lead time, the higher the costs. 
