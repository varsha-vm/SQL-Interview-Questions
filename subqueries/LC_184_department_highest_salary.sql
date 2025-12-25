-- Write your MySQL query statement below
-- Time: O(N)
-- Space: O(N)
WITH CTE AS(
SELECT 
        MAX(Salary) AS salary,
        departmentid as dept_id
FROM employee
GROUP BY departmentid
)

SELECT
        d.name AS department,
        e.name AS employee,
        e.salary as salary
FROM employee e
JOIN department d ON (e.departmentid = d.id)
JOIN CTE c on c.dept_id = d.id AND c.salary = e.salary