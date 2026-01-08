-- ==================================================================================
-- SQL JOIN – Упражнителен лист
-- Тема: INNER / LEFT / RIGHT / FULL JOIN, M:M (bridge таблици), anti-join, EXISTS
-- База данни: Geography
-- ==================================================================================
-- Задача 1. INNER JOIN (Countries → Continents)  Изведете: CountryName, ContinentName, Population за всички държави.


-- Задача 2. INNER JOIN (Countries → Currencies)  Изведете: CountryName, CurrencyCode и Description за държави, които имат валута.


-- Задача 3. LEFT JOIN (Countries → Currencies)
-- Изведете всички държави + описание на валутата им.
-- Държавите без валута трябва да се виждат с NULL за колоните от Currencies.


-- Задача 4. LEFT JOIN + IS NULL (anti-join)
-- Изведете държавите, които нямат записана валута (няма съвпадение в Currencies).


-- Задача 5. INNER JOIN + филтър по континент
-- Изведете всички държави в континент "Europe" (по име на континента).
-- Покажете: CountryName и Capital.


-- Задача 6. M:M (MountainsCountries)
-- Изведете всички планински вериги и държавите, в които се намират.
-- Покажете: MountainRange, CountryName.


-- Задача 7. LEFT JOIN + IS NULL (държави без планини) Изведете държавите, които нямат записи в MountainsCountries.


-- Задача 8. INNER JOIN (Peaks → Mountains)
-- Изведете всички върхове заедно с планината им.
-- Покажете: MountainRange, PeakName, Elevation.


-- Задача  9. TOP 5 (Peaks + Mountains + Countries)
-- Изведете TOP 5 върха по Elevation.
-- Покажете: PeakName, Elevation, MountainRange, CountryName.



-- Задача 10. M:M (CountriesRivers)
-- Изведете всички връзки държава–река.
-- Покажете: CountryName, RiverName, Length.




-- Задача 11. LEFT JOIN + IS NULL (държави без реки)
-- Изведете държавите, които нямат записи в CountriesRivers.



-- Задача 12. FULL JOIN (Countries ↔ Currencies)
-- Изведете всички държави и всички валути, включително несъвпадащите.
-- Покажете: CountryName, CountryCurrencyCode, CurrencyTableCode, Description.


-- Задача 13. LEFT JOIN “капан” (убиване на LEFT JOIN) + поправка
-- A) Напишете грешна версия: всички държави + реки с Length > 1000, но условието е във WHERE.
-- B) Напишете правилна версия: условието Length > 1000 е в ON, за да се запази LEFT JOIN.
