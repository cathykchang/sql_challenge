drop table if exists employees, dept_manager, dept_emp, departments, salaries, titles

CREATE TABLE employees (
    emp_no varchar   NOT NULL,
    emp_title_id varchar   NOT NULL,
    birth_date date   NOT NULL,
    first_name varchar   NOT NULL,
    last_name varchar   NOT NULL,
    sex varchar   NOT NULL,
    hire_date date   NOT NULL    
);

CREATE TABLE dept_manager (
    dept_no varchar   NOT NULL,
    emp_no varchar   NOT NULL
);

CREATE TABLE dept_emp (
    emp_no varchar   NOT NULL,
    dept_no varchar   NOT NULL
);

CREATE TABLE departments (
    dept_no varchar  NOT NULL,
    dept_name varchar   NOT NULL
);

CREATE TABLE salaries (
    emp_no varchar   NOT NULL,
    salary int   NOT NULL
);

CREATE TABLE titles (
    title_id varchar   NOT NULL,
    title varchar  NOT NULL
);


-- 1. List the following details of each employee:
-- employee number, last name, first name, sex, and salary.

select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees as e
inner join salaries as s on
e.emp_no = s.emp_no;


-- 2. List first name, last name, and hire date
-- for employees who were hired in 1986.

select first_name, last_name, hire_date
from employees
where extract(YEAR from (hire_date)) = 1986;


-- 3. List the manager of each department with the following information:
-- department number, department name, the manager's employee number, last name, first name.

select d.dept_no, d.dept_name, d_m.emp_no, e.last_name, e.first_name
from departments as d
inner join dept_manager as d_m on
d.dept_no = d_m.dept_no
inner join employees as e on
d_m.emp_no = e.emp_no;


-- 4. List the department of each employee with the following information:
-- employee number, last name, first name, and department name.

select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
inner join dept_emp as d_e on
e.emp_no = d_e.emp_no
inner join departments as d on
d.dept_no = d_e.dept_no;


-- 5. List first name, last name, and sex for employees
-- whose first name is "Hercules" and last names begin with "B."

select first_name, last_name, sex
from employees
where first_name = 'Hercules' and last_name like 'B%';


-- 6. List all employees in the Sales department, including their
-- employee number, last name, first name, and department name.

select * from departments;

-- Sales dept is dept_no d007

select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
inner join dept_emp as d_e on
e.emp_no = d_e.emp_no
inner join departments as d on
d.dept_no = d_e.dept_no
where d.dept_no = 'd007';


-- 7. List all employees in the Sales and Development departments,
-- including their employee number, last name, first name, and department name.

select * from departments;

-- Development dept is dept_no d005

select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
inner join dept_emp as d_e on
e.emp_no = d_e.emp_no
inner join departments as d on
d.dept_no = d_e.dept_no
where d.dept_no = 'd007' or d.dept_no = 'd005';


-- 8. List the frequency count of employee last names
-- (i.e., how many employees share each last name) in descending order.

select last_name, count(last_name) as "No. of Last Names"
from employees
group by last_name
order by "No. of Last Names" desc;




