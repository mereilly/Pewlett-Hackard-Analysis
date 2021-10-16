--Employee_Database_challenge
EAN
--Deliverable 1 

--Reteive cols from Employees table
SELECT e.emp_no, e.first_name, e.last_name,
	ti.title, ti.from_date, ti.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS ti
ON e.emp_no = ti.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp_no;

SELECT * FROM retirement_titles


SWAPNA

-- Deliverable 1: first query:
drop table if exists emp_titles;
select em.emp_no, 
	   em.first_name, 
	   em.last_name,
	   ti.title,
	   ti.from_date,
	   ti.to_date
into emp_titles
from employees as em
left join titles as ti
on em.emp_no = ti.emp_no
where (em.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by em.emp_no;




EAN
--Remove duplicate entries for previously held positions
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles


SWAPNA

-- Deliverable 1: second query
drop table if exists emp_distinct_titles;
select distinct on (emp_no) emp_no,
			    first_name,
			    last_name,
			    title
into emp_distinct_titles
from emp_titles
order by emp_no, to_date desc;



EAN

--Get list of unique titles
SELECT DISTINCT title
FROM unique_titles;
--https://www.w3schools.com/sql/sql_distinct.asp



--Create derivative table with unique titles and 
--count of occurrences in unique_titles
DROP TABLE retiring_titles;

CREATE TABLE retiring_titles AS
SELECT DISTINCT COUNT(ut.title), ut.title 
FROM unique_titles AS ut
GROUP BY ut.title
ORDER BY COUNT(ut.title) DESC;
--https://www.w3schools.com/sql/sql_create_table.asp

SELECT * FROM retiring_titles





SWAPNA
-- Deliverable 1: third query
drop table if exists retiring_titles;
select count(emp_no), 
       title
into retiring_titles
from emp_distinct_titles
group by title
order by count(emp_no) desc;




EAN

--Deliverable 2

SELECT DISTINCT ON(e.emp_no) e.emp_no, e.first_name, 
	e.last_name, e.birth_date,
	de.from_date, de.to_date,
	ti.title
INTO mentorship_eligibility
FROM employees AS e 
INNER JOIN dept_emp AS de
	ON e.emp_no = de.emp_no
INNER JOIN titles AS ti 
	ON e.emp_no = ti.emp_no 
WHERE de.to_date = '9999-01-01' AND 
e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY e.emp_no

SELECT * FROM mentorship_eligibility

--Additional data needed
CREATE TABLE mentorship_titles AS
SELECT DISTINCT COUNT(me.title), me.title 
FROM mentorship_eligibility AS me
GROUP BY me.title
ORDER BY COUNT(me.title) DESC;
--https://www.w3schools.com/sql/sql_create_table.asp

SELECT * FROM mentorship_titles;

--Extended mentorship elig
DROP TABLE ext_mentorship_eligibility;
DROP TABLE ext_mentorship_titles;

SELECT DISTINCT ON(e.emp_no) e.emp_no, e.first_name, 
	e.last_name, e.birth_date,
	de.from_date, de.to_date,
	ti.title
INTO ext_mentorship_eligibility
FROM employees AS e 
INNER JOIN dept_emp AS de
	ON e.emp_no = de.emp_no
INNER JOIN titles AS ti 
	ON e.emp_no = ti.emp_no 
WHERE de.to_date = '9999-01-01' AND  
e.birth_date BETWEEN '1960-01-01' AND '1965-12-31'
ORDER BY e.emp_no;

SELECT * FROM ext_mentorship_eligibility;

CREATE TABLE ext_mentorship_titles AS
SELECT DISTINCT COUNT(eme.title), eme.title 
FROM ext_mentorship_eligibility AS eme
GROUP BY eme.title
ORDER BY COUNT(eme.title) DESC;
--https://www.w3schools.com/sql/sql_create_table.asp

SELECT * FROM ext_mentorship_titles;





SWAPNA

-- Deliverable 2: first and only query
drop table if exists mentorship_eligibility;
select distinct on (em.emp_no) em.emp_no,
                               em.first_name,
	                           em.last_name,
	                           em.birth_date,
	                           de.from_date,
	                           de.to_date,
	                           ti.title
into mentorship_eligibility
from employees as em
left join dept_emp as de
on em.emp_no = de.emp_no
left join titles as ti
on em.emp_no = ti.emp_no
where (de.to_date = '9999-01-01') and
       (em.birth_date between '1965-01-01' and '1965-12-31')
order by em.emp_no;

