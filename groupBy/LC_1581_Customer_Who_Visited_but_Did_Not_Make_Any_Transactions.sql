--Write your MySQL query statement below
--Approach: Left Join + GroupBy
--Time: O(N)
--Space: O(N)
SELECT
       a.customer_id,
       COUNT(*) AS count_no_trans
FROM visits a
LEFT JOIN transactions b on a.visit_id = b.visit_id
WHERE b.visit_id IS NULL
GROUP BY a.customer_id;