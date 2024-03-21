use homework;
-- уровень сложности: Таблица - customers
-- Вывести максимальный и минимальный credit_limit.
-- Вывести покупателей у которых creditlimit выше среднего creditlimit.
-- Найти кол/во покупателей имя которых начинается на букву 'D' и credit_limit больше 500.

select max(credit_limit), min(credit_limit)
from customers;

select cust_first_name, CUST_LAST_NAME
from customers
where CREDIT_LIMIT > ( select avg(CREDIT_LIMIT) from customers);

select count(GENDER)
from customers
where CUST_FIRST_NAME like 'D%' and CREDIT_LIMIT >500;

-- Таблица - order_items
-- Найти среднее значение unit_price

select avg(UNIT_PRICE) 
from order_items;

-- Таблицы - orderitems, productinformation
-- Вывести имена продуктов(PRODUCT_NAME), кол/во(QUANTITY) которых меньше среднего.

  select t1.PRODUCT_NAME
  from product_information t1
  join order_items t2
  on t1.PRODUCT_ID = t2.PRODUCT_ID
  where t2.QUANTITY < (select avg(QUANTITY) from order_items);
  

-- Таблицы - orders, customers
-- Вывести имя и фамилию покупателя с максимальной общей суммой покупки(ORDER_TOTAL).
-- Найти сумму общей суммы покупок(ORDER_TOTAL) всех женатых мужчин покупателей.

select t1.CUST_FIRST_NAME, t1.CUST_LAST_NAME
from customers t1
join orders t2
on t1.CUSTOMER_ID = t2.CUSTOMER_ID
where ORDER_TOTAL = (select max(ORDER_TOTAL) from orders);

