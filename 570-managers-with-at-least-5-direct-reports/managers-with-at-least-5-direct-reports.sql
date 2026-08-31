# Write your MySQL query statement below
SELECT Name FROM Employee WHERE Id IN
(SELECT ManagerID FROM Employee GROUP BY ManagerId
HAVING (COUNT(DISTINCT ID)) >=5)