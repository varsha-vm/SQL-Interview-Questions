# Write your MySQL query statement below
WITH delivery_status AS(
SELECT
        *,
        CASE
            WHEN order_date = customer_pref_delivery_date THEN 'immediate'
            ELSE 'scheduled'
        END AS status
FROM delivery
)

SELECT
        ROUND((SUM(IF(status = 'immediate', 1, 0)) / COUNT(status)) * 100, 2) AS immediate_percentage
FROM delivery_status