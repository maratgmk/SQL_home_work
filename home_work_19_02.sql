use gt171023;
select * from employees;
-- Повысить зарплаты для отдела sales на 20%, для finance 15%, для shipping 10%, для marketing 25%, для HR 20% и для IT 35%. Записать данные в новое поле new_salary. Поле создавать не нужно, используем AS.
select 
case
when department = 'sales' then salary + salary*0.2
when department = 'finance' then salary + salary*0.15
when department = 'shipping' then salary + salary*0.15
when department = 'marketing' then salary + salary*0.15
when department = 'HR' then salary + salary*0.15
when department = 'IT' then salary + salary*0.15
else salary
end as new_price
from employees;
-- Создать поле new_salary типа numeric(7, 2)
-- Заполнить поле: повысить зарплаты для отдела sales на 20%, для finance 15%, для shipping 10%, для marketing 25%, для HR 20% и для IT 35%.
alter table employees
add new_salary numeric(7,2);
set sql_safe_updates = 0;

update employees
set new_salary = 
case 
when department = 'sales' then salary + salary*0.2
when department = 'finance' then salary + salary*0.15
when department = 'shipping' then salary + salary*0.15
when department = 'marketing' then salary + salary*0.15
when department = 'HR' then salary + salary*0.15
when department = 'IT' then salary + salary*0.15
else salary
end;

-- Вывести из таблицы employees firstname как username, lastname как surname и новое поле fullname, которое состоит из имен и фамилий сотрудников.
select first_name as username, last_name as surname, 
concat_ws(' ', first_name,last_name) as fullname
from employees;

-- Вывести новое поле commission, которое будет null, если зарплата сотрудника меньше 3000, будет 10, если зарплата меньше 6000, будет 15, если зарплата меньше 9000, и будет 20, если зарплата больше/равно 9000.
select case
        when salary < 3000 then null
        when salary < 6000 then 10
        when salary < 9000 then 15
        when salary >= 9000 then 20
	end as commission
    from employees;
    
-- Создать новое поле commission и соответственно заполнить.    
alter table employees
add commission int;

update employees
set commission = 
case when salary < 3000 then null
        when salary < 6000 then 10
        when salary < 9000 then 15
        when salary >= 9000 then 20
	end ;
    
-- Cоздать поле finalsalary и заполнить формулой salary + salary * commission 

alter table employees
add finalsalary numeric(7,2);

update employees
set finalsalary =
	case 
       when commission is not null then salary  + salary*commission/100
       when commission is null then salary
     end;  
     
-- Проверить commission на null, так чтобы в случае неопределенности finalprice принимал значение salary.
-- is done

-- Вывести поле email в нижнем регистре.
select lower(email)
from employees;

-- Создать новое поле chk_email типа varchar(128).
alter table employees
add chk_email varchar(128);

-- Заполнить поле chkemail. Если длина email меньше 3, значением chkemail будет 'Введите больше символов',
-- если длина email больше/равно 3 и меньше 7,  значением chkemail будет 'Кол/во символов совпадает',
-- если длина email больше/равно 7,  значением chkemail будет 'Введите меньше символов'.

update employees
set chk_email = 
	case
		when length(email) < 3 then 'Input more symbols'
        when length(email) >= 3 and length(email) < 7 then 'Quantity of symbols is matched'
        else 'Input less symbols'
     end;   

select * from employees;
