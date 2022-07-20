use lab5;
create table salesman(salesman_id varchar(25) not null,Name varchar(15) not null, City varchar(15) not null,commission float not null);
create table Orders(ord_no int not null,purch_amt int not null,ord_date date not null,Customer_id varchar(15) not null ,salesman_id varchar(15) not null);
insert into salesman values('si123@06','Lakshmi','Kolkata',0.5);
insert into salesman values('si123@09','Ganesh','London',0.6);
insert into salesman values('si123@90','Dinesh','London',0.3);
insert into salesman values('si123@10','Joseph','Chennai',0.6);
insert into salesman values('si123@19','Mahesh','Hyderabad',0.65);
insert into salesman values('si123@26','Paul Adam','London',0.1);
insert into salesman values('si123@67','Rahul','Delhi',0.4);
insert into Orders values(123,600,'2010-08-20','003cd','si123@19');
insert into Orders values(576,750,'2018-02-20','004cd','si123@19');
insert into Orders values(579,800,'2012-05-20','004cd','si123@26');
insert into Orders values(600,60000,'2021-01-20','006cd','si123@10');
insert into Orders values(700,745,'2021-01-26','007cd','si123@09');
insert into Orders values(800,860,'2019-01-29','007cd','si123@26');
select * from salesman;
select * from orders;
select * from orders where salesman_id in (select salesman_id from salesman where name='Paul Adam');/*displaying the orders issude by Paul Adam*/
select * from orders where salesman_id in (select salesman_id from salesman where city="London");/*displaying the orders issued for those whose city is London*/