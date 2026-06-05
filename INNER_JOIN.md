# tables:-
> show tables;
+--------------------+
| Tables_in_practise |
+--------------------+
| marks              |
| students           |
| subject            |
+--------------------+

# students table
> select * from students;
+----+----------+-----+----------+------------+---------+
| id | name     | age | Address  | Contact    | stream  |
+----+----------+-----+----------+------------+---------+
|  1 | kaif     |  23 | Bhiwandi | 956854635  | BSc IT  |
|  2 | wais     |  22 | Bhiwandi | 7249624101 | D-pharm |
|  3 | sahil    |  22 | Bhiwandi | 65689654   | BA      |
|  4 | Rohit    |  21 | Mumbai   | 854796587  | BSc Cs  |
|  5 | subham   |  23 | Mumbai   | 854658795  | Bsc Cs  |
|  6 | Hassan   |  21 | Thane    | 874652947  | BCA     |
|  7 | Faraz    |  22 | Thane    | 687458945  | BCA     |
|  8 | lal babu |  24 | padgah   | 917621762  | packer  |
+----+----------+-----+----------+------------+---------+


# MySQL  localhost:33060+ ssl  practise  SQL > select * from marks;
+---------+------------+------------+----------------+
| mark_id | student_id | subject_id | obtained_marks |
+---------+------------+------------+----------------+
|       6 |          1 |          1 |             56 |
|       7 |          2 |          3 |             65 |
|       8 |          3 |          4 |             34 |
|       9 |          4 |          5 |             65 |
|      10 |          5 |          3 |             76 |
|      11 |          6 |          5 |             84 |
|      12 |          7 |          5 |             65 |
+---------+------------+------------+----------------+


# MySQL  localhost:33060+ ssl  practise  SQL > select * from subject;
+------------+--------------+-------------+
| subject_ID | subject_name | Total_marks |
+------------+--------------+-------------+
|          1 | Mathematics  |         100 |
|          2 | Science      |         100 |
|          3 | English      |         100 |
|          4 | Computer     |         100 |
|          5 | History      |         100 |
+------------+--------------+-------------+

# command INNER JOIN:-
SELECT 
    students.name, 
    subject.subject_name, 
    marks.obtained_marks 
FROM marks 
INNER JOIN students ON marks.student_id = students.id 
INNER JOIN subject ON marks.subject_id = subject.subject_id;

# Output:-
+--------+--------------+----------------+
| name   | subject_name | obtained_marks |
+--------+--------------+----------------+
| kaif   | Mathematics  |             56 |
| wais   | English      |             65 |
| sahil  | Computer     |             34 |
| Rohit  | History      |             65 |
| subham | English      |             76 |
| Hassan | History      |             84 |
| Faraz  | History      |             65 |
+--------+--------------+----------------+