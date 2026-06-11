--####----Practise INNER Join----####
orders table:                       customers table:
order_id | customer_id |        | amount  | customer_id    | customer_name | city
---------|-------------|        |---------|----------------|---------------|------
1001     | C01         |        | ₹2,400  |    C01         | Priya Sharma  | Mumbai
1002     | C02         |        | ₹850    |    C02         | Rahul Mehta   | Delhi
1003     | C03         |        | 5,200   |    C03         | Anjali Singh  | Pune
1004     | C99         |        | ₹1,100  |    C04         | Vikram Nair   | Chennai

--step 1: use database:-
USE practise;

--step 2: create table order :-

CREATE TABLE orders(
    order_id INT,
    amount INT,
    customer_name VARCHAR(30)
);

--step 3: value insert karo order table me:-

insert into orders values
    (1001,2400,'priya'),
    (1002,850,'Rahil'),
    (1003,5200,'kaif');

-- Dekhne ke liye bana ki nahi
SELECT * FROM orders;

--new coloumn aur value insert kara:-
ALTER table orders
add customer_id VARCHAR(15);

---cuatomer Id dal rha hu:-
UPDATE orders SET customer_id='C01' where order_id=1001;
UPDATE orders SET customer_id='C02' where order_id=1002;
UPDATE orders SET customer_id='C03' where order_id=1003;

-- maine order table me custome_name  coloumn bhi dal diya tha isliye delete kara
alter table orders
DROP column customer_name;

alter table orders
add amount VARCHAR(20);

UPDATE orders SET amount='$2,400' where order_id=1001;
UPDATE orders SET amount='$850' where order_id=1002;
UPDATE orders SET amount='$5200' where order_id=1003;

--- ab customer table banana hai:-
CREATE TABLE customers (
    customer_id VARCHAR(10),
    custome_name VARCHAR(20),
    city VARCHAR(15)
);
insert into customers VALUES 
('C01','priya','Delhi'),
('C02','Rahul','pune'),
('C03','kaif','Mumbai');

--- dekhne ke liye:-
SELECT * from customers;

--customer_name column name sahi karo:-
ALTER TABLE customers CHANGE custome_name customer_name VARCHAR(20);

---## ab Inner laga rahe hai:-

SELECT orders.order_id, orders.customer_id, customers.customer_name
FROM orders
INNER JOIN customers ON orders.customer_id = customers.customer_id;

---## Correct tarika hai Alias use karo:-

SELECT o.order_id, o.customer_id, c.customer_name
FROM customers c INNER JOIN orders o ON c.customer_id = o.customer_id;

---### cartesion product (JOIN condition bhool gaye ho tab):-
--- galat method hai ye:-
select*from orders, customers;

--- sahi tarika:-
select * FROM orders o
INNER JOIN customers c ON o.customer_id=c.customer_id;

---### Real-world combo query --NULL check ke sath:-
SELECT o.order_id, o.amount, c.customer_name
FROM orders o
LEFT JOIN customers c ON o.customer_id = c.customer_id
where c.customer_id IS NULL;

TABLES:-
products table:               order_items table:
product_id | product_name | price   order_id | product_id | qty
-----------|--------------|------   ---------|------------|----
P01        | Laptop       | 45000   1001     | P02        | 2
P02        | Phone        | 12000   1001     | P03        | 1
P03        | Headphones   | 2400    1002     | P01        | 1
P04        | Charger      | 800     1003     | P02        | 3


--- Create table products:-
create table products (
    product_id VARCHAR(20),
    product_name VARCHAR(30)
);

insert INTO products VALUES 
('P01','Laptop'),
('P02','Phone'),
('P03','Headphones'),
('P04','Charger');

ALTER table products
add price INT;

SELECT * FROM products;

--- Order item table create karo:-
CREATE TABLE order_items(
    order_id INT,
    product_id VARCHAR(20),
    qty INT
);

INSERT INTO order_items values
    (1001,'P01',2),
    (1001,'P03',1),
    (1002,'P01',1),
    (1003,'P02',3);

SELECT * FROM order_items

---Level 1 — Beginner (ek concept, seedha sawaal)

1. Har order ke saath customer ka naam aur city dikhao. 
    Sirf woh orders jahan customer record exist karta ho.
2. Saare customers dikhao — chahe unhone order diya ho ya nahi. 
    Jo customers ne order nahi diya unke liye order columns mein NULL aayega.
3. order_items aur products table join karke har order item ka product name aur price dikhao.


SELECT o.customer_id,c.customer_name,c.city
from orders o
INNER JOIN customers c ON c.customer_id = o.customer_id;

