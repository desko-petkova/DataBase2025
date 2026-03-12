CREATE DATABASE CourseCenter;
GO

USE CourseCenter;
GO

CREATE TABLE Students
(
    StudentId INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Age INT NOT NULL,
    City NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Courses
(
    CourseId INT PRIMARY KEY IDENTITY(1,1),
    CourseName NVARCHAR(100) NOT NULL,
    Category NVARCHAR(50) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    StartDate DATE NOT NULL
);

CREATE TABLE Enrollments
(
    EnrollmentId INT PRIMARY KEY IDENTITY(1,1),
    StudentId INT NOT NULL,
    CourseId INT NOT NULL,
    EnrollDate DATE NOT NULL,
    Grade DECIMAL(4,2) NULL,
    FOREIGN KEY (StudentId) REFERENCES Students(StudentId),
    FOREIGN KEY (CourseId) REFERENCES Courses(CourseId)
);
GO
INSERT INTO Students (FirstName, LastName, Age, City, Email)
VALUES
('Ivan', 'Petrov', 20, 'Sofia', 'ivan.petrov@email.com'),
('Maria', 'Ivanova', 22, 'Plovdiv', 'maria.ivanova@email.com'),
('Georgi', 'Dimitrov', 19, 'Varna', 'georgi.dimitrov@email.com'),
('Elena', 'Kostova', 24, 'Sofia', 'elena.kostova@email.com'),
('Nikolay', 'Todorov', 21, 'Burgas', 'nikolay.todorov@email.com'),
('Petya', 'Georgieva', 23, 'Ruse', 'petya.georgieva@email.com'),
('Dimitar', 'Iliev', 18, 'Sofia', 'dimitar.iliev@email.com'),
('Simona', 'Nikolova', 25, 'Varna', 'simona.nikolova@email.com');

INSERT INTO Courses (CourseName, Category, Price, StartDate)
VALUES
('C# Basics', 'Programming', 180.00, '2026-04-01'),
('SQL Fundamentals', 'Databases', 200.00, '2026-04-10'),
('Java OOP', 'Programming', 220.00, '2026-05-01'),
('Web Design', 'Design', 150.00, '2026-04-15'),
('Data Structures', 'Programming', 250.00, '2026-05-20'),
('Excel for Business', 'Office', 120.00, '2026-03-25');

INSERT INTO Enrollments (StudentId, CourseId, EnrollDate, Grade)
VALUES
(1, 1, '2026-03-01', 5.50),
(1, 2, '2026-03-02', 5.00),
(2, 2, '2026-03-03', 5.75),
(3, 1, '2026-03-04', 4.50),
(4, 3, '2026-03-05', 6.00),
(5, 4, '2026-03-06', 4.75),
(6, 5, '2026-03-07', NULL),
(7, 1, '2026-03-08', 5.25),
(8, 6, '2026-03-09', 5.90);
GO