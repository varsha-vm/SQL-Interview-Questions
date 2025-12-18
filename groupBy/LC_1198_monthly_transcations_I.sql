-- Approach: Date_format(), if()
-- Time: o(N) => Group By creates shuffling
-- Space: O(N) => Group By created a hash-table to hold the data
SELECT
        DATE_FORMAT(trans_date, '%Y-%m') as month,
        country,
        count(*) as trans_count,
        SUM(if(state='approved', 1, 0)) AS approved_count, 
        SUM(amount) AS trans_total_amount,
        SUM(if(state='approved', amount, 0)) AS approved_total_amount
FROM transactions 
GROUP BY DATE_FORMAT(trans_date, '%Y-%m'), country
