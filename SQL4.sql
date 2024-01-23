# Learning SQL JOINS

CREATE DATABASE colleges;
USE colleges;

CREATE TABLE student (
id INT PRIMARY KEY,
name VARCHAR(50)
);

INSERT INTO student (id,name)
VALUES
(101,"adam"),
(102,"bob"),
(103,"casey");

CREATE TABLE course (
id INT PRIMARY KEY,
course VARCHAR(50)
);

INSERT INTO course (id,course)
VALUES
(102,"english"),
(105,"math"),
(103,"science"),
(107,"computer science");

SELECT * FROM student;
SELECT * FROM course;

# inner join
SELECT * 
FROM student
INNER JOIN course
WHERE student.id=course.id;

# left join
SELECT *
FROM student as s
LEFT JOIN course as c
ON s.id=c.id;

# right join
SELECT *
FROM student as s
RIGHT JOIN course as c
ON s.id=c.id;

# full join
SELECT *
FROM student as s
LEFT JOIN course as c
ON s.id=c.id
UNION
SELECT *
FROM student as s
RIGHT JOIN course as c
ON s.id=c.id;



# left exclusive join
SELECT *
FROM student as s
LEFT JOIN course as c
ON s.id=c.id
WHERE c.id IS NULL;


# right exclusive join
SELECT *
FROM student as s
RIGHT JOIN course as c
ON s.id=c.id
WHERE s.id IS NULL;


# full exclusive join
SELECT *
FROM student as s
LEFT JOIN course as c
ON s.id=c.id
WHERE c.id IS NULL
UNION
SELECT *
FROM student as s
RIGHT JOIN course as c
ON s.id=c.id
WHERE s.id IS NULL;


CREATE TABLE employee (
id INT PRIMARY KEY,
name VARCHAR(50),
manager_id INT
);

INSERT INTO employee (id,name,manager_id)
VALUES
(101,"adam",103),
(102,"bob",104),
(103,"casey",NULL),
(104,"donald",103);

# self join
SELECT a.name as manager_name,b.name
FROM employee as a
JOIN employee as b
ON a.id=b.manager_id;


# UNION --> removes duplicates
SELECT name FROM employee
UNION
SELECT name FROM employee;

# UNION ALL --> allows duplicates
SELECT name FROM employee
UNION ALL
SELECT name FROM employee;

SELECT * FROM student;

