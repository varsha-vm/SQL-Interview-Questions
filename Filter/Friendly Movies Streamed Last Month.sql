-- Write your query below

SELECT
        DISTINCT b.title
FROM tv_program a JOIN content b ON a.content_id = b.content_id
WHERE (a.program_date >='2020-06-01' AND a.program_date <'2020-07-01') AND b.kids_content = 'Y' AND b.content_type = 'Movies'