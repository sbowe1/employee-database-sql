-- Table with: employee number, last name, first name, sex, and salary
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees e
left join salaries s
    on  e.emp_no = s.emp_no;

-- Hired in 1986: first name, last name, and hire date
select first_name, last_name, hire_date
from employees
where right(hire_date, 4) = '1986'; 

-- Manager of department: department number, department name, manager's employee number, last name, and first name
select m.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
from dept_managers m
left join departments d
    on m.dept_no = d.dept_no
left join employees e
    on m.emp_no = e.emp_no;

-- Employee of department: employee number, last name, first name, department name
select de.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp de
left join departments d
    on de.dept_no = d.dept_no
left join employees e
    on de.emp_no = e.emp_no;

-- 'Hercules B_': first name, last name, and sex
select first_name, last_name, sex
from employees
where first_name = 'Hercules'
    and last_name like 'B%';

-- Sales department: employee number, last name, first name, and department name
-- first making a view of all sales employees/managers
create view sales as (
	select * from dept_managers
	where dept_no in 
	(
		select dept_no from departments
		where dept_name = 'Sales'
	)
	union
	select dept_no, emp_no from dept_emp
	where dept_no in 
	(
		select dept_no from departments
		where dept_name = 'Sales'
	)
);

select s.emp_no, e.last_name, e.first_name, d.dept_name
from sales s, employees e, departments d
where s.emp_no = e.emp_no
	and s.dept_no = d.dept_no;

-- Sales and Development department: employee number, last name, first name, and department name
-- first making a view of all sales and development employees/managers
create view sales_dev as (
	select * from dept_managers
	where dept_no in 
	(
		select dept_no from departments
		where dept_name in ('Sales', 'Development')
	)
	union
	select dept_no, emp_no from dept_emp
	where dept_no in 
	(
		select dept_no from departments
		where dept_name in ('Sales', 'Development')
	)
);

select s.emp_no, e.last_name, e.first_name, d.dept_name
from sales_dev s, employees e, departments d
where s.emp_no = e.emp_no
	and s.dept_no = d.dept_no;

-- Frequency count of employee last names in descending order
select last_name, count(last_name) "Last Name Count"
from employees
group by last_name
order by "Last Name Count" desc;