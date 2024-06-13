--Practice01:
SELECT a.CONTINENT, FLOOR(AVG(b.POPULATION))
from COUNTRY as a
INNER JOIN CITY as b
ON b.CountryCode = a.Code
GROUP BY a.CONTINENT

  --Practice02:
SELECT ROUND(COUNT(b.email_id)/ CAST(COUNT(DISTINCT a.email_id) AS DECIMAL),2)
as confirm_rate
FROM emails as a
LEFT JOIN texts as b
ON a.email_id = b.email_id
AND b.signup_action = 'Confirmed'

--Practice03:
SELECT a.age_bucket, 
ROUND(SUM(CASE WHEN b.activity_type = 'open' THEN
b. time_spent ELSE 0 END)/ CAST(SUM(b.time_spent) AS DECIMAL) * 100.0,2)
AS open_perc,
ROUND(SUM(CASE WHEN b.activity_type ='send' THEN 
b.time_spent ELSE 0 END)/ CAST(SUM(b.time_spent) AS DECIMAL) * 100.0,2) 
AS send_perc
FROM age_breakdown AS a
INNER JOIN activities AS b
ON a.user_id = b.user_id
AND b.activity_type in ('send', 'open')
GROUP BY a.age_bucket;

--Practice04:
SELECT a.customer_id 
FROM customer_contracts AS a
INNER JOIN products AS b
ON a.product_id = b.product_id
WHERE b.product_category IN ('Analytics', 'Containers', 'Compute')
GROUP BY a.customer_id
HAVING COUNT(DISTINCT b.product_category) = 3;

--Practice05:
SELECT mng.employee_id, mng.name, COUNT(emp.reports_to) AS reports_count,
ROUND(AVG(emp.age),0) AS average_age
FROM Employees as emp
LEFT JOIN Employees as mng
ON emp.reports_to = mng.employee_id
WHERE emp.reports_to IS NOT NULL
GROUP BY mng.employee_id, mng.name

--Practice06:
SELECT DISTINCT a.product_name, SUM(b.unit) AS unit FROM Products AS a
INNER JOIN Orders AS b
ON a.product_id = b.product_id
WHERE 
    EXTRACT(MONTH FROM b.order_date) = 2
    AND EXTRACT(YEAR FROM b.order_date) = 2020
GROUP BY a.product_name
HAVING SUM(b.unit) >= 100

--Practice07:
