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

7) 