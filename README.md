# sql-challenge: Employee Database
The six CSV files - located in the Data folder - were imported into individual SQL tables so that questions could be answered based on the information held. 

## Data Modeling
An ERD (entity relationship diagram) was created to illustrate how each of the entities, represented by singular CSV files, relate to each other. The ERD was created using [Quick Database Diagrams](http://www.quickdatabasediagrams.com). 

![ERD](../blob/main/EmployeeSQL/EmployeeERD.png) 

Under each entity, column names are listed along with their corresponding data types. Lines between entities demonstrate how specific columns are interconnected.

## Data Engineering 
A table schema was created for each of the six CSV files, marking all data types, primary keys, and foreign keys. In cases where no columns were unique, a composite key was created so that each row is uniquely identifiable. Once each skeleton table was assembled, data was imported from the CSV files.

All table schemas are available in the [schema file](../blob/main/EmployeeSQL/table_schema.sql). 

## Data Analysis
The following queries were made in the [analysis file](../blob/main/EmployeeSQL/employee_analysis.sql):

1. Employee number, last name, first name, sex, and salary
2. Hired in 1986: first name, last name, and hire date
3. Manager of each department: department number, department name, manager's employee number, last name, and first name
4. Employees of each department: employee number, last name, first name, and department name
5. First name "Hercules" and last name beginning with "B": first name, last name, and sex
6. In the Sales department: employee number, last name, first name, and department name
7. In the Sales and Development departments: employee number, last name, first name, and department name
8. Frequency of employee last names in descending order

## Bonus: Using Pandas
After importing the SQL database into Pandas, two charts were made in the [bonus file](../blob/main/EmployeeSQL/bonus.ipynb). 

The first chart, a histogram, visualizes the frequency of the most common salary ranges for employees. With a mimimum salary of $40,000 and maximum salary of just under $130,000, the salary ranges were broken up into $40-50k, $50-60k, $60-100k, and $100-130k. 

The second chart, a bar chart, depicts the average salary by job title. 