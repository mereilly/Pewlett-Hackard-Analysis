SELECT * FROM departments;
DROP TABLE employees CASCADE;

-- Reference the Creating_Tables.sql file for more info on queries run during trouble shooting to create final schema 

select * from employees; 

-- Pewlett Hackard has a lot of employees getting ready to age out of the program. This is going to create a considerable amount of openings. Refine this list further by looking only at how many employees were born in 1952. Create another query that will search for only 1952 birth dates.

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')

-- Number of employees retiring -- -- result 41380
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');


-- putting info of employees that satisfy both conditions into new table called retirement_info using INTO

SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- inspecting new table
SELECT * FROM retirement_info;

-- then exporting this new table retirement_info that we generated to retirement_info.csv

