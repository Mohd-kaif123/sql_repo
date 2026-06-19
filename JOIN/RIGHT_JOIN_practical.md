RIGHT JOIN — Concept
Simple rule: Right table ke sare rows aate hain — chahe left table mein match ho ya na ho.
Left mein match nahi mila toh NULL aata hai.

Hamare tables se example:-
orders (LEFT)          customers (RIGHT)
-------------          -----------------
1001 → C01             C01 → Priya Sharma
1002 → C02             C02 → Rahul Mehta
1003 → C03             C03 → Anjali Singh
1004 → C99             C04 → Vikram Nair ← koi order nahi!

Query:
SELECT o.order_id, o.amount, c.customer_name
FROM orders o
RIGHT JOIN customers c ON o.customer_id = c.customer_id;

Result:
order_id | amount | customer_name
---------|--------|---------------
1001     | 2400   | Priya Sharma
1002     | 850    | Rahul Mehta
1003     | 5200   | Anjali Singh
NULL     | NULL   | Vikram Nair   ← match nahi mila, NULL aaya

INNER vs RIGHT — fark ek nazar mein:
INNER JOIN result:          RIGHT JOIN result:
Priya  ✅                   Priya  ✅
Rahul  ✅                   Rahul  ✅
Anjali ✅                   Anjali ✅
                            Vikram ← NULL NULL (extra row!)

# Real job mein kab use hota hai:-
"Kaunse customers ne abhi tak koi order nahi diya?"
Sales team ko ye list chahiye hoti hai — inactive customers target karne ke liye.

SELECT c.customer_name, c.city, o.order_id
FROM orders o
RIGHT JOIN customers c ON o.customer_id = c.customer_id
WHERE o.order_id IS NULL;

-- Result: sirf Vikram Nair — usne koi order nahi diya

###############################################################################################
# PRACTICALS:-

orders table:                              customers table:
order_id | customer_id | amount  |     | customer_id    | customer_name | city
---------|-------------|---------|     |----------------|---------------|------
1001     | C01         | ₹2,400  |     |C01             | Priya Sharma  | Mumbai
1002     | C02         | ₹850    |     |C02             | Rahul Mehta   | Delhi
1003     | C03         | 5,200   |     |C03             | Anjali Singh  | Pune
1004     | C99         | ₹1,100  |     |C04             | Vikram Nair   | Chennai


products table:                                         order_items table:
product_id | product_name | price | category   |    | order_id | product_id | qty
-----------|--------------|------ |------------|    | ---------|------------|----
P01        | Laptop       | 45000 | Electronics|    | 1001     | P02        | 2
P02        | Phone        | 12000 | Electronics|    | 1001     | P03        | 1
P03        | Headphones   | 2400  | Electronics|    | 1002     | P01        | 1
P04        | Charger      | 800   | Accessories|    | 1003     | P02        | 3


Q1. Saare customers dikhao — chahe unhone order diya ho ya nahi. Columns: customer_name, city, order_id, amount.


