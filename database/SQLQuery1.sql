/*Select Title as "Book's Name", [Author Name] as "Writer" from Books Where ISBN ='1'

Select * from Books order by Price

SELECT *FROM Readers WHERE [User id] BETWEEN 1 AND 10;

Select * From Staffs Where Position is not null;

select max(Salary) as MaxSalary, avg(Salary) as AvgSalary, min(Salary) as MinSalary from [Staff Salary]

SELECT  Count(*) as [ Total Members] from Staffs;

Select sum(Salary) as [Total Salary] from [Staff Salary]

select Price from Books group by Price having Price >10;

Select * From Books Where Title like '%a%'



UPDATE [Staff Salary] SET Salary=Salary+400 select * from [Staff Salary]



select * from Books inner join Publisher on Books.ISBN = Publisher.ISBN
select * from Readers  inner join Staffs on Readers.[First name] = Staffs[First name];
select * from [Staff Salary] r   inner join Staffs s on r.Position = s.Position;


select * from Readers r  left outer join Staffs s on r.[First name] = s.[First name];
select * from Readers r  right outer join Staffs s on r.[First name] = s.[First name];
select * from Readers r  full outer join Staffs s on r.[First name] = s.[First name];


*/

/*CREATE VIEW gettingBooks
as 
 Select * from Books*/



 
 /*CREATE VIEW gettingReaders
as 
 Select * from Readers*/



 /*
CREATE PROCEDURE ReaderTest
as
Begin Select * from Readers
End*/


/*
CREATE PROCEDURE BookTest
as
Begin Select * from Readers
End */














