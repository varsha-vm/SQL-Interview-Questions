--Write your MySQL query statement below
--Approach: Group BY + Having
--Time:O(N)
--Space:O(N)
SELECT
        class
FROM courses
GROUP BY class
Having count(student)>=5;