-- Departments table
create table departments (
    dept_no varchar not null primary key,
    dept_name varchar not null
);
-- data imported from Data/departments.csv

-- Titles table
create table titles (
    title_id varchar not null primary key,
    title varchar not null
);
-- data imported from Data/titles.csv

-- Employees table
create table employees (
    emp_no int primary key,
    emp_title_id varchar not null,
    foreign key (emp_title_id) references titles(title_id),
    birth_date varchar not null,
    first_name varchar not null,
    last_name varchar not null,
    sex varchar not null,
    hire_date varchar not null
);
-- data imported from Data/employees.csv

-- Department employees table
create table dept_emp (
    emp_no int,
    foreign key (emp_no) references employees(emp_no),
    dept_no varchar not null,
    foreign key (dept_no) references departments(dept_no),
    primary key (emp_no, dept_no)
);
-- data imported from Data/dept_emp.csv

-- Deptartment managers table
create table dept_managers (
    dept_no varchar not null,
    foreign key (dept_no) references departments(dept_no),
    emp_no int primary key,
    foreign key (emp_no) references employees(emp_no)
);
-- data imported from Data/dept_managers.csv

-- Salaries table
create table salaries (
    emp_no int primary key,
    foreign key (emp_no) references employees(emp_no),
    salary int
);
-- data imported from Data/salaries.csv

