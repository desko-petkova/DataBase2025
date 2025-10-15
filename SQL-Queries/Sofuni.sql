-- Problem 15. Create softuni Database
CREATE DATABASE softuni;


USE softuni


-- Create tables


CREATE TABLE towns
(
	id INT IDENTITY(1,1) NOT NULL,
	name NVARCHAR(50),
	CONSTRAINT pk_towns PRIMARY KEY (id)
);
GO


CREATE TABLE addresses
(
	id INT IDENTITY(1,1) NOT NULL,
	address_text NVARCHAR(100),
	town_id INT,
	
);
GO


CREATE TABLE departments
(
	id INT IDENTITY(1,1) NOT NULL,
	name NVARCHAR(50),
	CONSTRAINT pk_departments PRIMARY KEY (id)
);
GO


CREATE TABLE employees
(
	id INT IDENTITY(1,1) NOT NULL,
	first_name NVARCHAR(50),
	middle_name NVARCHAR(50),
	last_name NVARCHAR(50),
	job_title NVARCHAR(20),
	department_id INT,
	hire_date DATE,
	salary DECIMAL(12,4),
	address_id INT,
	
);
GO


INSERT INTO towns (name) VALUES 
('Sofia'),
('Plovdiv'),
('Varna'),
('Burgas');

INSERT INTO departments (name) VALUES 
('Engineering'),
('Sales'),
('Marketing'),
('Software Development'),
('Quality Assurance');

INSERT INTO employees (first_name, middle_name, last_name, job_title, department_id, hire_date, salary)
VALUES 
('Ivan', 'Ivanov', 'Ivanov', '.NET Developer', 4, '2013-02-01', 3500.00),
('Petar', 'Petrov', 'Petrov', 'Senior Engineer', 1, '2004-03-02', 4000.00),
('Maria', 'Petrova', 'Ivanova', 'Intern', 5, '2016-08-28', 525.25),
('Georgi', 'Terziev', 'Ivanov', 'CEO', 2, '2007-12-09', 3000.00),
('Peter', 'Pan', 'Pan', 'Intern', 3, '2016-08-28', 599.88);
GO


