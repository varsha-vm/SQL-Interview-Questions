-- Write your MySQL query statement below
-- Approach => cross Join + GroupBy
-- Time: O(N)
-- Space: O(1)
SELECT
        s1.student_id,
        s1.student_name,
        s2.subject_name,
        COUNT(e.subject_name) AS attended_exams
FROM students s1
CROSS JOIN subjects s2 
LEFT JOIN examinations e ON s1.student_id = e.student_id AND s2.subject_name = e.subject_name
GROUP BY s1.student_id, s2.subject_name
ORDER BY s1.student_id, s2.subject_name;
