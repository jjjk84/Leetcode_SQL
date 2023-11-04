# Write your MySQL query statement below
-- the records with three or more rows with consecutive id's
-- the number of people is greater than or equal to 100 for each
-- ordered by visit_date in ascending order

WITH base AS(
    SELECT *
         , LAG(id, 2) OVER (ORDER BY id) AS pre_pre_id
         , LAG(id, 1) OVER (ORDER BY id) AS pre_id
         , LEAD(id, 1) OVER (ORDER BY id) AS next_id
         , LEAD(id, 2) OVER (ORDER BY id) AS next_next_id
    FROM stadium
    WHERE people >= 100
)


SELECT id
     , visit_date
     , people
FROM base
WHERE (pre_pre_id + 1 = pre_id AND pre_id + 1 = id)
   OR (pre_id + 1 = id AND id + 1 = next_id)
   OR (id + 1 = next_id AND next_id + 1 = next_next_id)
ORDER BY visit_date;