CREATE DATABASE college;
USE college;

CREATE TABLE student (
rollno INT PRIMARY KEY,
name VARCHAR(50),
marks INT NOT NULL,
grade VARCHAR(1),
city VARCHAR(20)
);

INSERT INTO student 
(rollno,name,marks,grade,city)
VALUES 
(101,"ANIL",78,"C","PUNE"),
(102,"BHUMIKA",93,"A","MUMBAI"),
(103,"CHETAN",85,"B","MUMBAI"),
(104,"DHRUV",96,"A","DELHI"),
(105,"EMANUEL",12,"F","DELHI"), 
(106,"FARAH",82,"B","DELHI"); 

SELECT DISTINCT city FROM student;

SELECT *
FROM student
WHERE marks > 80;

SELECT *
FROM student
WHERE city = "MUMBAI";

SELECT *
FROM student
WHERE marks > 80 AND city = "MUMBAI";

SELECT *
FROM student
WHERE marks+10 > 100 ;

SELECT *
FROM student
WHERE marks > 80 OR city = "MUMBAI";

SELECT *
FROM student
WHERE marks BETWEEN 80 AND 90 ;

SELECT *
FROM student
WHERE city IN ("DELHI","MUMBAI");

SELECT *
FROM student
WHERE city NOT IN ("DELHI","MUMBAI");

SELECT *
FROM student
ORDER BY city ASC ;

SELECT *
FROM student
ORDER BY marks ASC ;

# top 3 students of class
SELECT *
FROM student
ORDER BY marks DESC
LIMIT 3 ;

# finding maximum marks in class
SELECT MAX(marks)
FROM student;

# finding average marks of class
SELECT AVG(marks)
FROM student;

# no of students in class
SELECT COUNT(rollno)
FROM student;

# Count number of students in each city (Hint: use GROUP BY clause)
SELECT city,count(rollno)
FROM student
GROUP BY city;

# Grouped them on the basis of cities as well as names
SELECT city,name,count(rollno)
FROM student
GROUP BY city,name;

# Find average marks from each city
SELECT city,AVG(marks)
FROM student
GROUP BY city;

# Find average marks of each city in ascending order
SELECT city,AVG(marks)
FROM student
GROUP By city
ORDER BY AVG(marks) ASC;

# No of students in each grade
SELECT grade,COUNT(rollno)
FROM student
GROUP BY grade
ORDER BY grade;

# Count no of students in each city where max marks cross 90
SELECT count(name),city
FROM student
GROUP BY city
HAVING MAX(marks) > 90 ;

/*
General Order
SELECT column(s)
FROM table_name
WHERE condition
GROUP BY column(s)
HAVING condition
ORDER BY column(s) ASC;
*/

SELECT city
FROM student
WHERE grade = "A"
GROUP BY city
HAVING MAX(marks) >= 93
ORDER BY city DESC;

# This is used to turn off the safe mode of mysql so that we can perform updations otherwise you cannot do any updations
SET SQL_SAFE_UPDATES = 0 ;

UPDATE student
SET grade = "0"
WHERE grade = "A";

UPDATE student
SET marks = 12
WHERE rollno = 105;

UPDATE student
SET grade = "B"
WHERE marks BETWEEN 80 AND 90;

SELECT * FROM student;


UPDATE student
SET marks = marks + 1 ;

SELECT * FROM student;

DELETE FROM student
WHERE marks < 33 ;

SELECT * FROM student ;


# Making alterations in table schema
# Adding columns
ALTER TABLE student
ADD COLUMN age INT ;

# Removing columns
ALTER TABLE student
DROP COLUMN age ;

SELECT * FROM student ;

# Delete entire table data
TRUNCATE TABLE student ;

# Delete the table itself
DROP TABLE student;

# Change name of column "name" to "full_name"
ALTER TABLE student
CHANGE name full_name VARCHAR(50) ;

# Delete all students who scored marks less than 80
SET SQL_SAFE_UPDATES = 0 ;
DELETE FROM student
WHERE marks <= 85 ;

# Delete the column for grades
ALTER TABLE student
DROP COLUMN grade ;

SELECT * FROM student ;

ALTER TABLE student
ADD COLUMN grade VARCHAR(1) ;

INSERT INTO student 
(rollno,full_name,marks,grade,city)
VALUES 
(101,"ANIL",78,"C","PUNE"),
(102,"BHUMIKA",93,"A","MUMBAI"),
(103,"CHETAN",85,"B","MUMBAI"),
(104,"DHRUV",96,"A","DELHI"),
(105,"EMANUEL",12,"F","DELHI"), 
(106,"FARAH",82,"B","DELHI"); 

CREATE TABLE dept (
id INT PRIMARY KEY,
name VARCHAR(50)
);

INSERT INTO dept
VALUES
(101,"english"),
(102,"IT");

SELECT * FROM dept ;

UPDATE dept
SET id = 103
WHERE id = 102 ;

SELECT * FROM dept ;

DROP TABLE teacher ;


CREATE TABLE teacher (
id INT PRIMARY KEY,
name VARCHAR(50),
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES dept(id)
ON DELETE CASCADE
ON UPDATE CASCADE
);



INSERT INTO teacher
VALUES
(101,"ADAM",101),
(102,"EVE",102);

SELECT * FROM teacher ;




# SQL subqueries
SELECT * FROM student ;

SELECT full_name,marks
FROM student
WHERE marks > (SELECT AVG(marks) FROM student) ;

# Find names of students with even roll no
SELECT full_name,rollno
FROM student
WHERE rollno IN (SELECT rollno FROM student WHERE rollno % 2 = 0);

# Find max marks of students from Delhi
# Not recommended way
SELECT MAX(marks)
FROM student
WHERE city IN (SELECT city FROM student WHERE city="DELHI") ;

# Recommended two ways
# Way 1: Using subquery
SELECT MAX(marks)
FROM (SELECT * FROM student WHERE city = "DELHI") AS temp ; # Here alias is mandatory

# Way 2: Without using subquery
SELECT MAX(marks)
FROM student
WHERE city = "Delhi";

# Using subquery in SELECT statement (Not useful in this case, just for knowledge)
SELECT (SELECT MAX(marks) FROM student),full_name
FROM student;

# Creating views of our table
CREATE VIEW view1 AS
SELECT rollno,full_name FROM student ;

SELECT * FROM view1;

#To drop view
DROP VIEW view1 ;
# Hence if we make changes in our view it doesnot affect the data in our main table