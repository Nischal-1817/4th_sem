use lab6;
create table faculty(faculty_id varchar(10) primary key,faculty_name varchar(25) not null,department varchar(10) not null, subject varchar(25) not null);
insert into Faculty(Faculty_id,Faculty_name,Department,Subject) values('F001','Sadagopan','CS','DAA');
insert into Faculty(Faculty_id,Faculty_name,Department,Subject) values('F002','Jagadeesh','CS','DBMS');
insert into Faculty(Faculty_id,Faculty_name,Department,Subject) values('F003','Gurunathan','DS','Materials');
insert into Faculty(Faculty_id,Faculty_name,Department,Subject) values('F004','RPP','CS','DSA');
insert into Faculty(Faculty_id,Faculty_name,Department,Subject) values('F005','Rahul','EC','COA');
create table building(building_name varchar(10) not null,room_no int not null,floor int not null);
insert into Building(Building_name,Room_no,Floor) values('Ashoka',30,1);
insert into Building(Building_name,Room_no,Floor) values('Ashoka',140,2);
insert into Building(Building_name,Room_no,Floor) values('Ashoka',202,3);
insert into Building(Building_name,Room_no,Floor) values('Banyan',210,3);
insert into Building(Building_name,Room_no,Floor) values('Banyan',30,1);
insert into Building(Building_name,Room_no,Floor) values('Jasmine',30,1);
insert into Building(Building_name,Room_no,Floor) values('Jasmine',415,5);
create table course (department varchar(10) not null,subject varchar(25) not null,course_id varchar(10) not null);
insert into Course(department,subject,Course_id) values('CS','DBMS','CS1002');
insert into Course(department,subject,Course_id) values('CS','DAA','CS1003');
insert into Course(department,subject,Course_id) values('DS','Materials','DS002');
insert into Course(department,subject,Course_id) values('CS','DSA','CS003');
insert into Course(department,subject,Course_id) values('EC','COA','EC001');
insert into Course(department,subject,Course_id) values('ME2','Video Editing','EL006');
create table student(student_id  varchar(10) primary key,student_name varchar(25) not null,department varchar(5) not null,course_id varchar(10) not null,building_name varchar(25),room_no int not null);
insert into student values('CS20B1109','Nischal','CS','CS1002','Ashoka',30);
insert into student values('CS20B1005','Sasank','CS','CS1002','Banyan',30);
insert into student values('EC20B1044','Avinash','EC','EC001','Ashoka',140);
insert into student values('ME201022','Lakshmi','ME2','EL006','Jasmine',30);
insert into student values('CS20B1006','Sravanth','CS','CS1003','Ashoka',202);
insert into student values('CS20B1075','Jitin','CS','CS003','Banyan',210);
create table iiitdm(faculty_name varchar(25) not null,student_id varchar(10),building_name varchar(10) not null,foreign key(student_id) references student(student_id));
insert into iiitdm values('Jagadeesh','CS20B1109','Ashoka');
insert into iiitdm values('Jagadeesh','CS20B1005','Banyan');
insert into iiitdm values('Rahul','EC20B1044','Ashoka');
insert into iiitdm values('Sadagopan','CS20B1006','Ashoka');
insert into iiitdm values('RPP','CS20B1075','Banyan');
select iiitdm.student_id from iiitdm inner join student on iiitdm.student_id=student.student_id where faculty_name='Jagadeesh' and room_no=30;/*1st question using join*/
select course_id from student where room_no=140 and building_name='Ashoka';/*2nd question (selecting courses of a particular student*/
select faculty_name from faculty where faculty_name not in (select faculty_name from iiitdm where student_id='CS20B1109');/*3rd question(selecting all those faculties who doesn't teach a student*/
select course_id from student where room_no in(select room_no from building where floor=3);/*4th question using subquery(selecting the courses which are taught to those who live in floor 3*/
select course_id from student inner join building on student.room_no=building.room_no where floor=3;/*4th question using join*/