SHOW databases;

create database banking_DB;
use banking_DB;

create table Customers (
customerID int,
firstname varchar(50),
lastname varchar(50),
email varchar(100),
phone varchar(10)
);

desc customers;