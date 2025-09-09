--1.	Display snum,sname,city and comm of all salespeople.
SELECT SNUM, SNAME, CITY, COMM FROM Salespeople;
--2.	Display all snum without duplicates from all orders.
SELECT DISTINCT SNUM FROM Orders;
--3.	Display names and commissions of all salespeople in london.
SELECT SNAME, COMM FROM Salespeople WHERE CITY = 'London';
--4.	All customers with rating of 100.
SELECT * FROM Cust WHERE RATING = 100;
--5.	Produce orderno, amount and date form all rows in the order table.
SELECT ONUM, AMT, ODATE FROM Orders;
--6.	All customers in San Jose, who have rating more than 200.
SELECT * FROM Cust WHERE city = 'San Jose' AND Rating > 200;
--7.	All customers who were either located in San Jose or had a rating above 200.
SELECT * FROM Cust WHERE city = 'San Jose' OR Rating > 200
--8.	All orders for more than $1000.
SELECT * FROM Orders WHERE AMT > 1000;
--9.	Names and citires of all salespeople in london with commission above 0.10.
SELECT SNAME, CITY FROM Salespeople WHERE CITY = 'London' AND COMM > 0.10;
--10.	All customers excluding those with rating <= 100 unless they are located in Rome.
SELECT * FROM Cust WHERE Rating <= 100 OR CITY = 'Rome'
--11.	All salespeople either in Barcelona or in london.
SELECT * FROM Salespeople WHERE CITY IN ('Barcelona','London');
--12.	All salespeople with commission between 0.10 and 0.12. (Boundary values should be excluded)
SELECT * FROM Salespeople WHERE Comm > 0.10 AND comm < 0.12;
--13.	All customers with NULL values in city column.
SELECT * FROM Cust WHERE CITY IS NULL;
--14.	All orders taken on Oct 3Rd   and Oct 4th  1994.
SELECT * FROM Orders WHERE ODATE IN ('1994-10-03', '1994-10-04');
--15.	All customers serviced by peel or Motika.
SELECT * FROM Cust WHERE SNUM IN (SELECT SNUM FROM Salespeople WHERE SNAME IN ('Peel','Motika'));
--15a.	All customers whose names begin with a letter from A to B.
SELECT * FROM Cust WHERE CNAME LIKE 'A%' OR CNAME LIKE 'B%';
--16.	All orders except those with 0 or NULL value in amt field.
SELECT * FROM Orders WHERE AMT IS NOT NULL AND AMT <> 0;
--17.	Count the number of salespeople currently listing orders in the order table.
SELECT COUNT(DISTINCT SNUM) AS total_salespeople FROM Orders;
--18.	Largest order taken by each salesperson, datewise.
SELECT SNUM, ODATE, MAX(AMT) AS largest_order FROM Orders GROUP BY SNUM, ODATE ORDER BY SNUM, ODATE;
--19.	Largest order taken by each salesperson with order value more than $3000.
SELECT SNUM, MAX(AMT) FROM Orders GROUP BY SNUM HAVING MAX(AMT) > 3000;
