-- Write your MySQL query statement below
-- Time: O(N)
-- Space: O(N)
WITH orders_item_info AS(
    SELECT
        buyer_id
FROM orders 
WHERE YEAR(order_date)='2019'
)

SELECT
        user_id AS buyer_id,
        join_date,
        COUNT(buyer_id)AS orders_in_2019
FROM users u LEFT JOIN orders_item_info oi on u.user_id = oi.buyer_id
GROUP BY user_id