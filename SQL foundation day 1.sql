Create Database Course1;
use course1;
Create table Person(
name char(50),
address char(100),
dob date,
ownHouse bit default 0
);
insert into Person values("A","Address1","2002-03-21",1);
insert into Person values("B","Address2","2003-03-21",0);
insert into Person values("C","Address3","2004-03-21",0);
insert into Person values("D","Address4","2005-03-21",0);
insert into Person values("E","Address5","2006-03-21",0);
insert into Person values("F","Address6","2007-03-21",1);
insert into Person values("G","Address7","2008-03-21",1);
insert into Person values("H","Address8","2009-03-21",0);
insert into Person values("I","Address9","2010-03-21",0);
insert into Person values("J","Address10","2011-03-21",0);
insert into Person values("K","Address11","2012-03-21",1);
insert into Person(name,address) values("D","Address2");
Select * from Person;
select * from person where ownHouse=0;
select * from person where name="j";
-- when we want that we want to find charcter containg a literal in it or any other thing then we use %
select * from person where address like "Address1%";
-- if we want to see the letter which start with A we use _ with 
insert into Person values("AA","Address1","2002-03-21",1);
insert into Person values("AB","Address2","2003-03-21",0);
insert into Person values("CC","Address3","2004-03-21",0);
insert into Person values("AD","Address4","2005-03-21",0);
insert into Person values("ED","Address5","2006-03-21",0);
insert into Person values("FF","Address6","2007-03-21",1);
insert into Person values("FG","Address7","2008-03-21",1);
insert into Person values("CH","Address8","2009-03-21",0);
insert into Person values("I","Address9","2010-03-21",0);
insert into Person values("J","Address10","2011-03-21",0);
insert into Person values("K","Address11","2012-03-21",1);
Select * from Person where name like "A_";
-- to find character whose first letter is there and second one is A 
Select * from Person where name like "_A%";
select * from person where dob like "_3%";
select * from person where dob like "_-03%";
select * from person where dob like "_0%";
select * from person where dob like "_003%";
-- use of or function
select * from person where address="Address10" or address="Address2";
-- more convenient way to write above statment as above statment is little bit longer 
select * from person where address in ("Address3" , "Address4");
select * from person where address not in ("Address3" , "Address4");
-- use of betwween function represent the range 
select * from person where dob between "2001-01-21" and "2006-01-21" ;
-- use of two method at same time  and also learn the use of Month method 
select * from person where ownhouse =1 and year(dob)=2002;
-- Select all employees whose phone number follows the pattern '123-__-7890'
SELECT * FROM Person
WHERE dob LIKE '2002-__-21';
-- Updating  method 
select * from person;
update person set ownHouse=2;
-- if above two lines code not working it mean that your sql query safe mode in on replace it 
set SQL_SAFE_UPDATES = 0;
update person set ownhouse=2;
-- describe all table 
DESCRIBE person;
-- Update 'ownHouse' to '1' (binary)
UPDATE person SET ownHouse = 1;
select * from person;
update person set address="Address-99" where name ="B";
update person
set address="Address-99" 
where dob is null ;
select * from person ;
Delete from person where name="G";
-- trunicate the data means delete all data but i ll not use it here bc i did not wannt to delete
