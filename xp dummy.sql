--xp dummy data 
create DataBase xp 

CREATE TABLE designation (
	designation_id INT IDENTITY(1,1) PRIMARY KEY,
	designation_name VARCHAR (25) DEFAULT NULL
);

CREATE TABLE employees (
	employee_id INT IDENTITY(1,1) PRIMARY KEY,
	employee_name VARCHAR (30) NOT NULL,
	designation_id INT DEFAULT NULL,
	dt_joining_date DATE not null,
	FOREIGN KEY (designation_id) REFERENCES designation (designation_id) ON DELETE CASCADE ON UPDATE CASCADE
);

SET IDENTITY_INSERT designation ON;
INSERT INTO designation(designation_id,designation_name) VALUES (1,'Project manager');
INSERT INTO designation(designation_id,designation_name) VALUES (2,'Business Analyist');
INSERT INTO designation(designation_id,designation_name) VALUES (3,'Full stcak developer');
SET IDENTITY_INSERT designation OFF;

SET IDENTITY_INSERT employees ON; -- using first insert
INSERT INTO employees (employee_id,employee_name,designation_id,dt_joining_date) VALUES (1,'Siddharth chawade',3,'2021-10-20 00:00:00.000');
INSERT INTO employees (employee_id, employee_name, designation_id, dt_joining_date) VALUES (2, 'Pranay Voore', 3, '2021-10-20 00:00:00.000');
INSERT INTO employees (employee_id, employee_name, designation_id, dt_joining_date) VALUES (3, 'Bharath Uppalanchi', 3, '2021-11-07 00:00:00.000');
INSERT INTO employees (employee_id, employee_name, designation_id, dt_joining_date) VALUES (4, 'Yatish Bangari', 3, '2022-01-05 00:00:00.000');
INSERT INTO employees (employee_id, employee_name, designation_id, dt_joining_date) VALUES (5, 'Ganesh Galkwad', 3, '2022-06-08 00:00:00.000');
INSERT INTO employees (employee_id, employee_name, designation_id, dt_joining_date) VALUES (6, 'Payall Mankar', 3, '2022-06-08 00:00:00.000');
INSERT INTO employees (employee_id, employee_name, designation_id, dt_joining_date) VALUES (7, 'Piyush Mishra', 3, '2022-08-12 00:00:00.000');
INSERT INTO employees (employee_id, employee_name, designation_id, dt_joining_date) VALUES (8, 'Raj Vardhan', 3, '2022-08-16 00:00:00.000');
INSERT INTO employees (employee_id, employee_name, designation_id, dt_joining_date) VALUES (9, 'Yogash', 3, '2022-11-03 00:00:00.000');
INSERT INTO employees (employee_id, employee_name, designation_id, dt_joining_date) VALUES (10, 'Tomeshwar Sahu', 3, '2022-11-03 00:00:00.000');
INSERT INTO employees (employee_id, employee_name, designation_id, dt_joining_date) VALUES (11, 'Rajan Suwal', 1, '2020-01-01 00:00:00.000');
INSERT INTO employees (employee_id, employee_name, designation_id, dt_joining_date) VALUES (12, 'Sawan Singh', 2, '2021-04-17 00:00:00.000');
INSERT INTO employees (employee_id, employee_name, designation_id, dt_joining_date) VALUES (13, 'Ankit Sharma', 2, '2023-09-20 00:00:00.000');
SET IDENTITY_INSERT employees OFF;

select * from designation
select * from employees

DELETE from designation where designation_id = 7

INSERT INTO designation(designation_name)  -- insert without primary key
values('Quality analyst')