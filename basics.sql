create DataBase sample1  -- create db

Create Table Employee -- create table using primary key
(
ID int,
Name varchar(255),
Age int,
IsAdmin bit,
DOB datetime2,
Primary Key (ID)
)
Create Table Department  -- create table using forien key
(
ID int,
Name varchar(255),
AdminId int,
primary key (ID),
Foreign Key (AdminId) References Employee(ID)
)

Alter Table Employee  -- edit table
drop column AGE  -- delete column

insert into Employee -- add data
values (1,'gautam',1,'1/1/2000') 
insert into Employee (ID,Name) -- add data by choosen
values (3,'gautam')

update Employee
set Name = 'gautam2' where ID =2 --update one
update Employee
set Name = 'gautam2',IsAdmin=0 where ID=2  -- update many 

delete  from  Employee where id=2
truncate table  Department -- delete all rows

select * from Employee;





