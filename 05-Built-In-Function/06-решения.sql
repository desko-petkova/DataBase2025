SELECT * FROM Sales
-- 01
SELECT SaleId, 
	   ProductName, 
	   Quantity, 
	   UnitPrice,
	   Quantity * UnitPrice AS TotalAmount
FROM Sales

-- 02
SELECT SaleId, 
	   Quantity * UnitPrice AS TotalAmount,
	   (Quantity * UnitPrice)-((Quantity * UnitPrice) * ISNULL(DiscountPercent,0)/100.0)
	   AS FinalAmount
FROM Sales
-- 03
SELECT SaleId, 
	   Quantity * UnitPrice AS TotalAmount,
FORMAT( (Quantity * UnitPrice)*(1- ISNULL(DiscountPercent,0)/100.0), 'N2')
	   AS FinalAmount
FROM Sales
-- 04
SELECT 
	COUNT(*),
	MIN(Quantity * UnitPrice) AS MinAmount,
	MAX(Quantity * UnitPrice) AS MaxAmount,
	AVG(Quantity * UnitPrice) AS AVGamount,

	MIN(ISNULL(DiscountPercent,0)) AS MinDiscount,
	MAX(ISNULL(DiscountPercent,0)) AS MaxDiscount,
	AVG(ISNULL(DiscountPercent,0)) AS AVGDiscount
FROM Sales

-- 05
-- Maria Petrova bought 2 x Notebook on 2025-01-05

-- 06
SELECT SaleId, SaleDate,
DATEDIFF(day, SaleDate, GETDATE()) AS diff_day,
DATEDIFF(month, SaleDate, GETDATE()) AS diff_month,
DATEDIFF(year, SaleDate, GETDATE()) AS diff_year
FROM Sales

-- 07 Месец и година на продажбата 
SELECT
	ProductName,
	DATEPART(month, SaleDate) AS SaleMonth,
	DATEPART(year, SaleDate) AS SaleYear
	FROM Sales

-- 09

SELECT
	SaleId,
	Quantity * UnitPrice AS TotalAmount,
	FLOOR(Quantity * UnitPrice) AS FlooredAmount,
	CEILING(Quantity * UnitPrice) AS CeiledAmount,
	ROUND(Quantity * UnitPrice, 2) AS RoundededAmount
FROM Sales





