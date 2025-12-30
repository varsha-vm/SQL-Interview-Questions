-- Write your MySQL query statement below
-- Time: O(N)
-- Space: O(1)
WITH disqualified AS(
SELECT
        o.sales_id
FROM company c JOIN orders o ON c.com_id=o.com_id
WHERE c.name = 'RED'
)

SELECT 
        name
FROM salesperson WHERE sales_id NOT IN (select * from disqualified);

