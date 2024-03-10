   use hr;

--  1 уровень сложности: 1. Напишите запрос, который выводит идентификатор сотрудника, его имя и фамилию, а также категорию зарплаты на основе следующих условий:

-- Если зарплата меньше 5000, категория "Низкая".
-- Если зарплата от 5000 до 10000, категория "Средняя".
-- Если зарплата больше 10000, категория "Высокая".
select * from employees;

select employee_id,first_name,last_name,  
case 
	when salary < 5000 then 'Low'
    when salary between 5000 and 10000 then 'Average'
    when salary > 10000 then 'High'
 end as    category
 from employees;
 
-- Определение размера премии сотрудникам:
-- Напишите запрос, который выводит идентификатор сотрудника, его имя и фамилию, а также размер премии на основе следующих условий:
-- Если зарплата меньше 5000, премия составляет 10% от зарплаты.
-- Если зарплата от 5000 до 10000, премия составляет 15% от зарплаты.
-- Если зарплата больше 10000, премия составляет 20% от зарплаты.

select employee_id, first_name, last_name, 
	case 
		when salary < 5000 then salary*0.1
        when salary between 5000 and 10000 then salary*0.15
        when salary > 10000 then salary*0.2
	end as salary_bonus
 from employees;   
 
 -- Получить список стран с указанием их региона и обозначением страны "EU" для стран Европейского союза, "Non-EU" для остальных стран.
 
 select t1.country_name, t2.region_name,
 case
	when region_name = 'Europe' then 'EU'
    else 'Non-EU'
end as notation
from countries t1
inner join regions t2
on t1.region_id = t2.region_id;

-- Получить список стран с указанием количества символов в их названиях.

select country_name, length(country_name) as quantatyofsymbols
from countries;

-- Получить список стран и их первые три символа в названии

select country_name, left(country_name,3) as first_three_symbols
from countries;

-- Получить список сотрудников с заменой их email на "Confidential", если он содержит слово "sqltutorial"

select  replace('sqltutorial','sqltutorial','Confidential') as email;

select employee_id, first_name, email,last_name, 
case 
	when email = 'sqltutorial' then 'Confidential' 
end   as change_email  
from employees
where email = 'sqltutorial';

select employee_id, first_name, email,last_name, 
case 
	when email = 'JLIVINGS' then  replace('JLIVINGS','JLIVINGS','Confidential') 
end   as change_email  
from employees;


-- Получить список сотрудников и указать их email в нижнем регистре.

select employee_id, first_name, last_name,  lower(email) as email
from employees;

-- Получить список сотрудников(firstname, lastname) с указанием их должности(job_title).
select t1.first_name, t1.last_name, job_title
from employees t1
inner join jobs t2
on t1.job_id = t2.job_id;

-- Получить список отделов(department_name) и их названий с указанием местоположения(city).

select t1.department_name, t2.city
from departments t1
join locations t2
on t1.location_id = t2.location_id;

-- Получить список отделов(departmentname) и их менеджеров(firstname, last_name).

select t1.department_name, t2.first_name, t2.last_name
from departments t1
inner join employees t2
on t1.manager_id = t2.manager_id;

-- Получить список сотрудников(firstname, lastname) с указанием их департамента(department_name), отсортированный по департаменту

select t1.department_name, t2.first_name, t2.last_name
from departments t1
inner join employees t2
on t1.department_id = t2.department_id
order by t1.department_name;

         -- // Получить список сотрудников(firstname, lastname)  и их менеджеров(firstname, lastname)// 
         
select t1.first_name as manager_firstname, t1.last_name as manager_lastname, t2.first_name as employee_firstname, t2.last_name as employee_lastname
from employees t1, employees t2
where t1.employee_id = t2.manager_id;
         
       -- Получить список стран (department_name ?) , где местоположение находится в США.

select t1.department_name, t3.country_name
from departments t1
inner join locations t2
on t1.location_id = t2.location_id
inner join countries t3
on t2.country_id = t3.country_id
where country_name = 'United States of America';



    
