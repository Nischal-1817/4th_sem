use iiit;
create table if not exists Agent(Agent_code varchar(255),Agent_name varchar(255) NOT NULL,Working_area varchar(255) NOT NULL,Commision float NOT NULL,Phone_no int,Country varchar(255),primary key(Agent_code,Phone_no));
insert into Agent(Agent_code,Agent_name,Working_area,Commision,Phone_no,Country) values('Ac001','Ramesh','Bangalore',0.15,0848022124,'India');
insert into Agent(Agent_code,Agent_name,Working_area,Commision,Phone_no,Country) values('Ac002','Dinesh','Bangalore',0.25,012345689,'');
insert into Agent(Agent_code,Agent_name,Working_area,Commision,Phone_no,Country) values('Ac003','Suresh','Mumbai',.35,0231231234,'London');
insert into Agent(Agent_code,Agent_name,Working_area,Commision,Phone_no,Country) values('Ac004','Kamalesh','New jersey',.68,0883245687,'');
insert into Agent(Agent_code,Agent_name,Working_area,Commision,Phone_no,Country) values('Ac005','Kartik','Chennai',0.73,0987654233,'India');
select * from Agent;