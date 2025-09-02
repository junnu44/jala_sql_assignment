--1.	Display snum,sname,city and comm of all salespeople.
SELECT SNUM, SNAME, CITY, COMM FROM Salespeople;
--2.	Display all snum without duplicates from all orders.
SELECT DISTINCT SNUM FROM Orders;
--3.	Display names and commissions of all salespeople in london.
SELECT SNAME, COMM FROM Salespeople WHERE CITY = 'London';
