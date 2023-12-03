-- Data Analysis

-- 1. Employee Number, Last Name, First Name, Sex & Salary

SELECT employees.emp_no
    , employees.last_name
    , employees.first_name
    , employees.sex
    , salaries.salary
FROM employees
INNER JOIN salaries ON
    employees.emp_no = salaries.emp_no;
 
-- 2. Employees First Name, Last Name & Hire Date for Those Hired in 1986

SELECT first_name
    , last_name
    , hire_date
FROM employees
WHERE date_part('year', hire_date) = 1986;

-- 3. Managers: Department Number, Department Name, Employee Number, Last Name & First Name

SELECT dept_manager.dept_no
    , departments.dept_name
    , dept_manager.emp_no
    , employees.first_name
    , employees.last_name
FROM dept_manager
INNER JOIN departments ON
    dept_manager.dept_no = departments.dept_no
INNER JOIN employees ON
    dept_manager.emp_no = employees.emp_no;


-- 4. Department Number for Each Employee, Employee Number, Last Name, First Name, Department Name

SELECT dept_emp.dept_no
    , dept_emp.emp_no
    , employees.last_name
    , employees.first_name
    , departments.dept_name
FROM dept_emp
INNER JOIN employees ON
    dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON
    dept_emp.dept_no = departments.dept_no;


-- 5. First Name, Last Name & Sex for Each Employee Whose First Name is 'Hercules' & Last Name Starts with 'B'

SELECT first_name
    , last_name
    , sex
FROM employees
WHERE first_name = 'Hercules'
    AND last_name LIKE 'B%';


-- 6. Employees in the Sales Department with Employee Number, Last Name & First Name

SELECT employees.emp_no
    , employees.last_name
    , employees.first_name
FROM employees
INNER JOIN dept_emp ON
    employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
    departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales';

-- 7. Employees in the Sales & Development Departments with Employee Number, Last Name, First Name & Department Name

SELECT employees.emp_no
    , employees.last_name
    , employees.first_name
    , departments.dept_name
FROM employees
INNER JOIN dept_emp ON
    employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
    departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name IN ('Sales', 'Development');


-- 8. Frequency Count in Descending Order of all Employee Last Names

SELECT last_name
    , count(last_name)
FROM employees
GROUP BY last_name
ORDER BY count(last_name) DESC;
