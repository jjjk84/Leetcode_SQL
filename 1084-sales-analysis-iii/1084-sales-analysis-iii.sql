# Write your MySQL query statement below
-- the products that were only sold
-- between 2019-01-01 and 2019-03-31



SELECT s.product_id
     , p.product_name
FROM sales AS s
    JOIN product AS p ON s.product_id = p.product_id
GROUP BY s.product_id
    HAVING MAX(sale_date) BETWEEN '2019-01-01' AND '2019-03-31'
       AND MIN(sale_date) BETWEEN '2019-01-01' AND '2019-03-31'
    