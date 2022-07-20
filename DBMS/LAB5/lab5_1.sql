use lab5;
create table agent(agent_code varchar(10) not null primary key,agent_name varchar(10) not null,working_area varchar(15) not null,commission float not null,phone_no varchar(15) not null,country varchar(15) );
create table orders1(ord_num int not null primary key,ord_amount int not null,advance_amount int not null,ord_date date not null,cust_code varchar(10) not null,agent_code varchar(10) not null,description varchar(20));
insert into agent values('Ac001','Ramesh','Bangalore',.15,'0331234567','India');
insert into agent values('Ac002','Dinesh','Bangalore',.25,'0331234568','');
insert into agent values('Ac003','Suresh','Mumbai',.35,'0331234569','London');
insert into agent values('Ac004','Kamlesh','New jersey',.68,'0331234564','');
insert into agent values('Ac005','Kartik','Chennai',.73,'0331234563','India');
insert into orders1 values(004,200,3000,'2020-08-15','C004','Ac001','Masala Kulcha');
insert into orders1 values(007,600,5000,'2020-09-17','C006','Ac003','Biriyani');
insert into orders1 values(008,700,100,'2019-02-19','C007','Ac005','');
insert into orders1 values(009,10000,600,'2010-03-21','C009','Ac008','Masala dosa');
insert into orders1 values(010,20,600,'2012-04-21','C006','Ac005','');
select * from orders1;
select * from agent;
select ord_num,ord_amount,ord_date,cust_code,agent_code from orders1 where agent_code in (select agent_code from agent where working_area='Bangalore');/*displaying the required data for those orders are from bangalore*/
select ord_num,ord_amount,cust_code,agent_code from orders1 where agent_code = (select agent_code from agent where agent_name='Ramesh');/*displaying the required data whose name is Ramesh*/