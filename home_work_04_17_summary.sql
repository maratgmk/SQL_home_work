--  1 уровень сложности: Из базы данных shop:
-- https://github.com/NelliEfr/MySQL_databases/blob/main/shop.txt
use shop;
-- Найти общую сумму заказов для каждого клиента.

select sum(t1.amt) as total_sum, t2.cname
from orders t1
join customers t2
on t1.cust_id = t2.cust_id
group by cname;

-- Получить количество заказов для каждого продавца.

select count(order_id), sname
from orders t1
join sellers t2
on t1.sell_id = t2.sell_id
group by sname;

-- Получить количество клиентов с рейтингом выше среднего

select count(cust_id) as count_cust, t1.rating
from customers t1
group by t1.rating
having t1.rating > (select avg(rating)
from customers t2);

select sum(count_cust) as sum_cust_high_avg
from (select count(cust_id) as count_cust, t1.rating
from customers t1
group by t1.rating
having t1.rating > (select avg(rating)
from customers t2)) t3;

-- Получить количество клиентов в каждом городе с рейтингом выше 200.

select  city, count(cust_id) as count_cust 
from customers
where rating > 200
group by city;

-- Получить количество заказов, сделанных в каждый месяц.

select count(order_id) as count_order, monthname(odate) as month
from orders
group by monthname(odate);

-- Найти клиентов, у которых сумма заказов превышает среднюю сумму заказов всех клиентов.
 select avg(amt) from orders t;
 
 select t2.cname, sum(t1.amt) as sum_amt
 from orders t1
 inner join customers t2
 on t1.cust_id = t2.cust_id
 group by t2.cname
 having sum_amt > (select avg(t1.amt) from orders t1);




