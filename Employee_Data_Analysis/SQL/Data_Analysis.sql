1. List the following details of each employee: employee number, last name, first name, gender, and salary.

select e.emp_no as "employee number",
first_name as "first name",
last_name as "last name",
gender ,
salary
from employees e
join salaries s
on e.emp_no=s.emp_no;

2. List employees who were hired in 1986.

select * from employees where date_part('year',hire_date) = '1986';

3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

select dept.dept_no as "Department No",
dept.dept_name as "Department Name",
dept_mgr.emp_no as "Manager Employee No",
emp.last_name as "last name",
emp.first_name as "first name",
dept_mgr.from_date as "employment start date",
dept_mgr.to_date as "employment end date"
from departments dept
join dept_manager dept_mgr on dept.dept_no=dept_mgr.dept_no
join employees emp on emp.emp_no=dept_mgr.emp_no;

4. List the department of each employee with the following information: employee number, last name, first name, and department name.

select  dept_emp.emp_no as "Employee No",
emp.last_name as "Last Name", 
emp.first_name as "First Name",
dept.dept_name as "Department Name"
from dept_emp as dept_emp
join departments as dept on dept_emp.dept_no=dept.dept_no
join employees emp on emp.emp_no=dept_emp.emp_no;

5. List all employees whose first name is "Hercules" and last names begin with "B."
select * from employee
where first_name='Hercules' and last_name like 'B%'

6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

select 
emp.emp_no as "Employee No", 
emp.last_name as "Last Name", 
emp.first_name as "First Name", 
dept.dept_name as "department name"
from dept_emp as dept_emp
join departments as dept on dept_emp.dept_no=dept.dept_no
join employees e on emp.emp_no=dept_emp.emp_no
where dept.dept_name='Sales';

7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

select 
emp.emp_no as "Employee No", 
emp.last_name as "Last Name", 
emp.first_name as "First Name", 
dept.dept_name as "department name"
from dept_emp as dept_emp
join departments as dept on dept_emp.dept_no=dept.dept_no
join employees emp on emp.emp_no=dept_emp.emp_no
where dept.dept_name='Sales' or dept.dept_name='Development';

8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

select last_name,count(last_name) as "Employee Last Names Count"
from employees
group by last_name
order by "Employee Last Names Count" desc;