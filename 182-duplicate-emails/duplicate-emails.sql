# Write your MySQL query statement below
select email as Email
from person
group by email
having count(email) > 1