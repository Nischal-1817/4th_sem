use lab4;
create table Employees(Employee_id int primary key,First_name varchar(20) not null,Last_name varchar(20) not null,Salary int not null,Joining_date date not null,Department varchar(20));
insert into Employees(Employee_id,First_name,Last_name,Salary,Joining_date,Department) values(1,'Boby','Rathod',1000000,'2020-12-20','Finance');
insert into Employees(Employee_id,First_name,Last_name,Salary,Joining_date,Department) values(2,'Jasmin','Jose',6000000,'2015-02-07','IT');
insert into Employees(Employee_id,First_name,Last_name,Salary,Joining_date,Department) values(3,'Pratap','Mathew',8900000,'2014-03-09','Banking');
insert into Employees(Employee_id,First_name,Last_name,Salary,Joining_date,Department) values(4,'John','Michel',2000000,'1999-03-17','Insurance');
insert into Employees(Employee_id,First_name,Last_name,Salary,Joining_date,Department) values(5,'Alex','Kinto',2200000,'1987-02-25','Finance');
insert into Employees(Employee_id,First_name,Last_name,Salary,Joining_date,Department) values(6,'Jaswanth','Kumar',1230000,'2021-07-23','IT');
select * from Employees;
select * from employees where Salary between 2000000 and 5000000;/*selecting those with salary between that range*/
select Last_name from employees where TIMESTAMPDIFF(YEAR,Joining_date,CURDATE())>3 and First_name like '%a%' ;/*if not case-sensitive*/
select Last_name from employees where TIMESTAMPDIFF(YEAR,Joining_date,CURDATE())>3 and First_name like binary '%a%' ;/*for case-sensitive*/
select Joining_date from employees where Department='IT' and Salary>(select avg(Salary) from employees);/*displaying joining_date whose salary>avg(salary)*/
select * from employees where Department='Finance' and Salary<(select avg(Salary) from employees where Department='IT');