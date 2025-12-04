--Write your MySQL query statement below
--Time:O(N+M)
--Space:O(min(N, M))
SELECT
        name AS customers
FROM customers c LEFT JOIN orders o ON (c.id=o.customerid)
WHERE o.id IS NULL;