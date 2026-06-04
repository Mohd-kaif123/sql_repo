1) shell open karne ke baad agar waha 'JS' hai tu:-
    ==> go sql mode ==> \sql ==> then connect database ==> \connect root@localhost

2) Databases dekhne ke liye :- SHOW DATABASES;

3) Jo data base ko use karna hai/ aur wo database ke andar jane ke liye :-
    USE name_of_database;

4) Kisi database ke andar kitna tables hai wo dekhne ke liye:-
    show tables;

5) Table me new Coloumn add karne ke liye :-
    ALTER TABLE table_name
    ADD coloumn_name datatype;
    
6) Agar already table hai aur usme ham New coloumn add kare hai, tab usme value add karenge aese:-
    UPDATE table_name
    SET column_name = value(jo hame dena hai)
    Where id = 1(jo id pe dena hai);

7) Column ka Data Type Change Karna:-
Pehle:-
emp_id INT

Ab maan lo VARCHAR karna hai:-
ALTER TABLE employee
MODIFY emp_id VARCHAR(20);

8) UNIQUE, Primary key, NOT Null, Default Add Karna:-
# Unique:-
- Pehle column normal tha:
    email VARCHAR(100)

- Ab email duplicate nahi hona chahiye:
    ALTER TABLE employee
    ADD UNIQUE (email);

- Ya constraint name ke saath:
    ALTER TABLE employee
    ADD CONSTRAINT uk_email UNIQUE (email);

# PRIMARY KRY:-
- Agar pehle primary key nahi thi:
    ALTER TABLE employee
    ADD PRIMARY KEY (emp_id);

# NOT NULL :-
- Pehle NULL allow tha:
    ALTER TABLE employee
    MODIFY name VARCHAR(50) NOT NULL;

Ab name blank nahi reh sakta.

# DEFAULT :-
ALTER TABLE employee
MODIFY salary INT DEFAULT 10000;

Agar salary nahi doge to automatically 10000 aa jayegi.

