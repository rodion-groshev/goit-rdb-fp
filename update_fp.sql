drop table if exists temp;
create temporary table temp as 
(select year, makedate(year, 1) as reworked_year, current_date() as date_now, timestampdiff(year, makedate(year, 1), current_date()) as difference from details);
select * from temp;