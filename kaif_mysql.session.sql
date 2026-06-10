USE practise;
CREATE TABLE students ( 
    id INT primary key auto_increment,
    name varchar(30),
    age INT
);

INSERT INTO students VALUES (1,'kaif',23);
ALTER TABLE students
add address varchar(100),
add fees int,
add phone_number varchar(15);
SELECT * from students;

UPDATE students
SET address = 'mumbai', fees = 20000, phone_number = '+91706668215'
where id = 1;