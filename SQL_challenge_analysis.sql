-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT 
	ep.emp_no,
	ep.last_name,
	ep.First_name,
	ep.sex, 
	sal.salary
FROM employees as ep 
INNER JOIN Salaries as sal
ON (ep.emp_no = sal.emp_no);

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT
	ep.last_name,
	ep.First_name,
	ep.hire_date
FROM employees as ep 
Where ep.hire_date 
BETWEEN '1986-01-01' AND '1987-01-01'

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
Select 
	d.dept_no, 
	d.dept_name,
	dm.emp_no,
	ep.last_name,
	ep.first_name
FROM employees as ep 
JOIN dept_manager as dm 
ON ep.emp_no = dm.emp_no  
JOIN departments as d 
ON d.dept_no = dm.dept_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT 
	de.dept_no,
	d.dept_name,
	ep.emp_no ,
	ep.last_name,
	ep.first_name
FROM employees as ep 
JOIN dept_emp as de
ON ep.emp_no = de.emp_no
JOIN departments as d
ON de.dept_no = d.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT 
	first_name,
	last_name,
	sex
FROM employees 
Where first_name = 'Hercules' 
and last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT 
	de.emp_no,
	ep.last_name,
	ep.first_name
FROM departments as d
JOIN dept_emp as de 
ON de.dept_no = d.dept_no 
JOIN employees as ep 
ON de.emp_no = ep.emp_no
WHERE d.dept_name = 'Sales';
-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
Select 
	d.dept_name,
	de.emp_no,
	e.last_name,
	e.first_name 
FROM departments as d 
JOIN dept_emp as de 
ON d.dept_no = de.dept_no
JOIN employees as e 
ON e.emp_no = de.emp_no
WHERE d.dept_name ='Sales' or d.dept_name = 'Development';

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT 
	last_name,
	COUNT(last_name)
FROM Employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
