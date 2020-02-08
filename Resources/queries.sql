--Data Analysis

--List the following details of each employee: employee number, last name, first name, gender, and salary
SELECT employees.emp_no AS "Employee Number", employees.last_name AS "Last Name", employees.first_name AS "First Name", employees.gender AS "Gender", salaries.salary AS "Salary"
FROM salaries 
INNER JOIN employees ON
employees.emp_no=salaries.emp_no;

--List employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name, 
--and start and end employment dates

SELECT departments.dept_no AS "Department Number", departments.dept_name AS "Department Name", dept_manager.emp_no AS "Employee Number", employees.first_name AS "Manager First Name", employees.last_name AS "Manager Last Name", dept_manager.from_date AS "Start Date", dept_manager.to_date AS "End Date"
FROM dept_manager
INNER JOIN departments ON
departments.dept_no = dept_manager.dept_no
INNER JOIN employees ON
dept_manager.emp_no = employees.emp_no;

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

SELECT dept_emp.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM departments
LEFT JOIN dept_emp
ON dept_emp.dept_no = departments.dept_no
LEFT JOIN employees
ON dept_emp.emp_no = employees.emp_no;

--List all employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT departments.dept_name, dept_emp.emp_no, employees.first_name, employees.last_name
FROM departments
LEFT JOIN dept_emp
ON dept_emp.dept_no = departments.dept_no
LEFT JOIN employees
ON dept_emp.emp_no = employees.emp_no
WHERE dept_name = 'Sales';

--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM dept_emp;

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM departments
LEFT JOIN dept_emp
ON dept_emp.dept_no = departments.dept_no
LEFT JOIN employees
ON dept_emp.emp_no = employees.emp_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

--In descending order, list the frequency count of employee last 
--names, i.e., how many employees share each last name.

SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
