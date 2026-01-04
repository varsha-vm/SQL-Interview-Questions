-- Write your MySQL query statement below
-- Time: O(N log N) =? Iterate through N employees and sorting salaries per department
-- Space: O(N) => Usage of window function
WITH CTE AS(
    SELECT
        b.name AS department,
        a.name AS employee,
        a.salary,
        DENSE_RANK() OVER(PARTITION BY b.id ORDER BY salary DESC) AS rnk
FROM employee a JOIN department b ON a.departmentid = b.id
)

SELECT
        department,
        employee,
        salary
FROM cte
WHERE rnk<=3;

