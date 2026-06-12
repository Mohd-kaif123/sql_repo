--####----Practise INNER Join----####
orders table:                              customers table:
order_id | customer_id | amount  |     | customer_id    | customer_name | city
---------|-------------|---------|     |----------------|---------------|------
1001     | C01         | ₹2,400  |     |C01             | Priya         | Mumbai
1002     | C02         | ₹850    |     |C02             | Rahul         | Delhi
1003     | C03         | 5,200   |     |C03             | kaif          | Pune
1004     | C99         | ₹1,100  |     |C04             | Vikram Nair   | Chennai

select o.order_id, c.customer_name, p.product_name, oi.qty
from orders o

INNER JOIN order_items oi on oi.order_id = o.order_id
INNER JOIN products p on p.product_id = oi.product_id
INNER JOIN customers c on c.customer_id = o.customer_id
where 
where price > 10000;


Q1. Saare orders dikhao jahan customer ka naam bhi saath mein ho.
(Expected: 3 rows — C99 wala nahi aayega)

select o.order_id, o.customer_id, c.customer_name
from orders o
INNER Join customers c on o.customer_id = c.customer_id;

Q2. Sirf Mumbai aur Pune ke customers ke orders dikhao.
(Hint: JOIN ke baad WHERE c.city IN ('Mumbai','Pune') lagao)

select o.order_id, o.customer_id, c.customer_name
from orders o
INNER JOIN customers c on o.customer_id = c.customer_id
where c.city IN ('Mumbai','Pune');


Q3. Sirf woh orders dikhao jahan amount 1000 se zyada ho aur customer ka naam bhi dikhao.

select o.customer_id, o.amount, c.customer_name
from orders o
INNER JOIN customers c on o.customer_id = c.customer_id
where o.amount > 1000;

SELECT * from orders

Q4. Teen tables ek saath join karo — orders, order_items, aur products.
Result mein ye dikhao: order_id, customer_id, product_name, qty
(Pehle orders + order_items join karo, phir uspe products join karo — ek ke baad ek)


