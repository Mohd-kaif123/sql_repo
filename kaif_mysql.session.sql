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

