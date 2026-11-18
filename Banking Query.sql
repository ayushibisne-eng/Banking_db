SHOW databases;

create database banking_DB;
use banking_DB;

create table Customers (
customerID int,
firstname varchar(50),
lastname varchar(50),
email varchar(100),
0phone varchar(10),
);

desc customers;

alter table customers
add constraint pk_customer_id primary key (customerID);



select * from customers;

alter table customers
ADD AccountCreationDate date;


create table Accounts (
AccountID int,
AccountType varchar(20),
Balance decimal(10,2)
);
 
 desc accounts;
 
 alter table accounts
 ADD constraint PK_Account_id primary key (accountID);


create table Transaction (
TransactionID int,
TransactionDate date,
Amount decimal(10,2),
TransactionType varchar(20)
);

DESC transaction;

alter table transaction
add constraint pk_transaction_id primary key (transactionID);

create table AccountBranches (
     AssignmentDate date
     );
     
     create table Loans (
     LoanID INT,
     LoanAmount decimal (10,2),
     InterestRate decimal(5,2),
     StartDate date,
     EndDate date
     );
     
     desc loans;
     
	alter table loans
    add constraint pk_loan_id primary key (loanID);
     
     alter table customers
     add DateOfBirth date;
     
     desc customers;
     
     alter table customers
     modify phone varchar(20);
     
     desc customers;
     
     desc accounts;

alter table accounts
ADD constraint chk_minBalace
check (Balance >= 1000);

desc accounts;

drop table accountbranches;


alter table accounts
add customerId int;

alter table accounts
add constraint Fk_Accounts_customers
foreign key (customerID)
references customers (CustomerID);

alter table customers
modify firstname varchar(50) not null;

desc customers;

alter table customers
add constraint uq_Email_ unique (Email);

create table Branches (
BranchID INT,
BranchName varchar(100),
BranchAddress varchar(200),
BranchPhone varchar(15)
);
 
 alter table customers 
 alter column lastname set default "NA";

ALTER TABLE Accounts
ADD BranchID INT;
 
ALTER TABLE accounts
ADD CONSTRAINT FK_Accounts_Branches
FOREIGN KEY (BranchID)
REFERENCES branches (branchID);


desc branches;

alter table branches
    add constraint pk_branches_id primary key (branchID);
     
alter table transaction
    add constraint pk_Transaction_id primary key (transactionID);
     
     
ALTER TABLE transaction
ADD AccountID INT;

ALTER TABLE transaction
ADD CONSTRAINT FK_transaction_Accounts
FOREIGN KEY (AccountID)
REFERENCES accounts (AccountID); 

desc transaction;

ALTER TABLE loans
ADD CustomerID INT;

ALTER TABLE loans
ADD CONSTRAINT FK_customers_Accounts
FOREIGN KEY (CustomerID)
REFERENCES customers (CustomerID);

desc loans;

create table kyc(
KycID int primary key,
AadharNO varchar(12) not null,
PanNO varchar(10)not null,
customerid int not null,
constraint fk_customer
foreign key (customerid) references customers(customerid)
);
 
 show create table accounts;-- you can change table name as per your requirement
 
 -- you can get informatiom about constraints applied on a specific table
 
 -- by the query written below

select 
CONSTRAINT_NAME,
CONSTRAINT_TYPE
from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
where 	TABLE_SCHEMA = 'banking_db'
and TABLE_NAME = 'Kyc';
     
desc kyc;


insert into customers

values (101,'Amit','Gupta','amit@gmail.com','1234567890','2024-01-15','1998-05-10');

select * from customers;

insert into customers (CustomerID,firstname,lastname,email,phone,AccountCreationdate,DateOfBirth)

values (102,'Aryan','Gupta','aryan@gmail.com','1284467566','2025-07-15','1995-03-05');

insert into customers
(phone,email,lastname,firstname,accountcreationdate,dateofbirth,customerid)
value ('9876543212','rahul@gmail.com','Verma','Rahul','2024-03-12','1997-11-14',103);

INSERT INTO Customers
VALUES
(104,'Sneha','Joshi','sneha@gmail.com','9876543213','2024-04-18','2000-01-05'),
(105,'Karan','Mehta','karan@gmail.com','9876543214','2024-05-25','1996-12-30');

