CREATE DATABASE ShopDB;
GO
USE ShopDB;
GO

CREATE TABLE Sales
(
    SaleId INT PRIMARY KEY,
    CustomerName VARCHAR(50) NOT NULL,
    ProductName  VARCHAR(50) NOT NULL,
    Quantity     INT NOT NULL,
    UnitPrice    DECIMAL(10,2) NOT NULL,
    DiscountPercent INT NULL,          -- % отстъпка, може да е NULL
    SaleDate     DATE NOT NULL
);

INSERT INTO Sales (SaleId, CustomerName, ProductName, Quantity, UnitPrice, DiscountPercent, SaleDate) VALUES
(1, 'Maria Petrova',   'Notebook',        2,  5.50,   0,   '2025-01-05'),
(2, 'Ivan Ivanov',     'Pencil',         10,  0.80,  10,   '2025-01-15'),
(3, 'Georgi Stoyanov', 'Backpack',       1, 45.90,  15,   '2025-02-02'),
(4, 'Petya Georgieva', 'Water Bottle',   3, 12.30, NULL,  '2025-02-20'),
(5, 'Hristo Kolev',    'Calculator',     1, 29.99,  5,    '2025-03-01'),
(6, 'Monika Miteva',   'Notebook',       5,  5.50,  20,   '2025-03-10'),
(7, 'Zlatko Zlatkov',  'Markers Set',    2, 15.75,  0,    '2025-03-25'),
(8, 'Kiril Petrov',    'Pencil',        20,  0.75,  25,   '2025-04-02'),
(9, 'Petar Kirilov',   'Backpack',       2, 42.00, NULL,  '2025-04-15'),
(10,'Zlatina Pateva',  'Notebook',       1,  5.50,  0,    '2025-05-01');
