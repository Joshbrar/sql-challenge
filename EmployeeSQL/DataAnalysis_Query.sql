--select * from department_tbl;
-- select * from job_titles_tbl;
-- select * from employees_tbl;
--select * from emp_salary_tbl;
-- select * from dept_employees_tbl;
--select * from dept_manager_tbl;

--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
 select a.emp_no as "Employee No", a.l_name as "Last Name", a.f_name as "First Name" ,  
 Case when a.sex = 'M' then 'Male' when a.sex = 'F' then 'Female' else 'Other' end ,  concat('$  ',  b.amount) as "Salary" 
 from employees_tbl a ,emp_salary_tbl b
 where a.emp_no =b.emp_no order by a.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
select  a.f_name , a.l_name , a.hire_dt from  employees_tbl a where  EXTRACT(YEAR FROM a.hire_dt) = '1986' order by hire_dt asc;

--3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.

select a.dept_id as "Department No", a.dept_name as "Department Name" , b.emp_no "Manager''s Employee No" , c.l_name as "Manager''s Last Name", 
c.f_name as " Manager''s First Name" from department_tbl a, dept_manager_tbl b , employees_tbl c where 
a.dept_id =b.dept_id and b.emp_no =c.emp_no order by a.dept_name asc;

--4. List the department of each employee with the following information: employee number, last name, first name,
--and department name.
select a.emp_no as "Employee No" , a.l_name as "Last Name" , a.f_name as "First Name" , c.dept_name as "Department Name" from
employees_tbl a ,dept_employees_tbl b ,department_tbl c where a.emp_no = b.emp_no and b.dept_id = c.dept_id order by a.emp_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select a.f_name as "First Name" , a.l_name as "Last Name" , a.sex  from employees_tbl a where f_name like 'Hercules' and 
a.l_name like 'B%' order by a.l_name, a.sex;

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select a.emp_no as "Employee No", a.l_name as "last Name", a.f_name as "First Name" , c.dept_name  as "Department Name" 
from employees_tbl a , dept_employees_tbl b , department_tbl c
where  a.emp_no = b.emp_no and b.dept_id = c.dept_id and c.dept_name ='Sales' order by a.emp_no;

--7. List all employees in the Sales and Development departments, including their employee number, last name, 
-- first name, and department name.
select a.emp_no as "Employee No", a.l_name as "last Name", a.f_name as "First Name" , c.dept_name  as "Department Name" 
from employees_tbl a , dept_employees_tbl b , department_tbl c
where  a.emp_no = b.emp_no and b.dept_id = c.dept_id and c.dept_name in ('Sales', 'Development') order by c.dept_name;

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select a.l_name as "Last Name", count (a.l_name)   as "No of employees with same Last Name " from employees_tbl a group by a.l_name 
order by 2 desc;