select * from customers;

INSERT INTO Branches
VALUES
(1,'Nagpur Branch','Sitabuldi, Nagpur','0712-123456'),
(2,'Pune Branch','Shivaji Nagar, Pune','020-223344'),
(3,'Mumbai Branch','Andheri, Mumbai','022-334455');

select * from branches;

INSERT INTO Accounts
VALUES
(1001,'Savings',25000,101,1),
(1002,'Current',45000,102,2),
(1003,'Savings',18000,103,1),
(1004,'Current',72000,104,3),
(1005,'Savings',15000,105,2);

ALTER TABLE transaction 
DROP COLUMN AccountsID;


INSERT INTO transaction
VALUES
(1,'2025-01-10',5000,'Deposit',1001),
(2,'2025-01-12',2000,'Withdrawal',1001),
(3,'2025-01-13',7000,'Deposit',1002),
(4,'2025-01-15',3000,'Withdrawal',1003),
(5,'2025-01-16',10000,'Deposit',1004);


select * from transaction;

INSERT INTO Loans
VALUES
(501,500000,8.5,'2024-01-01','2029-01-01',101),
(502,250000,9.0,'2024-03-15','2028-03-15',103),
(503,700000,7.8,'2024-06-20','2031-06-20',104);

select * from loans;

select * from customers;

update customers
set email = 'amit@2026@yahoo.com'
where customerid = 101;

update customers
set lastname = 'Bisen'
where customerid = 102;

update customers
set firstname = 'Aayushi'
where customerid = 102;
 
 select * from branches;
 
update branches
set branchaddress = 'Civil Lines, Nagpur',
branchphone = '0712-123692'
where branchid = 1;

select * from kyc;
 
 insert into kyc
 values
 (701,'702786748691','HKJ1678GF9',101),
 (702,'702766748391','HKJ13579GF',102),
 (703,'702766234562','HKJ3456HJJ',105);
 
 delete from kyc where KycID = 702;
 
 select * from kyc;
 
  delete from kyc where KycID;
  
  select * from customers;
  select 	firstname,email,phone from customers;
  
  update customers
  set email = 'aayushi@gmail.com'
  where customerid = 102;
  
  select * from accounts;
   
   select * from accounts
   where Balance > 40000;
   
  select AccountID,Balance from accounts
   where Balance > 40000;
   
  select Balance from accounts
   where Balance > 40000;
    
select accountid,accountType,Balance from accounts
where AccountType = 'current';
  
select accountid,accountType,Balance from accounts
where AccountType = 'savings';
  
select * from customers;

select * from customers
where customerID= 104;

select * from accounts;

select * from accounts
 where accounttype = "savings" and balance > 20000;
  

 select * from accounts
 where accounttype = "savings" or balance > 20000;
  
 select * from accounts
 where accounttype = "current" or balance > 20000;
    
    
    -- FIND ALL ACCOUNTS WHERE ACCOUNT TYPE IS NOT SAVINGS
 select * from accounts
 where AccountType <> "SAVINGS";
  
select * from accounts
 where not AccountType = "SAVINGS";
  
select * from accounts
 where  AccountType != "SAVINGS";
 
 
 select * from loans;
 
 select * from loans
 where InterestRate = 8.5 or InterestRate = 9.0 ;

select * from loans
 where InterestRate in (8.5,9.0);
 
 select * from loans
 where InterestRate between 7.5 and 8.5;

select * from accounts;

select * from accounts
where balance between 20000 and 60000;

select * from accounts
where balance between 20000 and 60000 and AccountType = "current";

select * from customers;

-- LIKE OPERATOR

select * from customers
where lastname like 'J%';

select * from customers
where firstname like '%A';

select * from customers
where firstname like 'A___';

-- SORT ACOUNTS TABLE AS PER BALANCE IN DESCENDING ORDER 
select * from accounts
order by Balance;

select * from accounts
order by Balance desc;

select * from accounts
order by Balance desc ,AccountType;

-- Extra practice data for banking_db (MySQL 8.0)
-- Run AFTER the original dump has been restored.
-- Insert order respects foreign keys: branches -> customers -> accounts -> kyc -> loans -> transactions
-- NOTE: chk_MinBalance requires Balance >= 1000 (NULL is allowed by a CHECK constraint).
-- NOTE: Aadhaar / PAN values below are FAKE, for practice only.

