drop database if exists myDb;
create database myDb;
use myDb;
create table Employee
(
Eid varchar(5),
Ename varchar(20),
Salary real,
Designation varchar(15),
constraint Emp_pk primary key (Eid)
);
insert into Employee values('E001','Saman',70000,'Executive');
insert into Employee values('E002','Kamal',65000,'Cleark');
insert into Employee values('E003','Aruni',90000,'Executive');
insert into Employee values('E004','Jagath',150000,'Manager');
insert into Employee values('E005','Nimal',48000,'Cleark');
insert into Employee values('E006','Sandun',95000,'Manager');
insert into Employee values('E007','Bimal',60000,'Cleark');
insert into Employee values('E008','Oshadee',120000,'Manager');
insert into Employee values('E009','Sarath',71000,'Executive');
insert into Employee values('E010','Kasuni',69000,'Cleark');

select *
from Employee

-- Correlated nested quaries
-- Find the employee’s name, salary, and designation who are getting more than the average salary of their same designation.

select e1.Ename,e1.Salary,e1.Designation
from Employee e1
where e1.salary > 
 (
	select avg(e2.Salary)
	from Employee e2
	where e2.Designation =e1.Designation
)

