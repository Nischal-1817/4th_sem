use iiit;
create table if not exists Employees(employee_id  int,first_name varchar(255),last_name varchar(255),email varchar(255) not null,phone_number int,hire_date varchar(255) not null,job_id varchar(255),salary int,manager_id int,department_id int,primary key(employee_id,phone_number,job_id));
insert into Employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,department_id) values(700,'Hasmukh','Patel','hp@gmail.com',6516516,'15-aug-2021','Hp003',7000,90);
insert into Employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) values(800,'Kamalesh','Paul','kp@gmail.com',700321617,'17-feb-2021','Kp 004',8000,506,90);
insert into Employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) values(900,'Dinesh','Gandhi','dp@yahoo',12312312,'19-march-2120','Dg006',20000,508,80);
insert into Employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,department_id) values(701,'Suresh','Modi','sm@dg.com',45645656,'20-april-2015','Sm009',15000,80);
select employee_id,manager_id,first_name,last_name from Employees