-- List the following details of each employee: employee number, last name, first name, gender, and salary.
select distinct A.emp_no, A.last_name, A.first_name, A.gender, B.salary
from employees A
left join salaries B
on A.emp_no =B.emp_no


-- List employees who were hired in 1986.
select A.*
from employees A
where extract(year from hire_date) = '1986'


-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
select distinct A.dept_no, A.dept_name, C.emp_no, B.last_name, B.first_name, C.from_date, C.to_date
from departments A
left join dept_manager C
on A.dept_no = C.dept_no
left join employees B
on C.emp_no = B.emp_no


-- List the department of each employee with the following information: employee number, last name, first name, and department name.
select distinct A.emp_no, A.last_name, A.first_name, C.dept_name
from employees A
left join dept_emp B
on A.emp_no=B.emp_no
left join departments C
on C.dept_no=B.dept_no


-- List all employees whose first name is "Hercules" and last names begin with "B."
select *
from employees
where first_name='Hercules' and last_name like 'B%'


-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
select distinct A.emp_no, A.last_name, A.first_name, C.dept_name
from employees A
left join dept_emp B
on A.emp_no=B.emp_no
left join departments C
on C.dept_no=B.dept_no
where C.dept_name = 'Sales'


-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select distinct A.emp_no, A.last_name, A.first_name, C.dept_name
from employees A
left join dept_emp B
on A.emp_no=B.emp_no
left join departments C
on C.dept_no=B.dept_no
where C.dept_name = 'Sales' or C.dept_name ='Development'


-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(*)
from employees
group by last_name
order by 2 desc


