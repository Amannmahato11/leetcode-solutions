# Write your MySQL query statement below
 with t1 as (
    select email, min(id) as id
    from person 
    group by email
 )

 delete from person where id not in (select id from t1)