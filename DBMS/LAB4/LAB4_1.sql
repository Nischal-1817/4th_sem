use lab4;
create table STUDENTACCOUNT(id int primary key,Person_Name varchar(20) not null,Department varchar(3) not null,Birth date not null);
insert into STUDENTACCOUNT(id,Person_Name,Department,Birth) values(1,'Ramesh','Cs','2001-01-12');
insert into STUDENTACCOUNT(id,Person_Name,Department,Birth) values(2,'suresh','IT','2020-02-20');
insert into STUDENTACCOUNT(id,Person_Name,Department,Birth) values(3,'Jomin','CS','1996-02-29');
insert into STUDENTACCOUNT(id,Person_Name,Department,Birth) values(4,'Shree','IT','2012-12-18');
insert into STUDENTACCOUNT(id,Person_Name,Department,Birth) values(5,'Hemanth','CS','2022-02-07');
select * from STUDENTACCOUNT;
/*for displaying age from birth date*/
select id,Person_Name,Department,Birth,concat(TIMESTAMPDIFF(YEAR,Birth,CURDATE()),'YEARS ',MOD(TIMESTAMPDIFF(MONTH,Birth,CURDATE()),12),'MONTHS') as Age from studentaccount;
select Person_Name from studentaccount where Person_Name like binary '%S%';/*for case sensitive 'S'*/
select Person_Name from studentaccount where Person_Name like '%S%';/*If not case sensitive*/
select * from studentaccount where (id%2)=1;/*for displaying alternative rows in table*/
select Person_Name from studentaccount where Person_Name like '_____';/*for displaying names whose length is 5*/