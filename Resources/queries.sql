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

SELECT departments.dept_no AS "Department Number", departments.dept_name AS "Department Name", dept_manager.emp_no AS "Employee Number", employees.first_name AS "First Name", employees.last_name AS "Last Name", dept_manager.from_date AS "Start Date", dept_manager.to_date AS "End Date"
FROM dept_manager
INNER JOIN departments ON
departments.dept_no = dept_manager.dept_no
INNER JOIN employees ON
dept_manager.emp_no = employees.emp_no

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.