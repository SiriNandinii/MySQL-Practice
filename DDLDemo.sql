CREATE DATABASE sonicdb;

USE sonicdb;

CREATE TABLE cars(id INT primary key AUTO_INCREMENT,
						name VARCHAR(255),
						price INTEGER);
						
INSERT INTO cars(NAME, price) 
VALUES
		('Audi', 52642),
		('Mercedes', 57127),
		('Skoda', 9000),
		('Volvo', 29000),
		('Bentley', 350000),
		('Citreon', 21000),
		('Hummer', 41400),
		('Volkswagen', 21600),
		('Tata', 150000);
		
SELECT * FROM cars;






CREATE DATABASE coforgedb;

USE coforgedb;

CREATE TABLE USER(
	id INT PRIMARY KEY AUTO_INCREMENT,
	NAME VARCHAR(25),
	email VARCHAR(25));
	

DESCRIBE USER;




CREATE TABLE department(
	deptid INT PRIMARY KEY AUTO_INCREMENT,
	deptname VARCHAR(25) NOT NULL,
	fees FLOAT NOT NULL,
	email varchar(25) NOT NULL);
	
DESCRIBE department;

SHOW TABLES;

CREATE TABLE student(
		rollno INT(10) PRIMARY KEY,
		firstname VARCHAR(25) NOT NULL,
		middlename VARCHAR(25),
		lastname VARCHAR(25) NOT NULL,
		dob date NOT NULL,
		did INT NOT NULL);
		
DESC student;

SHOW TABLES;




ALTER TABLE student ADD city VARCHAR(20) NOT NULL AFTER dob;

DESC student;




ALTER TABLE student CHANGE COLUMN middlename mid_name VARCHAR(20) NULL;

DESC student;




ALTER TABLE student DROP COLUMN mid_name;

DESC student;




ALTER TABLE department RENAME TO course;

SHOW TABLES;



CREATE TABLE student_copy AS SELECT * FROM student;

SHOW TABLES;



CREATE TABLE staff(
	id INT PRIMARY KEY AUTO_INCREMENT,
	NAME VARCHAR(25),
	email VARCHAR(25),
	city VARCHAR(20) DEFAULT 'Bangalore',
	doj DATETIME DEFAULT NOW() 
	);

SELECT * FROM staff;


INSERT INTO staff(NAME, email, city) VALUES ('Navin', 'navi@training.com', 'Mumbai');

INSERT INTO staff (NAME, email, city, doj)
VALUES ('Hary', 'harry@training.com', 'Noida', '2017-06-01');
	
select * from staff;


ALTER TABLE staff AUTO_INCREMENT=100;

INSERT INTO staff(NAME, email, city, doj) VALUES('Manoj', 'manu@training.com', 'Mumbai', '2015-12-15');

INSERT INTO staff(NAME, email, city, doj) VALUES('Mahesh', 'mahi@training.com', 'Chennai', CURRENT_DATE);

SELECT * FROM staff;





DESC staff;

ALTER TABLE staff ADD salary DOUBLE(10,2) CHECK (salary>10000) AFTER doj;

alter TABLE staff ADD gender CHAR(10) CHECK(gender IN ('Male', 'Female')) AFTER doj;

DESC staff;






DELETE FROM staff;

ALTER TABLE staff DROP COLUMN phone;
ALTER TABLE staff ADD phone INT NOT NULL UNIQUE AFTER salary;

DESC staff;



INSERT INTO staff VALUES (200, 'Raj', 'raj@test.com', 'Delhi', '2018-12-07' , 'Male', 15000, 999999);

INSERT INTO staff VALUES (202, 'Sangmesh', 'sanga@test.com', 'Vijaypur', '2018-12-04', 'Male', 19000, 888888);

INSERT INTO staff VALUES (203, 'Raj', 'raj@test.com', 'Delhi', '2018-12-07', 'Male', 15000, 8686869);

INSERT INTO staff VALUES (204, 'Monty', 'monty@test.com', 'Chennai', '2012-12-07', 'Male', 19000, 868686679);



SELECT * FROM staff;




CREATE TABLE departments (   -- primary table
	d_id INT PRIMARY KEY,
	dept_name VARCHAR(15) );
	

CREATE TABLE employees (       -- secondary table
	emp_id INT AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name  VARCHAR(50) NOT NULL,
	dob        DATE NOT NULL,
	status     TINYINT NOT NULL,
	description TEXT,
	doj TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	dept_id INT  NOT NULL,
	CONSTRAINT fk_empDept FOREIGN KEY(dept_id)
	REFERENCES departments(d_id)
	);
	
DESC employees;




INSERT INTO departments VALUES(101,'CSE');
INSERT INTO departments VALUES(102,'Mech');
INSERT INTO departments VALUES(103,'EE');

DESC departments;
SELECT * FROM departments;

INSERT INTO employees VALUES(1001,'Raj','Mark','2012-12-12',2,'Employees Salary and 
		Client payments',CURRENT_DATE, 101);
		
SELECT * FROM departments;

SELECT * FROM employees;



--foreign_key error_

INSERT INTO employees VALUES(1002,'Mary','John','2012-12-12',2,'Electrician',
				CURRENT_DATE, 105);

--correct query_

INSERT INTO employees VALUES(1002,'Mary','John','2012-12-12',2,'Electrician',
				CURRENT_DATE, 103);

INSERT INTO employees VALUES(1003,'Jk','John','2012-12-12',2,'Electrician',
				CURRENT_DATE, 103);
				
SELECT * FROM employees; 


DELETE FROM departments WHERE d_id=101; -- Foreign key error

UPDATE departments SET d_id=111 WHERE d_id=103; -- Foreign key error






SELECT * FROM departments;

SELECT * FROM employees;

DELETE FROM departments WHERE d_id=103; -- Not allows to delete a record . bcoz of fk

UPDATE  departments SET dept_name='Royal Mech' WHERE d_id=102;

UPDATE  departments SET dept_name='Electrical' WHERE d_id=103;

UPDATE employees SET dept_id=101 WHERE emp_id=1003;








USE coforgedb;
CREATE TABLE departments2 (   -- primary table
	d_id INT PRIMARY KEY,
	dept_name VARCHAR(15) );
	
CREATE TABLE employees2 (       -- secondary table
	emp_id INT AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name  VARCHAR(50) NOT NULL,
	dob        DATE NOT NULL,
	status     TINYINT NOT NULL,
	description TEXT,
	doj TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	dept_id INT  NOT NULL,
	CONSTRAINT fk_empDept2 FOREIGN KEY(dept_id)
	REFERENCES departments2(d_id)
	ON DELETE CASCADE
	ON UPDATE RESTRICT
	);

DESC employees2;
DESC departments2;

INSERT INTO departments2 VALUES(101,'CSE');
INSERT INTO departments2 VALUES(102,'Mech');
INSERT INTO departments2 VALUES(103,'EE');
SELECT * FROM departments2;

INSERT INTO employees2 VALUES(1001,'Raj','Mark','2012-12-12',2,'Employees Salary and 
		Client payments',CURRENT_DATE, 101);

SELECT * FROM employees2;
SELECT * FROM departments2;

INSERT INTO employees2 VALUES(1002,'Mary','John','2012-12-12',2,'Electrician',
				CURRENT_DATE, 103);

INSERT INTO employees2 VALUES(1003,'Jk','John','2012-12-12',2,'Electrician',
				CURRENT_DATE, 103);
				
SELECT * FROM employees2;
SELECT * FROM departments2;

DELETE FROM departments2 WHERE d_id=103; -- deletes department & employess bcoz of  on cascade
  