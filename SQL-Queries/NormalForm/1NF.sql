CREATE DATABASE FirstNormalForm;
GO
USE FirstNormalForm;
GO

CREATE TABLE CardHolders1NF (
    HolderID INT IDENTITY PRIMARY KEY,
    FullName NVARCHAR(100),
    EGN CHAR(10),
    Phone NVARCHAR(20),
    Email NVARCHAR(100),
    Address NVARCHAR(200)
);

CREATE TABLE Accounts1NF (
    AccountID INT IDENTITY PRIMARY KEY,
    HolderID INT,
    IBAN VARCHAR(34),
    Balance MONEY,
    Currency VARCHAR(5),
    FOREIGN KEY (HolderID) REFERENCES CardHolders1NF(HolderID)
);

CREATE TABLE Cards1NF (
    CardID INT IDENTITY PRIMARY KEY,
    AccountID INT,
    HolderID INT,
    CardNumber VARCHAR(20),
    CardType VARCHAR(20),
    ExpireDate VARCHAR(10),
    AnnualFee MONEY,
    AccountType VARCHAR(30),
    InterestRate DECIMAL(4,2),
    City NVARCHAR(50),
    BranchCode NVARCHAR(10),
    FOREIGN KEY (HolderID) REFERENCES CardHolders1NF(HolderID),
    FOREIGN KEY (AccountID) REFERENCES Accounts1NF(AccountID)
);

INSERT INTO CardHolders1NF (FullName, EGN, Phone, Email, Address) VALUES
(N'Иван Иванов', '9901011234', '0888123456', 'ivan@abv.bg', N'София, ул. Шипка 10'),
(N'Мария Георгиева', '9812125678', '0899332211', 'maria@gmail.com', N'Пловдив, бул. Марица 5'),
(N'Петър Петров', '0101011111', '0889001100', 'petar@dir.bg', N'Варна, ул. Черно море 12'),
(N'Галина Димитрова', '9703216543', '0887443322', 'galina@mail.bg', N'Бургас, ул. Сливница 1'),
(N'Иво Стоянов', '9605129876', '0895111222', 'ivo@yahoo.com', N'Русе, ул. Дунав 20'),
(N'Калин Николов', '8501012222', '0888001122', 'kalin@gmail.com', N'Плевен, ул. Победа 6'),
(N'Силвия Костова', '9911223344', '0877009900', 'silvia@abv.bg', N'София, ул. Левски 44');

INSERT INTO Accounts1NF (HolderID, IBAN, Balance, Currency) VALUES
(1, 'BG80BNBG96611020345678', 1200, 'BGN'),
(2, 'BG45UNCR70001520202020', 2500, 'BGN'),
(3, 'BG66CECB97901234567890', 5400, 'EUR'),
(4, 'BG12STSA93000011112222', 890,  'BGN'),
(5, 'BG90UBBS88889999000011', 15000,'USD'),
(6, 'BG77FINV91501333333333', 7200, 'EUR'),
(7, 'BG11BPBI12340000555555', 350,  'BGN');

INSERT INTO Cards1NF
(AccountID, HolderID, CardNumber, CardType, ExpireDate,
 AnnualFee, AccountType, InterestRate, City, BranchCode)
VALUES
-- Иван (2 карти)
(1, 1, '4111111111111111', 'Visa',        '12/27', 30, N'Разплащателна', 0.00, N'София',       '1001'),
(1, 1, '5500005555555559', 'MasterCard',  '05/28', 45, N'Разплащателна', 0.00, N'София',       '1001'),

-- Мария (2 карти)
(2, 2, '5105105105105100', 'MasterCard',  '09/26', 40, N'Спестовна',      1.50, N'Пловдив',    '2004'),
(2, 2, '4000001234567899', 'Visa',        '11/26', 35, N'Спестовна',      1.50, N'Пловдив',    '2004'),

-- Петър (2 карти)
(3, 3, '6011000990139424', 'Discover',    '03/27', 25, N'Разплащателна', 0.00, N'Варна',       '3002'),
(3, 3, '4200000000000000', 'VisaElectron','12/25', 20, N'Разплащателна', 0.00, N'Варна',       '3002'),

-- Галина (1 карта)
(4, 4, '5301250000000012', 'Maestro',     '02/28', 10, N'Разплащателна', 0.00, N'Бургас',      '4001'),

-- Иво (1 карта)
(5, 5, '378282246310005',  'AmericanExpress','01/29', 120, N'Доларова',  0.00, N'Русе',        '5003'),

-- Калин (1 карта)
(6, 6, '4000100022223333', 'Visa',        '07/26', 30, N'Спестовна',      1.20, N'Плевен',     '6002'),

-- Силвия (1 карта)
(7, 7, '6011000990139424', 'Discover',    '03/27', 25, N'Разплащателна', 0.00, N'София',       '1001');

SELECT * FROM CardHolders1NF
SELECT * FROM Accounts1NF
SELECT * FROM Cards1NF