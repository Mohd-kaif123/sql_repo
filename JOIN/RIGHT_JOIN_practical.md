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


# Level 1 — Beginner (sirf RIGHT JOIN, do tables)

Q1. Saare customers dikhao — chahe unhone order diya ho ya nahi. Columns: customer_name, city, order_id, amount.

SELECT c.customer_name, c.city, o.order_id, o.amount
FROM customers c
RIGHT JOIN orders o ON o.customer_id = c.customer_id;

Q2. Saare products dikhao — chahe wo kisi order mein ho ya na ho. order_items LEFT mein rakho, products RIGHT mein. Columns: product_name, price, order_id.

SELECT p.product_id, p.product_name, p.price, o.order_id
FROM products p
RIGHT JOIN order_items o ON o.product_id = p.product_id;

Q3. Sirf woh customers dikhao jinke paas koi bhi order nahi hai. (Hint: RIGHT JOIN ke baad WHERE o.order_id IS NULL)

SELECT c.customer_id, c.customer_name, o.order_id
FROM orders o   
RIGHT JOIN customers c ON c.customer_id=o.customer_id
where o.order_id is NULL;

# Level 2 — Intermediate (condition + filtering)
Q4. Saare customers dikhao with their orders — lekin result mein sirf Mumbai aur Delhi ke customers ho. Jo in cities ke customers ne order nahi diya unke liye NULL aaye.

SELECT c.customer_id, c.customer_name, c.city, o.order_id
FROM orders o 
RIGHT JOIN customers c ON c.customer_id=o.customer_id
WHERE c.city IN ('Mumbai','Chennai')
AND o.order_id is NULL;

Q5. Saare products dikhao order_items se RIGHT JOIN karke — lekin sirf Electronics category ke products dikhao. Kaunse electronics kisi order mein nahi hain wo bhi dikhna chahiye.

SELECT p.product_id, p.product_name, p.category, o.order_id
FROM order_items o
RIGHT JOIN products p ON p.product_id=o.product_id
WHERE p.category = 'Electronics';

Q6. order_items aur products ka RIGHT JOIN karo — sirf woh products dikhao jinka price ₹5000 se zyada hai, chahe order hua ho ya na ho.

SELECT p.product_id, p.product_name, p.category,p.price, o.order_id
FROM order_items o
RIGHT JOIN products p ON p.product_id = o.product_id
where p.price > 5000;

# Level 3 — Advanced (teen tables + conditions)
Q7. Teen tables join karo — orders, order_items, products — products ko RIGHT mein rakho. Saare products dikhao with order_id, qty. Jo products kisi order mein nahi hain unke liye NULL aaye.

SELECT p.product_id, p.product_name, oi.order_id, o.amount
FROM orders o
RIGHT JOIN order_items oi ON oi.order_id = o.order_id
RIGHT JOIN products p ON p.product_id = oi.product_id;

Q8. Chaar tables join karo — orders, customers, order_items, products. Saare customers dikhao with unka product_name aur qty. Jo customers ne order nahi diya unke liye NULL aaye. (Hint: customers ko sabse last mein RIGHT JOIN karo)

SELECT c.customer_id, c.customer_name, p.product_name, oi.qty
FROM orders o 
RIGHT JOIN order_items oi ON oi.order_id = o.order_id
RIGHT JOIN products p ON p.product_id = oi.product_id
RIGHT JOIN customers c ON c.customer_id = o.customer_id;

Q9. Q3 ka extension — sirf woh customers dikhao jinke paas koi order nahi hai, aur unki city bhi dikhao. Result ko city ke alphabetical order mein sort karo. (Hint: ORDER BY use karo — ORDER BY c.city)


