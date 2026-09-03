# Write your MySQL query statement below
SELECT *
FROM Cinema c
WHERE  c.id%2 !=0 AND  c.description !='boring'
ORDER BY rating DESC