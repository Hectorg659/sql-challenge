-- List the employee number, last name, first name, sex, and salary of each employee
SELECT s.emp_no, e.last_name, e.first_name, e.sex, s.salary FROM employees AS e
JOIN salaries AS s ON s.emp_no = e.emp_no

-- List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name, last_name, hire_date 
FROM employees
WHERE hire_date BETWEEN '01-01-1986' AND '01-01-1987'
ORDER BY hire_date ASC

-- List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
JOIN departments ON dept_manager.dept_no = departments.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT departments.dept_no, dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'

--List each employee in the Sales department, including their employee number, last name, and first name 
SELECT employees.first_name, employees.last_name, dept_emp.emp_no, departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales'

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT employees.first_name, employees.last_name, dept_emp.emp_no, departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name= 'Development'
ORDER BY emp_no ASC

--List the frequency counts, in descending order, of all the employee last names
SELECT employees.last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY last_name DESC

