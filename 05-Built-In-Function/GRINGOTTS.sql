SELECT * FROM WizzardDeposits
-- 03
SELECT COUNT(*) AS [Count]
FROM WizzardDeposits

-- 04
SELECT MAX(MagicWandSize) AS LongestMagicWand
FROM WizzardDeposits

-- 05
SELECT DepositGroup,
MAX(MagicWandSize) AS LongestMagicWand
FROM WizzardDeposits
GROUP BY DepositGroup

-- 06
SELECT TOP 2 DepositGroup
FROM WizzardDeposits
GROUP BY DepositGroup
ORDER BY AVG(MagicWandSize)

-- 07 -- 08
SELECT DepositGroup,MagicWandCreator,
		SUM(DepositAmount) AS TotalSum
FROM WizzardDeposits
WHERE MagicWandCreator = 'Ollivander family'
GROUP BY DepositGroup, MagicWandCreator
--09
SELECT DepositGroup,MagicWandCreator,
		SUM(DepositAmount) AS TotalSum
FROM WizzardDeposits
WHERE MagicWandCreator = 'Ollivander family'
GROUP BY DepositGroup, MagicWandCreator
HAVING SUM(DepositAmount) > 150000
ORDER BY SUM(DepositAmount) DESC
--10
SELECT DepositGroup, MagicWandCreator,
		MIN(DepositCharge) AS MinDepositCharge
FROM WizzardDeposits
GROUP BY MagicWandCreator, DepositGroup
ORDER BY MagicWandCreator ASC

