WITH iphone_buyers AS(
    SELECT s.buyer_id
FROM Sales s
JOIN Product p
  ON s.product_id = p.product_id
WHERE p.product_name = 'iPhone'
),

S8_buyers AS(
SELECT s.buyer_id
FROM Sales s
JOIN Product p
  ON s.product_id = p.product_id
WHERE p.product_name = 'S8'
)


SELECT
        DISTINCT *
FROM S8_buyers
WHERE buyer_id NOT IN (SELECT * FROM iphone_buyers)