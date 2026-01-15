-- ==================================================================================
-- SQL JOIN – Упражнителен лист
-- Тема: INNER / LEFT / RIGHT / FULL JOIN, M:M (bridge таблици), anti-join, EXISTS
-- База данни: Geography
-- ==================================================================================
-- Задача 1. INNER JOIN (Countries → Continents)  Изведете: CountryName, ContinentName, Population за всички държави
-- подредени по полукация в намаляващ ред
SELECT
    c.CountryName,
    ct.ContinentName,
    c.Population
FROM Countries AS c
INNER JOIN Continents AS ct
    ON ct.ContinentCode = c.ContinentCode
    order by c.Population Desc

-- Задача 2. INNER JOIN (Countries → Currencies)  Изведете: CountryName, CurrencyCode и Description за държави, които имат валута.
SELECT
    c.CountryName,
    c.CurrencyCode,
    cu.[Description]
FROM Countries c
INNER JOIN Currencies cu
    ON cu.CurrencyCode = c.CurrencyCode;

-- Задача 3. LEFT JOIN (Countries → Currencies)
-- Изведете всички държави + описание на валутата им.
-- Държавите без валута трябва да се виждат с NULL за колоните от Currencies.
SELECT
    c.CountryName,
    c.CurrencyCode,
    cu.[Description]
FROM Countries c
LEFT JOIN Currencies cu
    ON cu.CurrencyCode = c.CurrencyCode;

-- Задача 4. LEFT JOIN + IS NULL (anti-join)
-- Изведете държавите, които нямат записана валута (няма съвпадение в Currencies).
SELECT
    c.CountryName
FROM Countries c
LEFT JOIN Currencies cu
    ON cu.CurrencyCode = c.CurrencyCode
WHERE cu.CurrencyCode IS NULL;

-- Задача 5. INNER JOIN + филтър по континент
-- Изведете всички държави в континент "Europe" (по име на континента).
-- Покажете: CountryName и Capital.
SELECT
    c.CountryName,
    c.Capital
FROM Countries c
INNER JOIN Continents ct
    ON ct.ContinentCode = c.ContinentCode
WHERE ct.ContinentName = 'Europe';

-- Задача 6. M:M (MountainsCountries)
-- Изведете всички планински вериги и държавите, в които се намират.
-- Покажете: MountainRange, CountryName.
SELECT * FROM Countries
SELECT * FROM Mountains
SELECT * FROM MountainsCountries

SELECT
    m.MountainRange,
    c.CountryName
FROM Mountains m
JOIN MountainsCountries mc
    ON mc.MountainId = m.Id
JOIN Countries c
    ON c.CountryCode = mc.CountryCode
ORDER BY m.MountainRange;

-- Задача 7. LEFT JOIN + IS NULL (държави без планини) Изведете държавите, които нямат записи в MountainsCountries.
SELECT
    c.CountryName, c.CountryCode,
    mc.CountryCode
FROM Countries c
LEFT JOIN MountainsCountries mc
    ON mc.CountryCode = c.CountryCode
WHERE mc.MountainId IS NULL
ORDER BY c.CountryName;


-- Задача 8. INNER JOIN (Peaks → Mountains)
-- Изведете всички върхове заедно с планината им.
-- Покажете: MountainRange, PeakName, Elevation.
SELECT * FROM Peaks
SELECT * FROM Mountains

SELECT
    m.MountainRange,
    p.PeakName,
    p.Elevation
FROM Mountains m
JOIN Peaks p
    ON m.Id = p.MountainId

-- Задача  9. TOP 5 (Peaks + Mountains + Countries)
-- Изведете TOP 5 върха по Elevation.
-- Покажете: PeakName, Elevation, MountainRange, CountryName.
SELECT TOP 5
    p.PeakName,
    p.Elevation,
    m.MountainRange,
    c.CountryName
FROM Peaks p
INNER JOIN Mountains m
    ON m.Id = p.MountainId
