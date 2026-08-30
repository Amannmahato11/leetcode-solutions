# Write your MySQL query statement below
with t1 as (
    select d.name as department, e.name as employee, e.salary
    from employee e
    join department d on e.departmentID = d.id
)
, t2 as (
    select department, employee, salary, dense_rank()over (partition by department order by 
    salary desc) r 
    from t1
)

select department, employee, salary 
from t2
where r <=3