WITH non_quarterly_sold_prods AS(
SELECT
       DISTINCT p.product_id
FROM product p JOIN sales s ON p.product_id = s.product_id
WHERE  s.sale_date < '2019-01-01' OR s.sale_date > '2019-03-31' 
)

SELECT
        DISTINCT p.product_id,
        p.product_name
FROM product p JOIN sales s ON p.product_id = s.product_id
WHERE (s.sale_date >= '2019-01-01' AND s.sale_date <= '2019-03-31') AND p.product_id NOT IN 
(SELECT product_id FROM non_quarterly_sold_prods);

