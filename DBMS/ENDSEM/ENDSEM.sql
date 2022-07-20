use cs20b1109;

create table stadiums(StadiumName varchar(20) primary key,Location varchar(25) not null,Capacity int not null);
insert into stadiums values('NCA Cricket','Hyderabad',1000);
insert into stadiums values('D.Y Patil','Delhi',400);
insert into stadiums values('Wankhede','Mumbai',1500);
insert into stadiums values('EDEN Gardens','Kolkata',470);
insert into stadiums values('Chennai criket','Chennai',1400);

create table matches(MatchID varchar(10) primary key,Team1 varchar(20) not null,Team2 varchar(20) not null,Location varchar(25) not null);
insert into matches values('M1','INDIA','PAKISTAN','Mumbai');
insert into matches values('M2','NEW ZEALAND','INDIA','Kolkata');
insert into matches values('M3','INDIA','WEST INDIES','Delhi');
insert into matches values('M4','BANGLADESH','INDIA','Hyderabad');
insert into matches values('M5','INDIA','NAMIBIA','Chennai');
insert into matches values('M6','INDIA','NEW ZEALAND','Chennai');

create table players(PlayerID varchar(5) not null,playerName varchar(50) not null,age int not null,city varchar(20) not null,Runs int not null,wickets int not null,catches int not null,MatchID varchar(10));
insert into players values('P1','Virat Kohli',24,'Delhi',34,2,5,'M1');
insert into players values('P1','Virat Kohli',24,'Delhi',40,0,3,'M2');
insert into players values('P1','Virat Kohli',24,'Delhi',75,1,2,'M3');
insert into players values('P1','Virat Kohli',24,'Delhi',100,0,1,'M4');
insert into players values('P1','Virat Kohli',24,'Delhi',72,0,0,'M5');
insert into players values('P1','Virat Kohli',24,'Delhi',108,1,1,'M6');
insert into players values('P2','Kane Williamson',33,'Christ Church',40,0,1,'M2');
insert into players values('P3','Pollard',33,'windies',42,0,1,'M3');
insert into players values('P4','Mahmadullah',32,'Dhaka',44,1,1,'M4');
insert into players values('P5','Weise',22,'Namibia',43,4,3,'M5');

/* for 1st question*/
select MatchID,runs,catches from players where MatchID in(select MatchID from matches where location='Chennai') and playerName='Virat Kohli';

/*for 2nd question*/
create table allNames as select distinct playerName from players where age<25;
create table namesAndLocation as select distinct allNames.playerName,matches.MatchID from allNames,matches;
create table namesAndNot as select * from namesAndLocation where not exists(select * from players where namesAndLocation.playerName=players.playerName and namesAndLocation.MatchID=players.MatchID);
create table notInAll as select distinct playerName from namesAndNot;
create table InAll as select * from allNames where not exists(select * from notInAll where notInAll.playerName=allNames.playerName);
select * from InAll;

/*3rd question*/
select StadiumName,Capacity from stadiums where Location in (select distinct(Location) from matches);
/*4th question*/
select MatchID from matches where Team1 like 'IN%' or Team2 like 'IN%' and Location in(select location from stadiums where capacity>500);