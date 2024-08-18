-- 2. Нормалізуйте таблицю infectious_cases до 3ї нормальної форми. Збережіть у цій же схемі дві таблиці з нормалізованими даними.
Use pandemic;
select max(Length(Entity)), max(length(Code)) from pandemic.infectious_cases;

create table if not exists country
(
id int auto_increment primary key,
entity varchar(34) not null,
code varchar(8) not null
);

insert into country (entity, code)
select distinct entity, code from infectious_cases;

select count(*), count(distinct entity, code) from country;

select count(distinct entity, code) from infectious_cases;

--

create table infectious_cases_norm like infectious_cases;

alter table infectious_cases_norm
add column country_id int first;

alter table infectious_cases_norm
drop column Entity,
drop column Code;

alter table infectious_cases_norm
add constraint infectious_cases_norm_country_fk
foreign key (country_id) references country(id);














select * from infectious_cases_norm;

show create table infectious_cases;

alter table infectious_cases_norm
add column inf_id int auto_increment primary key first;


insert into infectious_cases_norm
(
  `country_id`,
  `Year`,
  `Number_yaws`,
  `polio_cases`,
  `cases_guinea_worm`,
  `Number_rabies`,
  `Number_malaria`,
  `Number_hiv` ,
  `Number_tuberculosis`,
  `Number_smallpox` ,
  `Number_cholera_cases` 
)
(
select
  `id`,
  `Year`,
  `Number_yaws`,
  `polio_cases`,
  `cases_guinea_worm`,
  `Number_rabies`,
  `Number_malaria`,
  `Number_hiv` ,
  `Number_tuberculosis`,
  `Number_smallpox` ,
  `Number_cholera_cases` 
from infectious_cases
inner join country on infectious_cases.Entity= country.entity and infectious_cases.Code= country.Code
);




select * from infectious_cases_norm;

