--Time: O(N log N) => Full window scan + Sort in Asc
--Space: O(N) -> Due to Join
--Write your MySQL query statement below
WITH CTE AS(
SELECT 
       *,
       ROW_NUMBER() OVER(PARTITION BY email ORDER BY id ASC) AS row_numb
FROM person)


DELETE p FROM person p 
JOIN cte c ON (p.id=c.id)
 WHERE c.row_numb > 1;
