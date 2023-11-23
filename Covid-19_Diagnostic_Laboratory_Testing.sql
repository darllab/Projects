Dataset from Kaggle: https://www.kaggle.com/datasets/aniketkolte04/covid-19-diagnostic-laboratory-testing-time-series
More details of this dataset, please visit the website.
Credits to the owner of this dataset
I use PostgreSQL as my database.
  
I have created these questions on my own. This projects shows positive and negative rate in each state and region. 

CREATE TABLE covid_1 (
	state VARCHAR(50),
	state_name VARCHAR(50),
	state_fips INTEGER,
	fema_region VARCHAR(50),
	overall_outcome VARCHAR(50),
	date DATE,
	new_results_reported INTEGER,
	total_results_reported INTEGER
	
);

COPY covid_1 FROM '/private/tmp/COVID-19_Diagnostic_Laboratory.csv' WITH CSV HEADER;

SELECT *
FROM covid_1

-- Determine number of cases per region whether positive or negative or inconclusive cases --

SELECT fema_region,
	SUM(CASE WHEN overall_outcome = 'Positive' THEN 1 END) AS positive_case,
	SUM(CASE WHEN overall_outcome = 'Negative' THEN 1 END) AS negative_case,
	SUM(CASE WHEN overall_outcome = 'Inconclusive' THEN 1 END) AS inconclusive_case
FROM covid_1
GROUP BY fema_region
ORDER BY fema_region ASC

-- Determine total_results_reported and new_results_reported per year --

SELECT EXTRACT(YEAR from date), SUM(total_results_reported) AS total_results, SUM(new_results_reported) AS new_results
FROM covid_1
GROUP BY EXTRACT(YEAR from date)
ORDER BY EXTRACT(YEAR from date) ASC

-- Determine top 10 state who has highest positive and negative cases --

SELECT state_name,
	SUM(CASE when overall_outcome = 'Positive' THEN 1 END) AS positive_cases,
	SUM(CASE WHEN overall_outcome = 'Negative' THEN 1 END) AS negative_cases
FROM covid_1
GROUP BY 1
ORDER BY 1 DESC
LIMIT 10
