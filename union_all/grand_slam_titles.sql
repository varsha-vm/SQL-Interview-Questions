SELECT
        grand_slams_titles AS player_id,
        b.player_name,
        COUNT(grand_slams_titles) AS grand_slams_count
FROM (SELECT wimbledon AS grand_slams_titles from championships
UNION ALL
SELECT fr_open from championships
UNION ALL
SELECT us_open from championships
UNION ALL
SELECT au_open from championships) a
JOIN players b ON a.grand_slams_titles = b.player_id
GROUP BY grand_slams_titles, player_name
ORDER BY grand_slams_count
