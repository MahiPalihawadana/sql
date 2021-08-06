create database BankDB

use BankDB

create table AccType
(
typeID varchar(5),
typeName varchar(20),
constraint AccType_pk primary key(typeID)
);

create table Account
(
accountNo varchar(5),
balance real,
typeID varchar(5),
constraint Account_pk primary key(accountNo)
);

insert into AccType values
('T001','Ordinary Savings'),
('T002','Max Bonus'),
('T003','Hit Saver');

insert into Account values
('A001',20000,'T001'),
('A002',30000,'T002'),
('A003',40000,'T001'),
('A004',50000,'T004'),
('A005',60000,'T005');

select * from Account;
select * from AccType;

-- inner join

select *
FROM AccType t inner join Account a on t.typeID=a.typeID

select *
FROM AccType t  join Account a on t.typeID=a.typeID

-- left outer join
select *
from AccType t left outer join Account a on t.typeID = a.typeID

select *
from Account a left outer join AccType t  on t.typeID = a.typeID

-- right outer join
select *
from AccType t right outer join Account a on t.typeID = a.typeID

-- full outer join
-- not supported by this server ,so alternative way combine left and right with set oprations

select *
from AccType t left outer join Account a on t.typeID = a.typeID
union
select *
from AccType t right outer join Account a on t.typeID = a.typeID

-- left side unmatching tika witrak gannwanm

select *
from AccType t left outer join Account a on t.typeID = a.typeID
where a.accountNo is null


-- right side unmatching tuples withrak gnna

select *
from AccType t right outer join Account a on t.typeID = a.typeID
where t.typeID is null

-- left and right both missing tuples
select *
from AccType t left outer join Account a on t.typeID = a.typeID
where a.accountNo is null
union
select *
from AccType t right outer join Account a on t.typeID = a.typeID
where t.typeID is null


-- natural join

select *
from AccType  natural join Account 

-- cross join
select *
from AccType  cross join Account 