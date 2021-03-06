
-- FINAL SCHEMA AFTER TROUBLESHOOTING TO IMPORT CSVS, get the cascade order correct and consider what constraints made sense
-- CREATE SCHEMA or ALTER TABLE/SCHEMA can also be useful when writing a full schema
CREATE TABLE departments (
     dept_no VARCHAR(4) NOT NULL,
     dept_name VARCHAR(40) NOT NULL,
     PRIMARY KEY (dept_no)
);
 CREATE TABLE employees (
	emp_no int PRIMARY KEY, 
	birth_date date NOT NULL,
	first_name varchar NOT NULL,
	last_name varchar NOT NULL,
	gender varchar NOT NULL,
	hire_date date NOT NULL
	); 

CREATE TABLE titles (
 	emp_no int,	
 	title varchar, 
 	from_date date NOT NULL,
 	to_date date NOT NULL,
  	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)

  	);
  CREATE TABLE salaries (
    emp_no INT NOT NULL PRIMARY KEY,
    salary INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL
  );
   CREATE TABLE dept_emp (
   	emp_no int NOT NULL,
   	dept_no varchar NOT NULL,
  	 from_date date NOT NULL, 
   	to_date date NOT NULL,	
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
  );
  CREATE TABLE dept_manager (
  	dept_no varchar,
  	emp_no int NOT NULL PRIMARY KEY,
  	from_date date NOT NULL,
  	to_date date NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
  );
    	;


-- From original section of schema below
--   CREATE TABLE titles (
--   	emp_no int PRIMARY KEY,
--   	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
--   	from_date date NOT NULL,
--   	to_date date NOT NULL
--   );
--   CREATE TABLE salaries (
--     emp_no INT NOT NULL PRIMARY KEY,
--     salary INT NOT NULL,
--     from_date DATE NOT NULL,
--     to_date DATE NOT NULL,
--     FOREIGN KEY (emp_no) REFERENCES titles (emp_no)
--   );
--   CREATE TABLE dept_emp (
--   	emp_no int NOT NULL PRIMARY KEY,
--   	dept_no varchar NOT NULL ,
--   	from_date date NOT NULL, 
--   	to_date date NOT NULL,
--   	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
--   	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
--   	);
--   CREATE TABLE dept_manager (
--   dept_no varchar PRIMARY KEY,
--   emp_no int NOT NULL,
--   from_date date NOT NULL,
--   to_date date NOT NULL,
--   FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
--   	);