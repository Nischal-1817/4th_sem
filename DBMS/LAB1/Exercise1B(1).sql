use iiit;
create table if not exists Orders(Ord_num int,Ord_amount int NOT NULL,Advance_amount int NOT NULL,Ord_date varchar(255) NOT NULL,Cust_code varchar(255),Agent_code varchar(255) NOT NULL,Description varchar(255),PRIMARY KEY(Ord_num,Cust_code));
insert into Orders(Ord_num,Ord_amount,Advance_amount,Ord_date,Cust_code,Agent_code,Description) values(004,200,3000,'15-aug-2021','C004','Ac001','Masala Kulcha');
insert into Orders(Ord_num,Ord_amount,Advance_amount,Ord_date,Cust_code,Agent_code,Description) values(007,600,5000,'17-sept-2021','C006','Ac003','Biriyani');
insert into Orders(Ord_num,Ord_amount,Advance_amount,Ord_date,Cust_code,Agent_code,Description) values(008,700,100,'19-feb-2020','C007','Ac005','Fried rice');
insert into Orders(Ord_num,Ord_amount,Advance_amount,Ord_date,Cust_code,Agent_code,Description) values(009,10000,600,'21-march-2010','C009','Ac002','French Rice');
insert into Orders(Ord_num,Ord_amount,Advance_amount,Ord_date,Cust_code,Agent_code,Description) values(010,20,600,'09-april-2004','C006','Ac005','Potato Curry');
select * from Orders;