USE banking_db;
-- ---------------------------------------------------------
-- BRANCHES  (NULL address / NULL phone; branch 6 has no accounts)
-- ---------------------------------------------------------

INSERT INTO branches (BranchID, BranchName, BranchAddress, BranchPhone) VALUES
(4, 'Nashik Branch',      'College Road, Nashik',      NULL),
(5, 'Chandrapur Branch',  NULL,                        '07172-250100'),
(6, 'Aurangabad Branch',  'Station Road, Aurangabad',  '0240-334455');

-- ---------------------------------------------------------
-- CUSTOMERS  (NULL lastname / email / Phone / dates)
-- ---------------------------------------------------------

INSERT INTO customers (customerID, FirstName, lastname, email, Phone, AccountCreationDate, DateOfBirth) VALUES
(106, 'Neha',   'Kulkarni', 'neha.k@gmail.com',       '9876543215', '2024-06-10', '1995-03-18'),
(107, 'Vikram', 'Singh',    NULL,                     '9876543216', '2024-07-01', '1994-07-07'),
(108, 'Anjali', NULL,       'anjali@outlook.com',     NULL,         '2024-08-14', '2001-09-12'),
(109, 'Rohan',  'Deshmukh', 'rohan.d@yahoo.com',      '9876543218', NULL,         '1993-02-25'),
(110, 'Pooja',  'Joshi',    'pooja@gmail.com',        '9876543219', '2024-09-30', NULL),
(111, 'Suresh', 'Patil',    NULL,                     NULL,         '2024-10-05', '1990-06-15'),
(112, 'Meera',  'Nair',     'meera.nair@gmail.com',   '9876543221', '2025-01-20', '1999-12-01'),
(113, 'Amit',   'Verma',    'amitv@rediffmail.com',   '9876543222', '2025-02-11', '1998-05-10'),
(115, 'Sanjay', 'Mehta',    'sanjay.m@gmail.com',     NULL,         '2025-04-09', '1988-10-28');

-- lastname omitted on purpose, so the DEFAULT 'NA' is applied
INSERT INTO customers (customerID, FirstName, email, Phone, AccountCreationDate, DateOfBirth) VALUES
(114, 'Kavita', 'kavita@gmail.com', '9876543223', '2025-03-03', '2002-04-17');

-- ACCOUNTS  (NULL AccountType / Balance / CustomerID / BranchID)
-- Customers 114 and 115 intentionally have NO account.

INSERT INTO accounts (AccountID, AccountType, Balance, CustomerID, BranchID) VALUES
(1006, 'Savings', 32000.00,  106,  1),
(1007, 'Current', 150000.00, 107,  3),
(1008, 'Savings', NULL,      108,  2),
(1009, NULL,      5000.00,   109,  4),
(1010, 'Savings', 1000.00,   110,  4),
(1011, 'Current', 98000.00,  111,  5),
(1012, 'Savings', 12000.00,  112,  NULL),
(1013, 'Current', 27500.50,  101,  3),
(1014, 'Savings', 60000.00,  NULL, 1),
(1015, 'Savings', 8500.00,   113,  2);

 ---------------------------------------------------------
-- KYC  (table was empty; only some customers have KYC)
-- No KYC for 108, 110, 111, 113, 114, 115
-- ---------------------------------------------------------

INSERT INTO kyc (kycid, aadharNo, panNo, customerid) VALUES
(1, '234567890123', 'ABCPS1234A', 101),
(2, '345678901234', 'BCDPJ2345B', 102),
(3, '456789012345', 'CDEPV3456C', 103),
(4, '567890123456', 'DEFPJ4567D', 104),
(5, '678901234567', 'EFGPM5678E', 105),
(6, '789012345678', 'FGHPK6789F', 106),
(7, '890123456789', 'GHIPS7890G', 107),
(8, '901234567890', 'HIJPD8901H', 109),
(9, '112233445566', 'IJKPN9012I', 112);

-- ---------------------------------------------------------
-- LOANS  (NULL InterestRate / LoanAmount / EndDate / CustomerID)
-- ---------------------------------------------------------

