use gt171023;
drop table employees;
create table employees(
employeeid int primary key auto_increment,
fname varchar(45) not null,
lastname varchar(46) not null,
email varchar(52) not null,
phone varchar(21) not null
);
select * from employees;

alter table employees
add salary numeric(9,2);

alter table employees
change fname first_name varchar(45);
-- alter table employee
-- rename column fname to first_name;

alter table employees
drop column phone;

alter table employees
add department varchar(36) not null;

alter table employees
rename column lastname to last_name;



insert into employees(first_name, last_name, email, salary, department)
values ('Tom', 'Green', 'Tom123@bin.com', 1234567.36, 'energy'),
		('Sam', 'Red', 'Sam657@gmail.com', 7654321.63, 'agro'),
        ('Cat', 'Pink', 'Cat784@yahoo.com', 2143657.83, 'art'),
        ('Pat', 'Black', 'pat736@mail.com', 9876543.71, 'auto'),
        ('Lam', 'White', 'lam735@ldjd.io', 6527831.56, 'plastic'),
        ('Rob', 'Yellow', 'rob1234@org.io', 1234678.98, 'steel'),
        ('Tan', 'Blue', 'tan@org.com', 2143657.92, 'food');
        
        select * from employees;






