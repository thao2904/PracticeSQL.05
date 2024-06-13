SELECT ROUND(COUNT(b.email_id)/ CAST(COUNT(DISTINCT a.email_id) AS DECIMAL),2)
as confirm_rate
FROM emails as a
LEFT JOIN texts as b
ON a.email_id = b.email_id
AND b.signup_action = 'Confirmed'