--adding some customers to the database
INSERT INTO Customers (CustomerID, Name, Phone, Email) 
VALUES
(1, 'John Doe', '555-1234', 'john@example.com'),
(2, 'Sarah Smith', '555-5678', 'sarah@example.com'),
(3, 'Ali Kemal', '555-0000', 'ali.kemal@example.com'),
(4, 'Jesse M', '556-1234', 'jesse@example.com'),
(5, 'Amiinee C', '556-5678', 'amiinee@example.com'),
(6, 'Loraine M', '556-0000', 'lorraine@example.com'),
(7, 'Chipo B', '557-1112', 'chipo@example.com'),
(8, 'Annah Julia', '558-2234', 'annaj@example.com'),
(9, 'Micheal Tom', '559-9911', 'tomm@example.com');
SELECT * FROM Customers;

--adding the employess details
INSERT INTO Employees (EmployeeID, Name, Role, Salary) 
VALUES
(1, 'Maria George', 'Waiter', 9000.00),
(2, 'Ahmed Hassan', 'Cashier', 11400.40),
(3, 'Lina Cicek', 'Waiter', 12000.00),
(4, 'James Brown', 'Cashier', 8900.50),
(5, 'Ahmed Plan', 'Waiter', 9700.00),
(6, 'Sarah Johns', 'Chef', 50000.00),
(7, 'Tino Mups', 'Chef', 20500.00),
(8, 'Sharleen Charles', 'Waiter', 9700.00);
SELECT * FROM Employees;

--grouping the waiters in one place reffering to employees table 
INSERT INTO Waiter(EmployeeID, Shift, TableServed)
VALUES
(1, 'Night Shift', 15),
(3, 'Morning Shift', 29),
(5, 'Afternoon Shift', 34),
(8, 'Morning Shift', 22);
SELECT * FROM Waiter;

--grouping the chefin one place reffering to employees table 
INSERT INTO Chef(EmployeeID, Speciality, Experience)
VALUES
(6, 'Head Chef', 20),
(7, 'Pastry Chef', 12);
SELECT * FROM Chef;

--grouping the cashiers in one place reffering to employees table 
INSERT INTO Cashier(EmployeeID, RegisterNumber, ShiftHours)
VALUES
(2, 3, 11),
(4, 4, 09);
SELECT * FROM Cashier;

--making the menu for the restaurant 
INSERT INTO MenuItems (ItemID, Name, Category, Price) 
VALUES
(1, 'Margherita Pizza', 'Food', 40.00),
(2, 'Chicken Burger', 'Food', 25.50),
(3, 'Orange Juice', 'Drink', 18.00),
(4, 'Chocolate Cake', 'Dessert', 20.50),
(5, 'Kebab', 'Food', 15.50),
(6, 'Chips', 'Food', 12.50),
(7, 'Ayran', 'Drink', 9.00),
(8, 'Pudding', 'Dessert', 19.00);
SELECT * FROM MenuItems;

--orders from the customers linking customers and employees
INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate, TotalAmount) 
VALUES
(1, 2, 1, '2025-05-02', 25.50),
(2, 1, 3, '2025-09-27' , 76.00),
(3, 3, 5, '2025-09-14' ,54.00),
(4, 5, 3, '2025-01-12', 46.50),
(5, 5, 3, '2025-03-29', 27.00),
(6, 4, 3, '2025-11-09', 40.00),
(7, 6, 8, '2025-10-01', 80.00),
(8, 9, 5, '2025-07-01', 41.00),
(9, 4, 8, '2025-11-11', 25.50),
(10, 5, 3, '2025-12-12', 120.00);
SELECT * FROM Orders;

--order details from the customers that they ordered and their quantities and prices
INSERT INTO OrderDetails (OrderID, ItemID, Quantity, Subtotal) VALUES
(1, 2, 1, 25.50),
(2, 8, 4, 76.00),
(3, 3, 2, 54.00),
(4, 5, 3, 46.50),
(5, 7, 3, 27.00),
(6, 1, 1, 40.00),
(7, 1, 2, 80.00),
(8, 4, 2, 41.00),
(9, 2, 1, 25.50),
(10, 1, 3, 120.00);
SELECT * FROM OrderDetails;

--payment record for each order 
INSERT INTO Payments (PaymentID, OrderID, PaymentType, Amount, PaymentDate) 
VALUES
(01, 1, 'Cash', 25.50, '2025-05-02'),
(02, 2, 'Card', 76.00, '2025-09-27'),
(03, 3, 'Online', 54.00, '2025-09-15'),
(04, 4, 'Cash', 46.50, '2025-01-12'),
(05, 5, 'Card', 27.00, '2025-03-30'),
(06, 6, 'Online', 40.00, '2025-11-09'),
(07, 7, 'Card', 80.50, '2025-10-01'),
(08, 8, 'Online', 41.00, '2025-07-01'),
(09, 9, 'Card', 25.50, '2025-11-11'),
(10, 10, 'Cash', 120.00, '2025-12-13');
SELECT * FROM Payments;

--updating the price of and item id of 3 to 13.00
update MenuItems
set Price = 13.00
where ItemID = 3;
select * from MenuItems
order by ItemID;

--deleting the payment that was not correct
delete from Payments
where PaymentID = 2;
select * from Payments;

--adding another column to customers and the details of it 
alter table Customers
add column Address varchar(100);
select * from Customers;

update Customers 
set Address = 'Hamitkoy Okamar2'
where customerid = 1;

update Customers 
set Address = 'Gonyeli Big Killer'
where customerid = 2;

update Customers 
set Address = 'Deep Gonyeli'
where customerid = 3;

update Customers 
set Address = 'Kucuk Kaymakli'
where customerid = 4;

update Customers 
set Address = 'Haspolat'
where customerid = 5;

update Customers set Address = 'Gazimagusa'
where customerid = 6;

update Customers 
set Address = 'Kucuk Kaymakli'
where customerid = 7;

update Customers 
set Address = 'Hamtikoy'
where customerid = 8;

update Customers 
set Address = 'Gazimagusa'
where customerid = 9;

select * from Customers;