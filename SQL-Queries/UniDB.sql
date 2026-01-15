-- Creat Database 
CREATE DATABASE UniDB;
GO

USE UniDB;
GO

-- 1️⃣ Students
CREATE TABLE Students (
    student_id INT IDENTITY(1,1) PRIMARY KEY,               -- Уникален идентификатор
    first_name NVARCHAR(50) NOT NULL,                       -- Име
    last_name NVARCHAR(50) NOT NULL,                        -- Фамилия
    birth_date DATE CHECK (birth_date <= GETDATE()),        -- Дата на раждане, не може да е бъдеща
    email NVARCHAR(100) UNIQUE                              -- Уникален имейл адрес
);

-- 2️⃣ StudentDetails (1:1 с Students)
CREATE TABLE StudentDetails (
    detail_id INT PRIMARY KEY,                              -- Съвпада със student_id
    address NVARCHAR(255),
    city NVARCHAR(100) DEFAULT 'Sofia',
    phone NVARCHAR(15) CHECK (phone LIKE '+359%' OR phone LIKE '0%'),
    CONSTRAINT FK_StudentDetails_Students FOREIGN KEY (detail_id)
        REFERENCES Students(student_id)
);

-- 3️⃣ Departments (1:М с Professors)
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    name NVARCHAR(100) NOT NULL UNIQUE,
    established_on DATE
);

-- 4️⃣ Professors (1:М и Self-Join)
CREATE TABLE Professors (
    professor_id INT PRIMARY KEY,
    full_name NVARCHAR(100) NOT NULL,
    title NVARCHAR(50) CHECK (title IN ('Dr.', 'Assoc. Prof.', 'Prof.')),
    department_id INT NOT NULL,
    manager_id INT NULL,
    CONSTRAINT FK_Professors_Departments FOREIGN KEY (department_id)
        REFERENCES Departments(department_id),
    CONSTRAINT FK_Professors_Manager FOREIGN KEY (manager_id)
        REFERENCES Professors(professor_id)
);

-- 5️⃣ Courses (1:М – един професор преподава няколко курса)
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name NVARCHAR(100) NOT NULL,
    credits TINYINT CHECK (credits BETWEEN 1 AND 10),
    professor_id INT,
    CONSTRAINT FK_Courses_Professors FOREIGN KEY (professor_id)
        REFERENCES Professors(professor_id)
);

-- 6️⃣ Exams
CREATE TABLE Exams (
    exam_id INT PRIMARY KEY,
    course_id INT NOT NULL,
    exam_date DATE NOT NULL,
    CONSTRAINT FK_Exams_Courses FOREIGN KEY (course_id)
        REFERENCES Courses(course_id)
);

-- 7️⃣ Students_Exams (М:М)
CREATE TABLE Students_Exams (
    student_id INT NOT NULL,
    exam_id INT NOT NULL,
    grade DECIMAL(3,1) CHECK (grade BETWEEN 2.00 AND 6.00),
    CONSTRAINT PK_Students_Exams PRIMARY KEY (student_id, exam_id),
    CONSTRAINT FK_StudentsExams_Students FOREIGN KEY (student_id)
        REFERENCES Students(student_id),
    CONSTRAINT FK_StudentsExams_Exams FOREIGN KEY (exam_id)
        REFERENCES Exams(exam_id)
);
GO

INSERT INTO Students 
VALUES
('Ivan', 'Petrov', '2002-05-14', 'ivan.petrov@uni.bg'),
('Maria', 'Dimitrova', '2001-09-22', 'maria.dimitrova@uni.bg'),
('Georgi', 'Nikolov', '2003-03-05', 'georgi.nikolov@uni.bg'),
('Elena', 'Stoyanova', '2002-11-30', 'elena.stoyanova@uni.bg'),
('Petya', 'Koleva', '2001-06-18', 'petya.koleva@uni.bg');

SELECT * FROM Students

INSERT INTO StudentDetails (detail_id, address, city, phone)
VALUES
(1, 'ul. Shipka 12', 'Sofia', '+359885223344'),
(2, 'bul. Tsar Osvoboditel 45', 'Plovdiv', '0885123456'),
(3, 'ul. Rakovski 7', 'Varna', '+359878998877'),
(4, 'ul. Cherni vrah 5', DEFAULT, '0877555444'),
(5, 'ul. Dunav 22', 'Ruse', '+359888999000');

SELECT * FROM StudentDetails

INSERT INTO Departments (department_id, name, established_on)
VALUES
(1, 'Computer Science', '1990-10-01'),
(2, 'Mathematics', '1985-09-01'),
(3, 'Physics', '1988-03-15');

SELECT * FROM Departments

INSERT INTO Professors (professor_id, full_name, title, department_id, manager_id)
VALUES
(101, 'Dr. Petar Ivanov', 'Prof.', 1, NULL),          -- Ръководител на катедра "Computer Science"
(102, 'Dr. Nikolay Stoyanov', 'Assoc. Prof.', 1, 101), -- Подчинен на Petar Ivanov
(103, 'Dr. Yana Petrova', 'Prof.', 2, NULL),          -- Ръководител на катедра "Mathematics"
(104, 'Dr. Dimitar Kolev', 'Assoc. Prof.', 2, 103),   -- Подчинен на Yana Petrova
(105, 'Dr. Hristo Marinov', 'Prof.', 3, NULL),        -- Ръководител на катедра "Physics"
(106, 'Dr. Vesela Georgieva', 'Dr.', 1, 101); 
INSERT INTO Professors (professor_id, full_name, title, department_id, manager_id)
VALUES (107, 'Dr. Ivo Ivanov', 'Dr.', 2, NULL);

SELECT * FROM Professors

INSERT INTO Courses (course_id, course_name, credits, professor_id)
VALUES
(1, 'Database Systems', 6, 101),
(2, 'Algorithms', 5, 102),
(3, 'Linear Algebra', 4, 103),
(4, 'Discrete Mathematics', 5, 104),
(5, 'Quantum Mechanics', 6, 105);

INSERT INTO Courses (course_id, course_name, credits, professor_id)
VALUES (6, 'Functional programming', 6, NULL);
INSERT INTO Courses (course_id, course_name, credits, professor_id)
VALUES (7, 'Mathematics', 6, 103);
INSERT INTO Courses (course_id, course_name, credits, professor_id)
VALUES (8, 'Programming', 3, 107);

SELECT * FROM Courses

INSERT INTO Exams (exam_id, course_id, exam_date)
VALUES
(1001, 1, '2025-01-15'),
(1002, 2, '2025-01-20'),
(1003, 3, '2025-01-22'),
(1004, 4, '2025-01-25'),
(1005, 5, '2025-02-01');

SELECT * FROM Exams

INSERT INTO Students_Exams (student_id, exam_id, grade)
VALUES
(1, 1001, 5.50),
(1, 1002, 4.75),
(2, 1001, 6.00),
(2, 1003, 5.00),
(3, 1004, 5.25),
(3, 1001, 4.50),
(4, 1005, 5.75),
(5, 1003, 5.00),
(5, 1005, 4.80);

SELECT * FROM Students_Exams

