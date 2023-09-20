# Write your MySQL query statement below
DELETE FROM person
WHERE id NOT IN (
    SELECT sub.min_id 
    FROM (
        SELECT email, min(id) AS min_id
        FROM person
        GROUP BY email
        ) sub
    );