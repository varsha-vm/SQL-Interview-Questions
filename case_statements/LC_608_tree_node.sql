--Write your MySQL query statement below
--Time: O(N LOG N) => Distinct(sort) + Join
--Space: O(N) => CTE
WITH family_tree AS(
SELECT
        t1.id as id,
        t1.p_id as parent_id,
        t2.id as child_id
FROM tree t1 LEFT JOIN tree t2 ON (t1.id=t2.p_id))

SELECT 
        DISTINCT id,
        CASE 
            WHEN parent_id IS NULL THEN 'Root'
            WHEN child_id IS NULL THEN 'Leaf'
        ELSE 'Inner' END AS 'type'
FROM family_tree