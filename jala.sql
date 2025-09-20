

-- Reset (safe to re-run)
DROP TABLE IF EXISTS Orders CASCADE;
DROP TABLE IF EXISTS Cust CASCADE;
DROP TABLE IF EXISTS Salespeople CASCADE;

-- 1) Master table: Salespeople
CREATE TABLE Salespeople (
  SNUM  INT PRIMARY KEY,
  SNAME VARCHAR(50) NOT NULL,
  CITY  VARCHAR(50),
  COMM  NUMERIC(4,2)  -- commission as fraction (e.g., 0.12 = 12%)
);

INSERT INTO Salespeople (SNUM, SNAME, CITY, COMM) VALUES
(1001, 'Peel',    'London',    0.12),
(1002, 'Serres',  'San Jose',  0.13),
(1004, 'Motika',  'London',    0.11),
(1007, 'Rafkin',  'Barcelona', 0.15),
(1003, 'Axelrod', 'New York',  0.10);

-- 2) Customers
CREATE TABLE Cust (
  CNUM   INT PRIMARY KEY,
  CNAME  VARCHAR(50) NOT NULL,
  CITY   VARCHAR(50),
  RATING INT,
  SNUM   INT REFERENCES Salespeople(SNUM)
);

INSERT INTO Cust (CNUM, CNAME, CITY, RATING, SNUM) VALUES
(2001, 'Hoffman',   'London',    100, 1001),
(2002, 'Giovanne',  'Rome',      200, 1003),
(2003, 'Liu',       'San Jose',  300, 1002),
(2004, 'Grass',     'Berlin',    100, 1002),
(2006, 'Clemens',   'London',    300, 1007),
(2007, 'Pereira',   'Rome',      100, 1004),

-- Added to satisfy orders referencing CNUM=2008
(2008, 'Cisnerous', 'Barcelona', 200, 1007);

-- 3) Orders
CREATE TABLE Orders (
  ONUM  INT PRIMARY KEY,
  AMT   NUMERIC(10,2),
  ODATE DATE,
  CNUM  INT REFERENCES Cust(CNUM),
  SNUM  INT REFERENCES Salespeople(SNUM)
);

-- Use ISO dates for simplicity (1994-10-03 etc.)
INSERT INTO Orders (ONUM, AMT, ODATE, CNUM, SNUM) VALUES
(3001,  18.69, '1994-10-03', 2008, 1007),
(3003, 767.19, '1994-10-03', 2001, 1001),
(3002,1900.10, '1994-10-03', 2007, 1004),
(3005,5160.45, '1994-10-03', 2003, 1002),
(3006,1098.16, '1994-10-04', 2008, 1007),
(3009,1713.23, '1994-10-04', 2002, 1003),
(3007,  75.75, '1994-10-05', 2004, 1002),
(3008,4723.00, '1994-10-05', 2006, 1001),
(3010,1309.95, '1994-10-06', 2004, 1002),
(3011,9891.88, '1994-10-06', 2006, 1001);

-- Optional: helpful indexes (for bigger datasets, not required here)
CREATE INDEX idx_orders_snum ON Orders(SNUM);
CREATE INDEX idx_orders_cnum ON Orders(CNUM);
CREATE INDEX idx_cust_city   ON Cust(CITY);
CREATE INDEX idx_sales_city  ON Salespeople(CITY);

-- Quick sanity checks
SELECT COUNT(*) AS salespeople_cnt FROM Salespeople;
SELECT COUNT(*) AS customers_cnt   FROM Cust;
SELECT COUNT(*) AS orders_cnt      FROM Orders;

-- Peek data
SELECT * FROM Salespeople ORDER BY SNUM;
SELECT * FROM Cust ORDER BY CNUM;
SELECT * FROM Orders ORDER BY ONUM;
