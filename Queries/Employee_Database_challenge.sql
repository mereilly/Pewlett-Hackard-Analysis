-- The DISTINCT ON statement is used specifically with PostgreSQL databases. With the DISTINCT ON statement, you can retrieve a single row defined by the ON () clause. The row that is returned is specified by the ORDER BY clause.


-- -- Use Dictinct with Orderby to remove duplicate rows
-- SELECT DISTINCT ON (______) _____,
-- ______,
-- ______,
-- ______

-- INTO nameyourtable
-- FROM _______
-- ORDER BY _____, _____ DESC;


-- Deliverable 1
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

-- Deliverable 1
drop table if exists emp_distinct_titles;
select distinct on (emp_no) emp_no,
			    first_name,
			    last_name,
			    title
into emp_distinct_titles
from emp_titles
order by emp_no, to_date desc;

drop table if exists retiring_titles;
select count(emp_no), 
       title
into retiring_titles
from emp_distinct_titles
group by title
order by count(emp_no) desc;

-- Deliverable 2
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




-- export table called mentorship_eligibility to Data/mentorship_eligibilty.csv