INNER JOIN MountainsCountries mc
    ON mc.MountainId = m.Id
INNER JOIN Countries c
    ON c.CountryCode = mc.CountryCode
ORDER BY p.Elevation DESC;


-- Задача 10. M:M (CountriesRivers)
-- Изведете всички връзки държава–река.
-- Покажете: CountryName, RiverName, Length.
SELECT
    c.CountryName,
    r.RiverName,
    r.Length
FROM Countries c
INNER JOIN CountriesRivers cr
    ON cr.CountryCode = c.CountryCode
INNER JOIN Rivers r
    ON r.Id = cr.RiverId
ORDER BY r.Length DESC;



-- Задача 11. LEFT JOIN + IS NULL (държави без реки)
-- Изведете държавите, които нямат записи в CountriesRivers.
SELECT
    c.CountryName
FROM Countries c
LEFT JOIN CountriesRivers cr
    ON cr.CountryCode = c.CountryCode
WHERE cr.RiverId IS NULL
ORDER BY c.CountryName;


-- Задача 12. FULL JOIN (Countries ↔ Currencies)
-- Изведете всички държави и всички валути, включително несъвпадащите.
-- Покажете: CountryName, CountryCurrencyCode, CurrencyTableCode, Description.
SELECT
    c.CountryName,
    c.CurrencyCode AS CountryCurrencyCode,
    cu.CurrencyCode AS CurrencyTableCode,
    cu.[Description]
FROM Countries c
FULL JOIN Currencies cu
    ON cu.CurrencyCode = c.CurrencyCode

-- Задача 13. LEFT JOIN “капан” (убиване на LEFT JOIN) + поправка
-- A) Напишете грешна версия: всички държави + реки с Length > 1000, но условието е във WHERE.
-- B) Напишете правилна версия: условието Length > 1000 е в ON, за да се запази LEFT JOIN.

SELECT
    c.CountryName,
    r.RiverName,
    r.Length
FROM Countries c
LEFT JOIN CountriesRivers cr
    ON cr.CountryCode = c.CountryCode
LEFT JOIN Rivers r
    ON r.Id = cr.RiverId
WHERE r.Length > 1000   -- убива LEFT JOIN
ORDER BY c.CountryName;

SELECT
    c.CountryName,
    r.RiverName,
    r.Length
FROM Countries c
LEFT JOIN CountriesRivers cr
    ON cr.CountryCode = c.CountryCode
LEFT JOIN Rivers r
    ON r.Id = cr.RiverId
   AND r.Length > 1000   -- запазва LEFT JOIN
ORDER BY c.CountryName;
--=============================================
--    Задачи с агрегиращи функции 
--=============================================
-- Задача 14. JOIN + GROUP BY (брой държави по континенти)
-- За всеки континент изведете ContinentName и броя държави в него.

-- Задача 15. JOIN + SUM (общо население по континенти)
-- За всеки континент изведете общото население (SUM(Population)).

-- Задача 16. GROUP BY (най-висока височина за всяка планина)
-- За всяка планина изведете MountainRange и MAX(Elevation) като HighestElevation.

-- Задача 17. Най-висок връх за всяка планина (име + височина)
-- За всяка планина изведете името на най-високия връх (PeakName) и неговата височина (Elevation).
-- Подсказка: MAX + JOIN или ROW_NUMBER.

-- Задача 18. Най-висок връх за всяка държава (M:M + Peaks)
-- За всяка държава изведете най-високия връх на нейна територия.
-- Таблици: Countries → MountainsCountries → Peaks.

-- Задача 19. Най-дълга река за всяка държава (MAX Length)
-- За всяка държава изведете MAX(Length) като LongestRiverLength.
-- Таблици: Countries → CountriesRivers → Rivers.

-- Задача 20. Континенти: общо население + обща площ (SUM)
-- За всеки континент изведете: ContinentName, SUM(Population), SUM(AreaInSqKm).
