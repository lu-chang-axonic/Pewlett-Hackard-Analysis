--Deliverable #1

DROP TABLE titles;

-- Creating tables for PH-EmployeeDB
CREATE TABLE titles (
    emp_no INT NOT NULL, 
	title VARCHAR(40) NOT NULL,
    from_date DATE NOT NULL,
	to_date DATE NOT NULL,
 FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
  	);
-- Check Data
SELECT *
FROM retirment_title;

DROP TABLE retirment_title;

-- Create a table
SELECT e.emp_no,
		e.first_name,
		e.last_name,
		t.title,
		t.from_date,
		t.to_date
INTO retirment_title
FROM employees as e
INNER JOIN titles as t
ON e.emp_no=t.emp_no
WHERE (e.birth_date BETWEEN '1951-01-01' AND '1955-12-31')
AND (t.to_date='9999-01-01')
ORDER BY e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
DROP TABLE unique_titles;

SELECT DISTINCT ON (emp_no) first_name,
last_name,
title
INTO unique_titles
FROM retirment_title
ORDER BY emp_no, from_date DESC;

-- Employees by recent job title who are about to retire
DROP TABLE retiring_title;

SELECT COUNT(first_name), title
INTO retiring_title
FROM unique_titles
GROUP BY title
ORDER BY COUNT(first_name) DESC;

--Deliverable #2

DROP TABLE dept_emp;

-- Creating Department Employee table
CREATE TABLE dept_emp (
    emp_no INT NOT NULL, 
	dept_no VARCHAR (10) NOT NULL,
    from_date DATE NOT NULL,
	to_date DATE NOT NULL,
 FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
 FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
 PRIMARY KEY (emp_no, dept_no)	
  	);
-- Check Data
SELECT *
FROM dept_emp;

-- Retrieve Data
DROP TABLE mentorship_eligibility;

SELECT DISTINCT ON (e.emp_no)
		e.emp_no,
		e.first_name,
		e.last_name,
		e.birth_date,
		de.from_date,
		de.to_date,
		t.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON e.emp_no=de.emp_no
INNER JOIN titles as t
ON e.emp_no=t.emp_no
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date='9999_01_01')
ORDER BY e.emp_no;

--Check Data
Select *
FROM mentorship_eligibility;

--Additional Query 1 -- To screen out retiring employees with a senior position
DROP TABLE senior_retiring;

SELECT COUNT(emp_no),
			title
INTO senior_retiring
FROM retirment_title
WHERE (title='Senior Engineer')
OR (title='Manager')
OR (title='Technique Leader')
OR (title='Senior Staff')
GROUP BY title;

Select *
FROM senior_retiring;


--Additional Query 2 -- To screen out mentorship eligible employees who are already in a senior position
DROP TABLE junior_mentee;

SELECT COUNT(emp_no),
			title
INTO junior_mentee
FROM mentorship_eligibility
WHERE (title='Assistant Engineer')
OR (title='Engineer')
OR (title='Staff')
GROUP BY title;

Assistant Engineer
Engineer
Senior Engineer
Senior Staff
Staff
Technique Leader


Select *
FROM junior_mentee;
