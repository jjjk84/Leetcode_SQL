# Write your MySQL query statement below
-- the records with three or more rows with consecutive id's
-- the number of people is greater than or equal to 100 for each
-- ordered by visit_date in ascending order

WITH over_100 AS (
    SELECT id
    FROM stadium
    WHERE people >= 100
), con_sec AS (
    SELECT id
         , LEAD(id, 1) OVER (ORDER BY id) AS next_id
         , LEAD(id, 2) OVER (ORDER BY id) AS next_next_id
    FROM over_100)


SELECT *
FROM stadium
WHERE (id - 1, id, id + 1) IN (
    SELECT *
    FROM con_sec
    WHERE id + 1 = next_id
      AND next_id + 1 = next_next_id
)
   OR (id, id + 1, id + 2) IN (
    SELECT *
    FROM con_sec
    WHERE id + 1 = next_id
      AND next_id + 1 = next_next_id
)
   OR (id - 2, id - 1, id) IN (
    SELECT *
    FROM con_sec
    WHERE id + 1 = next_id
      AND next_id + 1 = next_next_id
)
