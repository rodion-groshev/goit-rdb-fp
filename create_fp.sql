create database pandemic;

use pandemic;

create table countries (
id int auto_increment primary key,
entity varchar(55),
code varchar(55)
);

insert into countries (entity, code) select distinct entity, code from infectious_cases;

create table details (
id int auto_increment primary key,
country_id int,
year varchar(50),
number_yaws int,
polio_cases int,
cases_guinea_worm int,
number_rabies float,
number_malaria float,
number_hiv float,
number_tuberculosis float,
number_smallpox float,
number_cholera_cases float,
foreign key (country_id) references countries(id)
);

insert into details (country_id, year, number_yaws, polio_cases, cases_guinea_worm, number_rabies, number_malaria, number_hiv, number_tuberculosis, number_smallpox, number_cholera_cases) 
select c.id, i.year, nullif(i.number_yaws, ''), i.polio_cases, i.cases_guinea_worm, nullif(i.number_rabies, ''), nullif(i.number_malaria, ''), nullif(i.number_hiv, ''), nullif(i.number_tuberculosis, ''), nullif(i.number_smallpox, ''), nullif(i.number_cholera_cases, '') 
from infectious_cases as i 
join countries as c on i.code = c.code;





