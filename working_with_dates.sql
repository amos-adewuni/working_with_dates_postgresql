--Scripts for Working with Dates and Timestamp in Postgresql

-- Time zone conversion
--current time zone
SHOW TIME ZONE;

--Change time zone to UTC
SET TIME ZONE 'UTC';

--Create columns with different time zones
SELECT
	date_created AT TIME ZONE 'pst' AS pacific_datetime,
	date_created AT TIME ZONE 'utc' AS universal_datetime
FROM ev_311
LIMIT 5;

--SYSTEM TIME
SELECT 
	CURRENT_DATE AS today_date,
	CURRENT_TIMESTAMP AS today_date_and_time,
	CURRENT_TIME AS now_time;
--CURRENT_DATE function


SELECT
	CURRENT_DATE - date AS total_num_of_days,
	total_units * sale_price AS sales
FROM retail_sales
ORDER BY total_num_of_days DESC, sales DESC
LIMIT 5;

--DATE_TRUNC
SELECT 
	DATE_TRUNC('month',date_renting) AS date_rent,
	date_renting
FROM renting
LIMIT 5;

SELECT 
	DATE_TRUNC('month',date_renting) AS date_rent,
	COUNT(renting_id) AS total_number_rented
FROM renting
GROUP BY date_rent
ORDER BY total_number_rented DESC
LIMIT 5;

SELECT 
	DATE_TRUNC('year',date) AS date_trun,
	SUM(total_units * sale_price) AS annual_sales
FROM retail_sales
GROUP BY date_trun;


