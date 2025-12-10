
SELECT event_name, 
FORMAT([start_date], 'dd.MM.yyyy')  AS starting_date,
FORMAT([start_date], 'hh:mm') AS starting_hour,
FORMAT([start_date], 'dddd, dd MMMM yyyy', 'bg-BG')
FROM Events

SELECT 
CONCAT_WS(', ', event_name, start_date, end_date)
AS all_in_one
FROM Events

SELECT FORMAT(23456788, 'N0');
SELECT FORMAT(11.23455, 'N2') -- до втория знак след десетичнта запетая

SELECT FORMAT(1500, 'C', 'BG');
SELECT FORMAT(1500, 'C', 'EN');

SELECT FORMAT(GETDATE(), 'dddd, dd MMMM yyyy', 'bg-BG');

SELECT FORMAT(0.256, 'P2');

SELECT FORMAT(1234.56432, 'N2', 'en-US');

SELECT CAST(GETDATE() AS NVARCHAR(20));
SELECT TRY_CAST('14.7328332562315' AS DECIMAL(5,2));

SELECT TRY_CONVERT(INT, '3425')
