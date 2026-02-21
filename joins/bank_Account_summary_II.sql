-- Write your query below

WITH CTE AS(
SELECT
        account,
        SUM(amount) AS balance
FROM transactions
GROUP BY account 
HAVING SUM(amount) > 10000
)

SELECT
        a.name,
        b.balance
FROM users a JOIN CTE b on a.account = b.account
