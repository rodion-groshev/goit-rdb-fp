select * from  infectious_cases;
select * from countries;
select * from  details;









select c.entity, avg(d.number_rabies) as avg, min(d.number_rabies) as min, max(d.number_rabies) as max, sum(d.number_rabies) as sum 
from details as d 
join countries as c on d.country_id = c.id
group by d.country_id
order by avg desc
limit 10;   