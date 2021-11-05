--Challenge Script--

--Deliverable 1--
--Create a table from employees and title tables with DOB filter in acending order
select e.emp_no,
   	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
into retirement_titles
from employees as e
inner join titles as t
on e.emp_no = t.emp_no
where (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows and create unique_titles table
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

--Retrieve # of employess by most recent job title who about to retire
--Retrieve number of titles from unique titles table and create retiring_titles table
select count (title), title
--into retiring_titles
from  unique_titles
group by title
order by count (title) DESC

--Deliverable 2--

--Create a Mentorship Eligibility table that holds the employees 
--who are eligible to participate in a mentorship program
SELECT distinct on (e.emp_no) e.emp_no,
    e.first_name,
	e.last_name,
    e.birth_date,
 	de.from_date,
 	de.to_date,
 	t.title
INTO mentor_eligibile
FROM employees as e
inner join dept_emp as de
on (e.emp_no = de.emp_no) 
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
and de.to_date = ('9999-01-01')
order by e.emp_no