INSERT INTO loans (LoanID, LoanAmount, InterestRate, StartDate, EndDate, CustomerID) VALUES
(504, 400000.00, 8.25, '2025-01-10', '2030-01-10', 105),
(505, 150000.00, NULL, '2025-02-01', '2027-02-01', 106),
(506, 900000.00, 7.50, '2025-03-05', NULL,         107),
(507, NULL,      9.50, '2025-04-01', '2029-04-01', 109),
(508, 300000.00, 8.50, '2025-05-15', '2030-05-15', 101),
(509, 120000.00, 10.00,'2025-06-01', '2026-06-01', NULL);

-- ---------------------------------------------------------
-- TRANSACTIONS  (NULL Amount / TransactionType / AccountID / TransactionDate)
-- Accounts 1008, 1009, 1012, 1014 have no transactions.
-- ---------------------------------------------------------

INSERT INTO transaction (TransactionID, TransactionDate, Amount, TransactionType, AccountID) VALUES
(6,  '2025-01-18', 1500.00,  'Deposit',    1005),
(7,  '2025-01-20', NULL,     'Deposit',    1006),
(8,  '2025-02-02', 4500.00,  'Withdrawal', 1006),
(9,  '2025-02-05', 20000.00, 'Deposit',    1007),
(10, '2025-02-10', 2500.00,  NULL,         1007),
(11, '2025-02-14', 800.00,   'Transfer',   1001),
(12, '2025-02-20', 12000.00, 'Transfer',   1004),
(13, '2025-03-01', 6000.00,  'Deposit',    NULL),
(14, '2025-03-05', 3500.00,  'Withdrawal', 1010),
(15, NULL,         9000.00,  'Deposit',    1011),
(16, '2025-03-15', 500.00,   'Withdrawal', 1002),
(17, '2025-03-18', 15000.00, 'Deposit',    1013),
(18, '2025-04-01', 2200.00,  'Withdrawal', 1013),
(19, '2025-04-10', 7500.00,  'Deposit',    1001),
(20, '2025-04-12', 1000.00,  'Transfer',   1015);


-- Quick sanity check
SELECT 'branches' AS tbl, COUNT(*) AS cnt FROM branches
UNION ALL SELECT 'customers', COUNT(*) FROM customers
UNION ALL SELECT 'accounts', COUNT(*) FROM accounts
UNION ALL SELECT 'kyc', COUNT(*) FROM kyc
UNION ALL SELECT 'loans', COUNT(*) FROM loans
UNION ALL SELECT 'transaction', COUNT(*) FROM transaction;

select * from kyc;
select * from transaction;
select * from branches;
select * from accounts;
select * from loans;
select * from customers;

-- DISTINCT CLAUSE
select distinct Accounttype from accounts;
select distinct transactiontype from transaction;
select distinct customerID,LoanID From loans;

-- LIMIT CLAUSE
select * from transaction
LIMIT 2;

select * from transaction
order by Amount desc
limit 3;

-- Find top 2 transaction having highest withdrawal amount 
select * from transaction
where TransactionType = "withdrawal"
order by Amount desc
limit 2;
 -- offset clause
 select * from customers;
 select * from customers
 limit 5 offset 5;
 
 -- Find 3rd customer having highest loan amount
 select * from loans
 order by LoanAmount desc
 limit 1 offset 2;

-- NOT in
 select * from transaction
 where TransactionType not in ("deposit","withdrawal");
 
 -- NULL 
 select customerID,firstname,lastname,email from  customers
 where email is null;
 
  select customerID,firstname,lastname,email,phone from  customers
 where email is null and phone is null;
 
 -- CASE statement
 select loanid,loanamount,customerid,
 case 
 when loanamount >= 500000 then "High value loan"
 when LoanAmount >=200000 then "Medium value loan"
 else "low value loan"
 end as loanCategory
 from loans;
 
 select * from accounts;
 
 select * from customers;
 
 select now();

select curdate();
select current_date();

select curtime();
select current_time();

select year (dateofbirth),month(dateofbirth),day(dateofbirth) 
from customers where customerID = 104;

select customerid,firstname,dateofbirth,
year(curdate())- year(dateofbirth) as age 
from customers;

select customerid,firstname,dateofbirth,
year(curdate())- year(dateofbirth) as age 
from customers where customerID = 104;

