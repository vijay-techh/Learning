
-- Create the database
CREATE DATABASE ECommerceDB;
USE ECommerceDB;

-- Create Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
	CustomerID int,
	ProductID int,
    OrderDate DATE,
    Quantity INT,
    TotalAmount DECIMAL(10, 2),
	Foreign key(customerid) references customers(customerid),
    foreign key(ProductID)  references products(productID)
);

-- Insert data into Orders table
INSERT INTO Orders (OrderID, CustomerID, ProductID, OrderDate, Quantity, TotalAmount) VALUES
(1, 101, 201, '2023-01-01', 2, 200.00),
(2, 102, 202, '2023-01-05', 1, 500.00),
(3, 103, 203, '2023-01-07', 3, 450.00),
(4, 101, 202, '2023-01-10', 1, 500.00),
(5, 104, 204, '2023-01-12', 4, 600.00);

-- Create Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2)
);

-- Insert data into Products table
INSERT INTO Products (ProductID, ProductName, Category, Price) VALUES
(201, 'Laptop', 'Electronics', 100.00),
(202, 'Smartphone', 'Electronics', 500.00),
(203, 'Office Chair', 'Furniture', 150.00),
(204, 'Coffee Table', 'Furniture', 150.00);

-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50),
    Gender VARCHAR(10),
    Age INT
);

-- Insert data into Customers table----------------------
INSERT INTO Customers (CustomerID, CustomerName, City, Gender, Age) VALUES
(101, 'Alice', 'New York', 'Female', 28),
(102, 'Bob', 'Los Angeles', 'Male', 34),
(103, 'Charlie', 'Chicago', 'Male', 25),
(104, 'Daisy', 'Miami', 'Female', 30);


SELECT * FROM CUSTOMERS
SELECT * FROM orders
SELECT * FROM products

select * from orders where orderdate between '2023-01-01' and '2023-01-31'
--2.	Retrieve details of customers who ordered Smartphones.


SELECT customername FROM customers c left join  orders o
on c.customerid=o.customerid left join products p
on o.productid=p.productid
where p.productid =202

--3.	Find products in the Furniture category----------------------
where category='Furniture'

--4.	Calculate the total revenue generated.----------------------
select 
(quantity*totalamount) as totalrevenue from orders

--5.	Find the average age of customers.----------------------

select floor(avg(age))from customers

--6.	Determine the total quantity sold for each product.----------------------

select productname ,sum(quantity)as totaldf from orders left join products 
on orders.productid=products.productid
group by productname

select customername,sum(totalamount) from orders left join customers
on orders.customerid=customers.customerid
group by customername
select * from orders
--10.	Find the top 2 highest-selling products based on quantity sold.
select  sum(quantity),productname from products left join orders
on products.productid = orders.productid
group by productname
order by sum(quantity) desc
limit 2

--11.	Identify customers who spent more than $500.

select customername,sum(totalamount) sumofspending from customers left join orders 
on customers.customerid=orders.customerid 
group by customername
having sum(totalamount)>500
--12.	Group customers by gender and calculate their average order value
select gender,avg(totalamount) sumofspending from customers left join orders 
on customers.customerid=orders.customerid 
group by gender















