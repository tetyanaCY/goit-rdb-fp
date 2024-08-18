-- 4. Побудуйте колонку різниці в роках.
--  Для оригінальної або нормованої таблиці для колонки Year побудуйте з використанням вбудованих SQL-функцій:
-- атрибут, що створює дату першого січня відповідного року,
-- Наприклад, якщо атрибут містить значення ’1996’, то значення нового атрибута має бути ‘1996-01-01’.
-- атрибут, що дорівнює поточній даті,
-- атрибут, що дорівнює різниці в роках двох вищезгаданих колонок.
-- Перераховувати всі інші атрибути, такі як Number_malaria, не потрібно.

Use pandemic;
select 
     Year, 
     makedate(Year,1) first_day,
     curdate(),
     timestampdiff(Year, makedate(Year,1), curdate()) as diff_years
from infectious_cases_norm;

alter table infectious_cases_norm
add column first_day date,
add column cur_day date,
add column diff_years int;

select year, first_day, diff_years from infectious_cases_norm;

update infectious_cases_norm set first_day=makedate(Year,1);


select @@sql_safe_updates;
select @@sql_safe_updates=0;


update infectious_cases_norm set first_day=makedate(Year,1);
select year, first_day, cur_day, diff_years from infectious_cases_norm;
update infectious_cases_norm set cur_day=curdate();
update infectious_cases_norm set diff_years=timestampdiff(Year, makedate(Year,1), curdate());


