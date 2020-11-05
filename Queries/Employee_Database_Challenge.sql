-- DELIVERABLE 1
--Retrieve info from Employees table
SELECT e.emp_no, e.first_name, e.last_name
FROM employees as e

--Retrieve info from Titles table
SELECT title, from_date, to_date
FROM titles

--Create Retirement Titles table
SELECT e.emp_no, e.first_name, e.last_name, ti.title, ti.from_date, ti.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti 
ON e.emp_no = ti.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no

-- Use Distinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

-- Create retiring titles table
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;



-- DELIVERABLE 2
--Retrieve info from Employees table
SELECT e.emp_no, e.first_name, e.last_name, e.birth_date
FROM employees as e

--Retrieve info from Department Employee Table
SELECT de.from_date, de.to_date
FROM dept_emp as de

--Retrieve info from Titles table
SELECT ti.title
FROM titles as ti

-- Create Mentorship Eligibility Table
SELECT DISTINCT ON (e.emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
ti.title

INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON (de.emp_no = e.emp_no)
INNER JOIN titles as ti
ON (ti.emp_no = e.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no, de.to_date ASC;