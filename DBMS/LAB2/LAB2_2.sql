use iiitdm;
create table student(student_id varchar(10),first_name varchar(10) not null,last_name varchar(10) not null,parent_name varchar(20),age int not null,primary key(student_id));
create table faculty(faculty_id varchar(10),Name varchar(50) not null,age int not null,department varchar(25) not null,Date_of_joining date  ,primary key(Faculty_id));
create table building(Building_name varchar(25) not null,building_id varchar(10),capacity_of_student int not null,no_of_floors int not null,Date_of_inauguration date ,primary key(building_id));
insert into student(student_id,first_name,last_name,parent_name,age) values('CS109','Nischal','Vaddadi','Lakshmi',17);
insert into student(student_id,first_name,last_name,parent_name,age) values('CS110','Piyush','Gupta','Satya',18);
insert into student(student_id,first_name,last_name,parent_name,age) values('EC009','Praveen','Mukthi','Venkat',19);
insert into student(student_id,first_name,last_name,parent_name,age) values('EC047','Madhav','SNV','Srinu',18);
insert into student(student_id,first_name,last_name,parent_name,age) values('CS119','Dheeraj','Kumar','Lakshman',20);
insert into student(student_id,first_name,last_name,parent_name,age) values('CS113','Manavanth','Mula','Ram',21);
insert into student(student_id,first_name,last_name,parent_name,age) values('ME072','Raj','Gopal','Singh',18);
insert into student(student_id,first_name,last_name,parent_name,age) values('ME085','Ravindar','Gulugothu','Raghava',22);
insert into student(student_id,first_name,last_name,parent_name,age) values('CS047','Madhav','Tadavarthi','Raghu',18);
insert into student(student_id,first_name,last_name,parent_name,age) values('CS005','Sasank','Madati','Venkateshwarlu',17);
select * from student;
insert into faculty(faculty_id,Name,age,department) values('F000','Sadagopan',35,'CS');
insert into faculty(faculty_id,Name,age,department) values('F001','Masilamani',55,'CS');
insert into faculty(faculty_id,Name,age,department) values('F002','Tapas',40,'EC');
insert into faculty(faculty_id,Name,age,department) values('F003','Bingi',45,'DS');
insert into faculty(faculty_id,Name,age,department) values('F004','Sudhir',50,'DS');
insert into faculty(faculty_id,Name,age,department) values('F005','Rahul',35,'CS');
insert into faculty(faculty_id,Name,age,department) values('F006','Jagadeesh',47,'CS');
insert into faculty(faculty_id,Name,age,department) values('F007','Umarani',46,'CS');
insert into faculty(faculty_id,Name,age,department) values('F008','Subin',30,'CS');
insert into faculty(faculty_id,Name,age,department) values('F009','Gurunathan',48,'ME');
select * from faculty;
update faculty set Date_of_joining='2022-01-24';
insert into building(Building_name,building_id,capacity_of_student,no_of_floors) values('Ashoka','B00',1200,12);
insert into building(Building_name,building_id,capacity_of_student,no_of_floors) values('Jasmine','B01',500,5);
insert into building(Building_name,building_id,capacity_of_student,no_of_floors) values('Ashwatha','B02',1000,10);
insert into building(Building_name,building_id,capacity_of_student,no_of_floors) values('Banyan','B03',350,1);
update building set Date_of_inauguration='2022-01-24';
select * from building;
alter table student add department varchar(25) not null;
update student set department='Computer';
insert into student(student_id,first_name,last_name,parent_name,age,department) values('CS132','Raghu','Pathi','Lakshmi',18,'Physics');
insert into student(student_id,first_name,last_name,parent_name,age,department) values('CS133','Siddarth','Shukla','Satya',19,'Physics');
insert into student(student_id,first_name,last_name,parent_name,age,department) values('CS134','Salman','Khan','Venkat',20,'Physics');
insert into student(student_id,first_name,last_name,parent_name,age,department) values('MED130','Sachin','Reddy','Srinu',19,'Maths');
insert into student(student_id,first_name,last_name,parent_name,age,department) values('MED131','Pravin','Rathore','Lakshman',21,'Maths');
insert into faculty(faculty_id,Name,age,department,Date_of_joining) values('F010','Sadagopan A ',35,'CS','2022-07-24');
insert into faculty(faculty_id,Name,age,department,Date_of_joining) values('F011','Sadagopan B',36,'CS','2022-07-24');
insert into faculty(faculty_id,Name,age,department,Date_of_joining) values('F012','Sadagopan C',37,'CS','2022-07-24');
insert into faculty(faculty_id,Name,age,department,Date_of_joining) values('F013','Sadagopan D',38,'CS','2022-07-24');
insert into faculty(faculty_id,Name,age,department,Date_of_joining) values('F014','Sadagopan E',39,'CS','2022-07-24');
insert into faculty(faculty_id,Name,age,department,Date_of_joining) values('F015','Sadagopan F',35,'CS','2022-07-24');
insert into faculty(faculty_id,Name,age,department,Date_of_joining) values('F016','Tapas A',40,'EC','2022-07-24');
insert into faculty(faculty_id,Name,age,department,Date_of_joining) values('F017','Tapas B',40,'EC','2022-07-24');
insert into faculty(faculty_id,Name,age,department,Date_of_joining) values('F018','Tapas C',40,'EC','2022-07-24');
insert into faculty(faculty_id,Name,age,department,Date_of_joining) values('F019','Tapas D',40,'EC','2022-07-24');
update faculty set department='ME' where department='EC' and Date_of_joining='2022-07-24';
insert into faculty(faculty_id,Name,age,department,Date_of_joining) values('F020','Rahul A',35,'EC','2022-10-24');
insert into faculty(faculty_id,Name,age,department,Date_of_joining) values('F021','Rahul B',35,'EC','2022-10-24');
insert into faculty(faculty_id,Name,age,department,Date_of_joining) values('F022','Rahul C',35,'EC','2022-10-24');
insert into faculty(faculty_id,Name,age,department,Date_of_joining) values('F023','Rahul D',35,'EC','2022-10-24');
insert into faculty(faculty_id,Name,age,department,Date_of_joining) values('F024','Rahul E',35,'EC','2022-10-24');
delete from building where Building_id='B03';
delete from student where department='Maths' or department='Physics';
alter table student add percent int not null;
update student set percent=90;
insert into student(student_id,first_name,last_name,parent_name,age,department,percent) values('CS135','Shreyas','Pathi','Lakshmi',18,'Physics',99);
insert into student(student_id,first_name,last_name,parent_name,age,department,percent) values('CS136','Ram','Kumar','Lakshmi',19,'Computer',99);
insert into student(student_id,first_name,last_name,parent_name,age,department,percent) values('CS137','Ravi','Kumar','Lakshmi',19,'Physics',99);
insert into student(student_id,first_name,last_name,parent_name,age,department,percent) values('CS138','Virat','Kohli','Lakshmi',19,'Maths',99);
insert into student(student_id,first_name,last_name,parent_name,age,department,percent) values('CS139','Dhoni','Mahendra','Lakshmi',19,'Physics',99);
insert into student(student_id,first_name,last_name,parent_name,age,department,percent) values('CS140','Deepak','Chahar','Lakshmi',19,'Computer',99);
insert into student(student_id,first_name,last_name,parent_name,age,department,percent) values('CS141','Kumar','Naga','Lakshmi',19,'Physics',99);
insert into student(student_id,first_name,last_name,parent_name,age,department,percent) values('CS142','Srinu','Vaitla','Lakshmi',19,'Maths',99);
insert into student(student_id,first_name,last_name,parent_name,age,department,percent) values('CS143','Yash','Agarwal','Lakshmi',19,'Computer',99);
insert into student(student_id,first_name,last_name,parent_name,age,department,percent) values('CS144','Raghu','Singh','Lakshmi',19,'Maths',99);
alter table building drop Date_of_inauguration;
alter table building add staff_id int not null;