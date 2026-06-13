INNER JOIN = sirf match wale rows

LEFT JOIN = left table ke sare rows + right table se match mila toh data, nahi mila toh NULL

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

Q1. orders LEFT JOIN customers karo — saare orders dikhao, chahe customer record ho ya na ho.

SELECT o.customer_id, o.amount, c.customer_name, c.city
from orders o
left join customers c on c.customer_id = o.customer_id;

Q2. Saare customers dikhao — chahe unhone order diya ho ya nahi. 
Jo customers ne order nahi diya unke liye order_id aur amount NULL aayega.
(Hint: Pichli query se sirf FROM aur LEFT JOIN ki tables swap karo)

SELECT o.customer_id, c.customer_name, o.amount
from orders o
LEFT JOIN customers c ON c.customer_id = o.customer_id;

Q3. Sirf woh customers nikalo jinke paas koi order nahi hai — yaani NULL wale.
(Hint: Q2 ki query ke baad WHERE o.order_id IS NULL lagao)

SELECT c.customer_id, c.customer_name, o.order_id, o.amount
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

Q4. Saare products dikhao — chahe woh kisi order mein hon ya na hon. 
Jo products kisi order mein nahi hain unke liye order_id NULL aayega.
(Hint: products LEFT JOIN order_items)

SELECT p.product_id, p.product_name, o.order_id, o.qty
from products p
LEFT JOIN order_items o ON o.product_id = p.product_id;

Q5. Sirf woh products nikalo jo abhi tak kisi bhi order mein nahi hain.
(Hint: Q4 ke baad WHERE mein NULL check karo)

SELECT p.product_id, p.product_name, o.order_id, o.qty
from products p
LEFT JOIN order_items o ON o.product_id = p.product_id
where o.order_id is NULL;


Q6. Teen tables — customers, orders, order_items — LEFT JOIN karo.
Dikhao: customer_name, order_id, product_id
Woh customers bhi aane chahiye jinke koi orders nahi hain — unke liye order_id aur product_id NULL hoga.
(Hint: pehle customers LEFT JOIN orders, phir us result pe LEFT JOIN order_items)




