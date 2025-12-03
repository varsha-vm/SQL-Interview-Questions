-- Problem: LC 182 - Duplicate Emails
-- Concept: GROUP BY + HAVING
-- Time Complexity: O(n)
-- Space Complexity: O(1)

# Write your MySQL query statement below
SELECT
        email
FROM person
GROUP BY email
HAVING COUNT(email)>1;
