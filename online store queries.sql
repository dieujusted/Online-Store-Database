--Creating Database and Tables--
CREATE DATABASE OnlineStore;
CREATE TABLE Customer_Table
(
customer_id VARCHAR(15) PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
phone VARCHAR(15),
email VARCHAR(50),
street VARCHAR(25),
city VARCHAR(15),
state VARCHAR(10),
zip INT,
);
CREATE TABLE Inventory
(
product_id VARCHAR(15) PRIMARY KEY,
name VARCHAR(25),
quantity INT,
unit_price DECIMAL(18,0)
);
----DATATYPES HAVE BEEN CHANGED FOR INVENTORY---
CREATE TABLE Orders
(
order_id VARCHAR(15) PRIMARY KEY,
customer_id VARCHAR(15),
order_date DATE,
status INT,
comments VARCHAR(50)
);
CREATE TABLE order_status
(
order_status_id VARCHAR(15) PRIMARY KEY,
name VARCHAR(25),
);


 --INSERTING VALUES INTO TABLES--
 INSERT INTO Customer_Table
 VALUES (1, 'Jane', 'Doe', 407-720-8000, 'janedoe@gmail.com', '123 Main St.', 'Orlando', 'Florida', 32818)

 UPDATE Customer_Table
 SET phone=4077208000
 WHERE phone=407-720-8000;

 INSERT INTO Customer_Table
 VALUES (2, 'Sally', 'Jensen', 4230004563, 'jensen2021@yahoo.com', '5000 Dolly Ln', 'Chattanooga', 'Tennessee', 37215)

 INSERT INTO Customer_Table
 VALUES (3, 'Jordan', 'Davis', 3471237300, 'jdavis@gmail.com', '5th MLK St.', 'Brooklyn', 'New York', 11210)

 INSERT INTO Customer_Table
 VALUES (3, 'Maria', 'Rivera', 786741367, 'mariarivera786@ymail.com', '50 Sobe St.', 'Miami', 'Florida', 33122)

 INSERT INTO Customer_Table
 VALUES (4, 'Morgan', 'Thompson', 3108562384, 'morgankeller@yahoo.com', '724 Rodero Dr.', 'Beverly Hills', 'California', 90210)

 INSERT INTO Customer_Table
 VALUES (5, 'Mina', 'Lopez', 4692008542, 'minlo@gmail.com', '123 MLK St.', 'Dallas', 'Texas', 75201)
 ; 

 INSERT INTO Orders
 VALUES (100, 1, '2021-3-12', 2, null);
 --------------------------- 
 

 SELECT *
FROM Orders;

SELECT *
FROM Customer_Table;

 SELECT *
 FROM Orders
 JOIN Customer_Table
 ON Customer_Table.customer_id=Orders.customer_id;

SELECT first_name, last_name,orders.customer_id, email, order_id, order_date
FROM Customer_Table
JOIN Orders
ON Orders.customer_id= Customer_Table.customer_id
WHERE order_date > '2021-01-01'
ORDER BY customer_id

/****Asking Questions****/
--What was the total sales for the store in Dec-Apr?
SELECT SUM(unit_price) AS TotalSales
FROM ORDERS; 

---How many orders are still processing?
SELECT COUNT(order_id) AS ProcessingOrders
FROM Orders
WHERE status=4
GROUP BY status

--Who ordered the most Shirts?
SELECT first_name, last_name, Customer_Table.customer_id, order_id, product_id, quantity
FROM Customer_Table
JOIN Orders
ON Customer_Table.customer_id=Orders.customer_id
WHERE quantity=5
Order By order_id

