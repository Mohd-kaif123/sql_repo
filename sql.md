# MySQL / SQL Complete Basic Flow (A to Z)

1. Saare Databases Dekhna
SHOW DATABASES;

2. Naya Database Banana
CREATE DATABASE practise;

3. Database Use Karna
USE practise;

4. Saari Tables Dekhna
SHOW TABLES;

5. Table Banana
CREATE TABLE student (
    id INT UNSIGNED,
    name VARCHAR(20),
    email VARCHAR(30),
    password VARCHAR(20),
    contact VARCHAR(10),
    address TEXT,
    DOB DATE,
    gender ENUM('M','F','O'),
    status TINYINT(1)
);

6. Table Structure Dekhna
DESC student;

7. Table Me Data Insert Karna
INSERT INTO student 
VALUES (
1,
'Kaif',
'kaif@gmail.com',
'pass123',
'9584612287',
'Bhiwandi',
'2003-03-01',
'M',
1
);

8. Multiple Rows Insert Karna
INSERT INTO student VALUES
(2,'Ali','ali@gmail.com','pass111','9999999999','Mumbai','2002-02-10','M',1),

(3,'Sara','sara@gmail.com','pass222','8888888888','Delhi','2001-01-15','F',1);

9. Saara Data Dekhna
SELECT * FROM student;

10. Specific Columns Dekhna
SELECT name, email FROM student;

11. WHERE Condition Lagana
SELECT * FROM student
WHERE gender = 'M';

12. ID Ke According Search
SELECT * FROM student
WHERE id = 1;

13. Data Update Karna
UPDATE student
SET name = 'Kaif Mansoori'
WHERE id = 1;

14. Ek Column Add Karna
ALTER TABLE student
ADD city VARCHAR(20);

15. Column Rename Karna
ALTER TABLE student
RENAME COLUMN contact TO phone;

16. Column Type Change Karna
ALTER TABLE student
MODIFY phone VARCHAR(15);

17. Column Delete Karna
ALTER TABLE student
DROP COLUMN city;

18. Ek Row Delete Karna
DELETE FROM student
WHERE id = 2;

19. Table Ka Pura Data Delete Karna
TRUNCATE TABLE student;

⚠️ Structure rahega, data delete hoga.

20. Table Rename Karna
RENAME TABLE student TO students;

21. Table Delete Karna
DROP TABLE students;

⚠️ Table permanently delete ho jayegi.

22. Database Delete Karna
DROP DATABASE practise;

⚠️ Dangerous command.

23. Data Sorting (Ascending)
SELECT * FROM student
ORDER BY name ASC;

24. Data Sorting (Descending)
SELECT * FROM student
ORDER BY id DESC;

25. Limited Data Dekhna
SELECT * FROM student
LIMIT 2;

26. LIKE Operator
SELECT * FROM student
WHERE name LIKE 'K%';

27. COUNT Karna
SELECT COUNT(*) FROM student;

28. Distinct Values Dekhna
SELECT DISTINCT gender FROM student;

29. Table Create With Primary Key
CREATE TABLE employee (
    id INT PRIMARY KEY,
    name VARCHAR(20)
);

30. AUTO_INCREMENT Use Karna
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20)
);

31. NULL Values Check Karna
SELECT * FROM student
WHERE email IS NULL;

32. AND Condition
SELECT * FROM student
WHERE gender = 'M'
AND status = 1;

33. OR Condition
SELECT * FROM student
WHERE gender = 'F'
OR city = 'Mumbai';

34. IN Operator
SELECT * FROM student
WHERE city IN ('Mumbai','Delhi');

35. Between Operator
SELECT * FROM student
WHERE id BETWEEN 1 AND 5;

36. Table Copy Karna
CREATE TABLE backup_student
AS SELECT * FROM student;

37. Current Database Dekhna
SELECT DATABASE();

38. Current User Dekhna
SELECT USER();

39. MySQL Version Dekhna
SELECT VERSION();

40. Exit MySQL
EXIT;

# Most Important Commands For Interviews
Command	            Purpose
CREATE DATABASE	    Database banana
USE	                Database select
CREATE TABLE	    Table banana
INSERT	            Data add
SELECT	            Data dekhna
UPDATE	            Data change
DELETE	            Row delete
ALTER	            Structure change
TRUNCATE	        Data clear
DROP	            Delete permanently
WHERE	            Filter
ORDER BY	        Sorting 
LIMIT	            Limited rows
LIKE	            Search

# Real Industry Skills
Ye commands use hoti hain:
- Backend Development
- DevOps
- Production Support
- Integration Support
- Automation
- Web Applications
- Server Monitoring

# Golden Rule
SQL me:
- ; lagana mat bhoolna
- DATE format → YYYY-MM-DD
- Table create me ()
- Text hamesha ' ' me