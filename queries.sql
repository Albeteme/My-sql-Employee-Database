-- 1. List the following details of each employee: 
--		employee number, last name, first name, gender, and salary.
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.gender, sal.salary
FROM employees AS emp
	LEFT JOIN salaries AS sal ON sal.emp_no = emp.emp_no
ORDER BY emp.last_name ASC, emp.first_name ASC;

-- 2. List employees who were hired in 1986.
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.gender, sal.salary, emp.hire_date
FROM employees AS emp
	LEFT JOIN salaries AS sal ON sal.emp_no = emp.emp_no
WHERE emp.hire_date LIKE '1986%'
ORDER BY emp.last_name ASC, emp.first_name ASC;

-- 3. List the manager of each department with the following information: 
--		department number, department name, the manager's employee number, 
--		last name, first name, and start and end employment dates.
SELECT dept.dept_no, dept.dept_name, emp.emp_no, 
		emp.last_name, emp.first_name, emp.hire_date, man.to_date
FROM employees AS emp
	INNER JOIN dept_emp ON dept_emp.emp_no = emp.emp_no
	INNER JOIN departments AS dept ON dept.dept_no = dept_emp.dept_no
	INNER JOIN dept_manager AS man ON man.emp_no = emp.emp_no
WHERE man.to_date = '9999-01-01' -- Only current managers have this to_date
ORDER BY dept.dept_name ASC;

-- 4. List the department of each employee with the following information: 
--		employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM employees AS emp 
	INNER JOIN dept_emp ON dept_emp.emp_no = emp.emp_no
	INNER JOIN departments AS dept ON dept.dept_no = dept_emp.dept_no
WHERE dept_emp.to_date = '9999-01-01' -- Only employees currently in the department
ORDER BY dept.dept_name ASC, emp.last_name ASC, emp.first_name ASC;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules'
	AND last_name LIKE 'B%'
ORDER BY first_name ASC;

-- 6. List all employees in the Sales department, including their 
--		employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM employees AS emp
	INNER JOIN dept_emp ON dept_emp.emp_no = emp.emp_no
	INNER JOIN departments AS dept ON dept.dept_no = dept_emp.dept_no
WHERE dept.dept_no = 'd007'
	AND dept_emp.to_date = '9999-01-01' -- Only employees currently in the sales department
ORDER BY emp.last_name ASC, emp.first_name ASC;

-- 7. List all employees in the Sales and Development departments, including their 
--		employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM employees AS emp
	INNER JOIN dept_emp ON dept_emp.emp_no = emp.emp_no
	INNER JOIN departments AS dept ON dept.dept_no = dept_emp.dept_no
WHERE dept.dept_no IN ('d007', 'd005')
	AND dept_emp.to_date = '9999-01-01' -- Only employees currently in these departments
ORDER BY dept.dept_name ASC, emp.last_name ASC, emp.first_name ASC;

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(first_name) AS emp_count
FROM employees
GROUP BY last_name
ORDER BY last_name DESC;