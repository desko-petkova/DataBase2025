------------------------------------------------
-- Упражнения с LTRIM, RTRIM, REVERSE, REPLICATE
------------------------------------------------

CREATE TABLE Messages (
    msg_id INT PRIMARY KEY,
    text_value VARCHAR(100)
);

INSERT INTO Messages VALUES
(1, '   Hello world'),
(2, 'SQL Server   '),
(3, '   Trim me   '),
(4, 'Palindrome'),
(5, 'Test');
INSERT INTO Messages VALUES
(6, 'Kapak')
-- LTRIM — премахване на водещи интервали
-- RTRIM — премахване на интервали в края
-- Комбинация LTRIM + RTRIM (еквивалент на TRIM)
SELECT * FROM Messages

-- 2. Покажи текст без крайните интервали.
SELECT text_value,
    LTRIM(text_value) as left_trim,
    RTRIM(text_value) as right_trim 
FROM Messages

-- 3. Премахни интервали от двете страни.
SELECT text_value,
    LTRIM(RTRIM(text_value)) AS trimm 
    FROM Messages

-- 4. REVERSE — обърни текста на обратно
SELECT text_value,
    REVERSE(text_value) AS reversed 
    FROM Messages

-- 5. Намери кои текстове са палиндроми
SELECT text_value
FROM Messages
WHERE TRIM(text_value) = REVERSE(TRIM(text_value))

-- 6. REPLICATE — повтори текста 3 пъти


-- 7. Изгради „рамка“ около текста с REPLICATE. Промер: ***Hello world***


-- 8. Постави 10 тирета преди текст

-- 9. Изчисти интервали и повтори думата 5 пъти


-- 10. Направи текст с огледален ефект. Пример: Hello | olleH