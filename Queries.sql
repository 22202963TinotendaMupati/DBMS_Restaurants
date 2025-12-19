--1 looking at employees and their salaries (ordered by lowest first)
select EmployeeID, Name, Salary 
from Employees 
order by Salary;

--2 checking all orders by date (newest first)
SELECT *
FROM Orders
ORDER BY OrderDate DESC;

--3 finding customers who ordered desserts
SELECT DISTINCT C.CustomerID, C.Name, C.Email
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN OrderDetails OD ON O.OrderID = OD.OrderID
JOIN MenuItems MI ON OD.ItemID = MI.ItemID
WHERE MI.Category = 'Dessert';

--4 employees who are not involved in handling orders 
--OR who have not yet handled any orders.
SELECT E.Name, E.Salary
FROM Employees E
LEFT JOIN Orders O ON E.EmployeeID = O.EmployeeID
WHERE O.OrderID IS NULL;

--5 full order info - customer name and employee who handled it
SELECT 
    O.OrderID, C.Name AS CustomerName,
    E.Name AS EmployeeName, O.OrderDate, O.TotalAmount
FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID
JOIN Employees E ON O.EmployeeID = E.EmployeeID
ORDER BY O.OrderDate;

--6 counting how many orders each customer made
SELECT 
  c.CustomerID, c.Name AS CustomerName, COUNT(o.OrderID) AS TotalOrders
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Name
ORDER BY TotalOrders DESC;

--7 looking for the first occurance of the letter a in the name using strpos since in supabase we dont have INSTR  
SELECT *, strpos(Name, 'a') AS Position_of_a
FROM Customers
ORDER BY CustomerID;

--8 showing payments paid between 2025-01-12 and 2025-09-15 and paid using cash and order by the amount from highest to lowest  
SELECT PaymentID, PaymentType, Amount, PaymentDate
FROM Payments
WHERE PaymentDate BETWEEN '2025-01-12' AND '2025-09-15'
AND PaymentType = 'Cash'
ORDER BY Amount DESC;

--9 payment method breakdown to see how people prefer to pay amongst cash, card and online
SELECT 
  PaymentType, COUNT(*) AS NumberOfTransactions,
  SUM(Amount) AS TotalAmount, AVG(Amount) AS AverageAmount
FROM Payments
GROUP BY PaymentType
ORDER BY TotalAmount DESC;

--10 this shows only roles whose minimum salary is higher than the minimum cashier salary
SELECT Role, MIN(Salary)
FROM Employees 
GROUP BY Role
HAVING MIN(Salary) > (SELECT MIN(Salary)
                FROM Employees 
                WHERE Role = 'Cashier');

--11 orders that are above the average order value
SELECT OrderID, TotalAmount
FROM Orders
WHERE TotalAmount > (SELECT AVG(TotalAmount) FROM Orders)
ORDER BY TotalAmount;

--12 Show orders handled by waiters only and how many orders each of them worked
--and showing the commission of 5% of each waiter and their total sales
SELECT 
  E.Name AS WaiterName, COUNT(O.OrderID) AS TotalOrders,
  SUM(O.TotalAmount) AS TotalSales, 
  SUM(O.TotalAmount) * 0.05 AS Commission_Earned
FROM Employees E
JOIN Orders O ON E.EmployeeID = O.EmployeeID
WHERE E.Role = 'Waiter'
GROUP BY E.Name
ORDER BY TotalSales DESC;


--13 Show the total number of customers, employees, and items separate them using UNION 
SELECT 'Customers' AS type, COUNT(*) AS Total FROM Customers
UNION
SELECT 'Employees', COUNT(*) FROM Employees
UNION
SELECT 'Items', COUNT(*) FROM MenuItems;


--14 joining orderdetails, customername and menuitems showing the name of the food, itemid, 
--the quantities and price that the customers ordered on which date 
SELECT 
  C.Name AS CustomerName, O.OrderID, O.OrderDate,
  MI.Name AS ItemName, OD.Quantity, OD.Subtotal
FROM OrderDetails OD
JOIN Orders O ON OD.OrderID = O.OrderID
JOIN Customers C ON O.CustomerID = C.CustomerID
JOIN MenuItems MI ON OD.ItemID = MI.ItemID
ORDER BY O.OrderDate;

--15 Total sales for each month on year 2025
SELECT 
  DATE_TRUNC('month', OrderDate) AS Month,
  COUNT(OrderID) AS TotalOrders,
  SUM(TotalAmount) AS TotalSales
FROM Orders
GROUP BY DATE_TRUNC('month', OrderDate)
ORDER BY Month;


--16 payments made on a different date from the order date
SELECT 
  P.PaymentID, P.PaymentDate, O.OrderID,
  O.OrderDate, P.Amount
FROM Payments P
JOIN Orders O ON P.OrderID = O.OrderID
WHERE P.PaymentDate <> O.OrderDate
ORDER BY P.PaymentDate;


               