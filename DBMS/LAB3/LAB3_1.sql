use dblab1;
create table Student(
RollNo char(8) primary key,SName varchar(20) not null,Gender char(1) not null,City varchar(20)); 
create table Course(
CCode char(5) primary key,CName varchar(20) not null,Credit smallint not null);
create table Enrolled(RollNo char(8) ,CCode char(5) ,
foreign key(RollNo) references Student(RollNo),foreign key(CCode) references Course(CCode),YoE int not null);
alter table Course add column CType varchar(20) not null; /*a)addding Ctype and email for 1st bit*/
alter table Student add column Email varchar(30);
insert into Student(RollNo,SName,Gender,City,Email) values('1901CS99','Arun Avasthi','M','Jaipur','1901cs99@gmail.com');
insert into Student(RollNo,SName,Gender,City,Email) values('2020CS01','Prasad Ravi','M','Hyderbad','2020cs01@yahoo.com');
insert into Student(RollNo,SName,Gender,City,Email) values('2018EC01','Srinidhi','F','Delhi','2018ec01@gmail.com');
insert into Student(RollNo,SName,Gender,City,Email) values('2019ME01','Lahari','F','Delhi','2019me01@yahoo.com');
insert into Student(RollNo,SName,Gender,City,Email) values('2020CS02','Meghana','F','Vijayawada','2020cs02@gmail.com');
insert into Student(RollNo,SName,Gender,City,Email) values('2020EC02','Nischal','M','Chandigarh','2020ec02@yahoo.com');
insert into Course(CCode,CName,Credit,CType) values('CS100','Materials',1,'Elective');
insert into Course(CCode,CName,Credit,CType) values('CS201','DSA',2,'Core');
insert into Course(CCode,CName,Credit,CType) values('CS502','DSCS',5,'Open Elective');
insert into Course(CCode,CName,Credit,CType) values('EC500','Circuits',5,'Core');
insert into Course(CCode,CName,Credit,CType) values('EC501','Design',5,'Elective');
insert into Course(CCode,CName,Credit,CType) values('ME300','AutoCad',3,'Elective');
insert into Course(CCode,CName,Credit,CType) values('ME401','Machines',4,'Core');
insert into Course(CCode,CName,Credit,CType) values('CS503','DBMS',5,'Core');
insert into Enrolled(RollNo,CCode,YoE) values('1901CS99','CS100',1901);
insert into Enrolled(RollNo,CCode,YoE) values('1901CS99','CS201',1901);
insert into Enrolled(RollNo,CCode,YoE) values('1901CS99','ME300',1901);
insert into Enrolled(RollNo,CCode,YoE) values('1901CS99','EC500',1901);
insert into Enrolled(RollNo,CCode,YoE) values('1901CS99','CS503',1901);
insert into Enrolled(RollNo,CCode,YoE) values('2020CS01','CS100',2020);
insert into Enrolled(RollNo,CCode,YoE) values('2020CS01','CS201',2020);
insert into Enrolled(RollNo,CCode,YoE) values('2020CS01','ME300',2020);
insert into Enrolled(RollNo,CCode,YoE) values('2020CS01','EC500',2020);
insert into Enrolled(RollNo,CCode,YoE) values('2019ME01','CS100',2020);
insert into Enrolled(RollNo,CCode,YoE) values('2019ME01','CS201',2020);
insert into Enrolled(RollNo,CCode,YoE) values('2019ME01','ME300',2020);
insert into Enrolled(RollNo,CCode,YoE) values('2019ME01','ME401',2020);
insert into Enrolled(RollNo,CCode,YoE) values('2020CS02','CS100',2021);
insert into Enrolled(RollNo,CCode,YoE) values('2018EC01','ME300',2018);
insert into Enrolled(RollNo,CCode,YoE) values('2020EC02','EC500',2020);
select CName from Course where CCode like 'CS%';/*b)selecting courses where ccode starts with cs*/
select SName from student where SName like '%a%a%' and Gender='M';/*c)selecting students whose name has atleast two a's and gender is male*/
select * from student where RollNo not between '2018%' and '2020%';/*d)selecting students who doesn't belong b/w 2018 and 2019*/
select * from course where Credit=(select min(Credit) from course);/*e)selecting course which has least credit*/
select CName,CCode from course where CCode not in(select CCode from enrolled where yoe=2020);/*f)selecting course which was not taken in 2020*/
select city,count(city) from student group by city;/*g)counting no.of unique cities*/
select rollno,count(ccode)=5 from enrolled group by rollno;
select rollno,count(ccode) from enrolled group by rollno having count(ccode)=5 ;/*h)selecting rollno's whose course count is 5*/
select count(CCode) from enrolled where rollno='1901CS99';/*i)getting courses enrolled by rollno.*/
select * from course where CCode like '__5%';/*j)getting courses where 3rd digit is 5*/
select count(rollno) from student where rollno like '%CS%';/*k)counting student who has 'cs' in rollno*/
select rollno,count(ccode)>=4 from enrolled group by rollno;
select rollno,count(ccode) from enrolled group by rollno having count(ccode)>=4 ;/*l)selecting rollno's whose course count is >=4*/
insert into Student(RollNo,SName,Gender,City,Email) values('2020ME02','Singh','M','Punjab','2020ec02@iiitdm.ac.in');
select * from student where email like '%@gmail.com' or email like '%@yahoo.com';/*n)selecting students whose email has gmail.com or yahoo.com as domain*/