SELECT
        c.customer_id,
        c.name
FROM orders o JOIN product p ON o.product_id = p.product_id JOIN customers c ON c.customer_id = o.customer_id
WHERE o.order_date >= '2020-06-01' AND o.order_date <= '2020-07-31'
GROUP BY c.customer_id, c.name
HAVING 
SUM(CASE WHEN  o.order_date >= '2020-06-01' AND o.order_date <= '2020-06-30' THEN p.price * o.quantity ELSE 0 END)>=100 AND 
SUM(CASE WHEN  o.order_date >= '2020-07-01' AND o.order_date <= '2020-07-31' THEN p.price * o.quantity ELSE 0 END)>=100;