select firstname, dateofbirth, round(datediff(curdate(),dateofbirth) /365,1) as age
from customers;
 
 select firstname, dateofbirth, 
 concat(firstname," age is ",round(datediff(curdate(),dateofbirth) /365,1)) as age
from customers;
 
 -- Date_add function
 select concat(firstname," ",lastname) as fullname,
 accountcreationdate,
 date_add(accountcreationdate, interval 1 year) as KYCRenewal
 from customers;
 
 select date_sub(curdate(), interval 7 day);
 
 -- aggregate functions
 -- calculate the total balance maintained across all customer accounts
 
 select sum(balance) totalBalance from accounts;
 
 -- calculate the Average balance maintained across all customer accounts
 
 select avg(balance) totalBalance from accounts;
 
 -- calculate the Maximum balance maintained across all customer accounts
 
 select max(balance) totalBalance from accounts;
 
-- calculate the alter Lowest balance maintained across all customer accounts
 
 select min(balance) totalBalance from accounts; 
 
 -- Determine the total numbers of customers accounts
 -- available in the system.
 
 select count(*) as NoOfAccounts from accounts;

-- Group by
 select accounttype, count(*) as NoOfAccounts from accounts group by accounttype;

select accounttype, sum(balance) as NoOfAccounts from accounts group by accounttype;

-- find total amount by transaction type 
select * from transaction;

select transactiontype, sum(amount) as TotalAmount
from transaction 
group by TransactionType;

-- Find total accounts for branch and accounttype;
select * from accounts;

select branchid, accounttype, count(*) as NoOfAccounts
from accounts
group by branchid,accounttype
order by NoOfAccounts desc;

-- HAVING Clause
-- Find Transactiontype where total amount for that transaction type
-- exceeds 20000.
select transactiontype, sum(amount) as TotalAmount
from transaction 
group by TransactionType
having TotalAmount > 10000;

select transactiontype, sum(amount) as TotalAmount
from transaction 
group by TransactionType
having TotalAmount > 10000 and TransactionType = "deposit";

-- Find the number of customer joined according to year from customers table.
select * from customers;

select year(accountcreationdate) as years, count(*) as totalcustomers
from customers
group by years;

select year(accountcreationdate) as years, count(*) as totalcustomers
from customers
group by years
order by totalcustomers;

select * from loans;

-- Find total loan amount for all the customers.
 select customerid , sum(loanAmount) as totalloanamount
 from loans
 group by CustomerID
 order by CustomerID;

-- QUE--
--  Display distinct Branchids From Accounts 
-- where balance is greater than ₹30,000.
select * from accounts;

select branchId,balance from accounts
where Balance > 30000;

-- Display all savings accounts belonging to branch 1 or branch 3

select * from accounts
where AccountType e= "Savings" and BranchID = 1 or BranchID = 3;

-- Find the Average balance of current accounts for each branch.
-- display only branches where  the average balance exceeds ₹40,000.

select branchid, avg(balance)  as avgBalace from accounts
where AccountType = "Current"
group by BranchID;

-- Total and average balance per AccountType. How are NULL types and NULL balances treated?

select Accounttype, sum(balance) as Total,
avg(balance) as Average from accounts group by AccountType;

-- Branches (by BranchID) having more than one account (HAVING).

select branchid, count(*) as Accounts 
from accounts group by BranchID having count(*) > 1;

select branchid, avg(balance)  as avgBalace from accounts
where AccountType = "Current"
group by BranchID;

select * from customers;
select * from accounts;
select * from loans;

-- JOINS 
-- A JOINS Combines related rows from diffrent 
-- tables based on a common column

-- 1 INNER JOIN
-- It Matches the Rows that exist in both tables
-- QUE -- FIND ALL CUSTOMERS WHO Have ACCOUNTS AND SHOW THEIR BALANCE.

select c.customerid,c.firstname,c.lastname,a.AccountType,a.balance
from customers c 
inner join accounts a 
on c.customerID = a.customerId;

select *
from customers c 
inner join accounts a 
on c.customerID = a.customerId;

-- Find all the customers who have loans.alter
-- output should contain customerid,firstname,lastname,phone, loanamount

select c.customerid,c.firstname,c.lastname,c.phone,l.loanamount
from customers c 
join loans l       # by default mysql uses inner join if join type is not mentioned
on c.customerID = l.CustomerID;




