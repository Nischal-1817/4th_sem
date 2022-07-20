show databases;
use lab7;
create table bank(Bank_name varchar(10) NOT NULL,state varchar(25) not null);
insert into bank values('SBI','Andhra Pradesh');
insert into bank values('SBI','Tamilnadu');
insert into bank values('SBI','Karnataka');
insert into bank values('ICICI','Tamilnadu');
insert into bank values('ICICI','Karnataka');
select * from bank;
create table account_holder(Account_name varchar(25) not null,Bank_name varchar(10) not null,State_name varchar(25) not null);
insert into account_holder values('Ramesh','ICICI','TamilNadu');
insert into account_holder values('Dinesh','SBI','Andhra Pradesh');
insert into account_holder values('Robert','SBI','Tamilnadu');
insert into account_holder values('Robert','ICICI','Karnataka');
insert into account_holder values('Robert','SBI','Andhra pradesh');
insert into account_holder values('Karthik','SBI','Andhra pradesh');
 select * from account_holder;
 /*for 1st question*/
create table allNames as select distinct account_name from account_holder;
create table namesAndbank as select distinct allNames.account_name,bank.Bank_name from allNames,bank;
create table namesAndNot as select * from namesAndbank where not exists(select * from account_holder where namesAndbank.account_name=account_holder.account_name and namesAndbank.bank_name=account_holder.bank_name);
create table notInAll as select distinct account_name from namesAndNot;
create table InAll as select * from allNames where not exists(select * from notInAll where notInAll.account_name=allNames.account_name);
select * from InAll;
/*for 2nd question*/
create table allStates as select distinct bank_name from bank;
create table statesAndbank as select distinct allStates.bank_name,bank.state from allStates,bank;
create table statesAndNot as select * from statesAndbank where not exists(select * from bank where statesAndbank.bank_name=bank.bank_name and statesAndbank.state=bank.state);
create table notInEvery as select distinct bank_name from statesAndNot;/*for 3rd question*/
create table InEvery as select * from allStates where not exists(select * from notInEvery where notInEvery.bank_name=allStates.bank_name);
select * from inevery;
/*for 4th question*/
create table namesAndState as select distinct allNames.account_name,bank.state from allNames,bank;
create table namesAndnS as select * from namesAndState where not exists(select * from account_holder where account_holder.account_name=namesAndState.account_name and account_holder.state_name=namesAndState.state);
create table notInState as select distinct account_name from namesAndnS;
create table inState as select * from allNames where not exists(select * from notInState where notInState.account_name=allNames.account_name);
select * from inState;