-------- Трета нормална форма --------
CREATE DATABASE ThirdNormalForm;
GO
USE ThirdNormalForm;
GO

-------------------------------
-- 1. CardHolders
-------------------------------
CREATE TABLE CardHolders3NF (
    HolderID INT IDENTITY PRIMARY KEY,
    FullName NVARCHAR(100),
    EGN CHAR(10),
    Phone NVARCHAR(20),
    Email NVARCHAR(100),
    Address NVARCHAR(200)
);

-------------------------------
-- 2. Accounts
-------------------------------
CREATE TABLE Accounts3NF (
    AccountID INT IDENTITY PRIMARY KEY,
    HolderID INT,
    IBAN VARCHAR(34),
    Balance MONEY,
    Currency VARCHAR(5),
    AccountTypeID INT,
    FOREIGN KEY (HolderID) REFERENCES CardHolders3NF(HolderID)
);

-------------------------------
-- 3. AccountTypes (Премахваме транзитивната зависмост)
-- AccountType → InterestRate
-------------------------------
CREATE TABLE AccountTypes3NF (
    AccountTypeID INT IDENTITY PRIMARY KEY,
    AccountTypeName NVARCHAR(50),
    InterestRate DECIMAL(4,2)
);

-------------------------------
-- 4. Branches (Премахваме транзитивната зависмост)
-- BranchCode → City
-------------------------------
CREATE TABLE Branches3NF (
    BranchCode NVARCHAR(10) PRIMARY KEY,
    City NVARCHAR(50)
);

-------------------------------
-- 5. CardTypes (от 2НФ, вече е коректно нормализирана)
-------------------------------
CREATE TABLE CardTypes3NF (
    TypeID INT IDENTITY PRIMARY KEY,
    TypeName VARCHAR(20),
    AnnualFee MONEY
);

-------------------------------
-- 6. Cards (НЯМА транзитивни зависимости)
-------------------------------
CREATE TABLE Cards3NF (
    AccountID INT,
    CardNumber VARCHAR(20),
    TypeID INT,
    ExpireDate VARCHAR(10),
    BranchCode NVARCHAR(10),

    PRIMARY KEY (AccountID, CardNumber),

    FOREIGN KEY (AccountID) REFERENCES Accounts3NF(AccountID),
    FOREIGN KEY (TypeID) REFERENCES CardTypes3NF(TypeID),
    FOREIGN KEY (BranchCode) REFERENCES Branches3NF(BranchCode)
);

INSERT INTO CardHolders3NF (FullName, EGN, Phone, Email, Address) VALUES
(N'Иван Иванов', '9901011234', '0888123456', 'ivan@abv.bg', N'София, ул. Шипка 10'),
(N'Мария Георгиева', '9812125678', '0899332211', 'maria@gmail.com', N'Пловдив, бул. Марица 5'),
(N'Петър Петров', '0101011111', '0889001100', 'petar@dir.bg', N'Варна, ул. Черно море 12'),
(N'Галина Димитрова', '9703216543', '0887443322', 'galina@mail.bg', N'Бургас, ул. Сливница 1'),
(N'Иво Стоянов', '9605129876', '0895111222', 'ivo@yahoo.com', N'Русе, ул. Дунав 20'),
(N'Калин Николов', '8501012222', '0888001122', 'kalin@gmail.com', N'Плевен, ул. Победа 6'),
(N'Силвия Костова', '9911223344', '0877009900', 'silvia@abv.bg', N'София, ул. Левски 44');

INSERT INTO AccountTypes3NF (AccountTypeName, InterestRate) VALUES
(N'Разплащателна', 0.00),
(N'Спестовна', 1.50),
(N'Доларова', 0.00);


INSERT INTO Accounts3NF (HolderID, IBAN, Balance, Currency, AccountTypeID) VALUES
(1, 'BG80BNBG96611020345678', 1200, 'BGN', 1),
(2, 'BG45UNCR70001520202020', 2500, 'BGN', 2),
(3, 'BG66CECB97901234567890', 5400, 'EUR', 1),
(4, 'BG12STSA93000011112222', 890,  'BGN', 1),
(5, 'BG90UBBS88889999000011', 15000,'USD', 3),
(6, 'BG77FINV91501333333333', 7200, 'EUR', 2),
(7, 'BG11BPBI12340000555555', 350,  'BGN', 1);

INSERT INTO CardTypes3NF (TypeName, AnnualFee) VALUES
('Visa', 30),
('MasterCard', 45),
('Discover', 25),
('VisaElectron', 20),
('Maestro', 10),
('AmericanExpress', 120);

INSERT INTO Branches3NF (BranchCode, City) VALUES
('1001', N'София'),
('2004', N'Пловдив'),
('3002', N'Варна'),
('4001', N'Бургас'),
('5003', N'Русе'),
('6002', N'Плевен');

INSERT INTO Cards3NF
(AccountID, CardNumber, TypeID, ExpireDate, BranchCode) VALUES
-- Иван (2 карти)
(1, '4111111111111111', 1, '12/27', '1001'),
(1, '5500005555555559', 2, '05/28', '1001'),

-- Мария (2 карти)
(2, '5105105105105100', 2, '09/26', '2004'),
(2, '4000001234567899', 1, '11/26', '2004'),

-- Петър (2 карти)
(3, '6011000990139424', 3, '03/27', '3002'),
(3, '4200000000000000', 4, '12/25', '3002'),

-- Галина (1 карта)
(4, '5301250000000012', 5, '02/28', '4001'),

-- Иво (1 карта)
(5, '378282246310005',  6, '01/29', '5003'),

-- Калин (1 карта)
(6, '4000100022223333', 1, '07/26', '6002'),

-- Силвия (1 карта)
(7, '6011000990139424', 3, '03/27', '1001');


SELECT * FROM CardHolders3NF
SELECT * FROM Accounts3NF
SELECT * FROM Cards3NF
SELECT * FROM CardTypes3NF
SELECT * FROM Branches3NF