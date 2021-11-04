-- Deliverable 1
-- The Number of Retiring Employees by Title
SELECT em.emp_no,
em.first_name,
em.last_name,
tl.title,
tl.from_date,
tl.to_date 
INTO emp_title
FROM employees as em
INNER JOIN Titles AS tl
ON (em.emp_no = tl.emp_no)
WHERE (em.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY em.emp_no;

select * from Emp_Title;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) 
emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM emp_title
ORDER BY emp_no, to_date DESC;

select * from unique_titles;

-- Number of titles from the Unique Titles table.
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT DESC;

select * from retiring_titles;

--Deliverable 2
--Write a query to create a Mentorship Eligibility
SELECT DISTINCT ON (em.emp_no)
em.emp_no,
em.first_name,
em.last_name,
em.birth_date,
de.from_date,
de.to_date, 
tl.title
INTO mentorship_eligibilty
FROM employees as em
INNER JOIN dept_emp AS de
ON (em.emp_no = de.emp_no)
INNER JOIN titles AS tl
ON (em.emp_no = tl.emp_no)
WHERE (em.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND de.to_date = ('9999-01-01')
ORDER BY em.emp_no;

select * from mentorship_eligibilty;