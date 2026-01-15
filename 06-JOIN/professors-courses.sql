-- INNER JOIN
SELECT 
	p.professor_id,
	p.full_name,
	c.course_name,
	c.credits
FROM Professors AS p
JOIN Courses AS c
	ON p.professor_id = c.professor_id

	-- LEFT JOIN
SELECT 
	p.professor_id,
	p.full_name,
	c.course_name,
	c.credits
FROM Professors p
LEFT JOIN Courses AS c
	ON p.professor_id = c.professor_id AND c.credits >= 5
WHERE c.credits IS NULL

-- RIGHT JOIN
SELECT 
	p.professor_id,
	p.full_name,
	c.course_name,
	c.credits
FROM Professors p
RIGHT JOIN Courses AS c
	ON p.professor_id = c.professor_id

	-- FULL JOIN
SELECT
	p.professor_id,
	p.full_name,
	c.course_name,
	c.credits
FROM Professors p
FULL JOIN Courses AS c
	ON p.professor_id = c.professor_id


SELECT * FROM Professors
SELECT * FROM Courses
SELECT * FROM Students_Exams
SELECT * FROM Exams
SELECT * FROM Students

SELECT 
	p.full_name	  AS Professor,
	c.course_name AS Course,
	e.exam_date   AS ExamsDate,
	s.first_name + ' ' + s.last_name AS Student,
	se.grade       AS Grade
FROM Professors p
JOIN Courses c
	ON c.professor_id = p.professor_id
JOIN Exams e
	ON e.course_id = c.course_id
LEFT JOIN Students_Exams se
	ON se.exam_id = e.exam_id
LEFT JOIN Students s
	ON s.student_id = se.student_id


