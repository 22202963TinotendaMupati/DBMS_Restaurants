# Restaurant Management Database System

## Course
CMPE343 – Database Management Systems and Programming I

## Student
-	22202963 Tinotenda Mupati
-	22217265 Lorraine Masvata
-	22218191 Jesse Mundi Dafur
-	22311141 Mohamed Amine Hillali

## Description
This DBMS project implements a restaurant management system, which is designed to manage customers, employees, orders made by the customers and its order details, menu showing the items the restaurant offers, and the payments made by the customers.

-	A Customer can place many Orders, while each Order is linked to one Customer(1 to Many Relation)
-	Each Order is handled by one Employee which is our waiter and one Employee can have many Orders (1 to Many Relation)
-	One Order can contain many MenuItems and a MenuItem can appear in many Orders(1 to Many Relation)
-	A MenuItem can appear in many OrderDetails
-	Each Payment has one Payment(1 to 1 Relationship)
-	The Employees are generalized into Cashier, Waiter and Chef

## Technologies
-	Supabase
-	SQL

## Project Contents
-	ER Diagram
-	DDL (9 Tables and their constraints)
-	DML (Insert, Update, Alter, Delete operations)
-	16 SQL Queries for data analysis and management

## Database Features
- Employee specialization (Waiter, Chef, Cashier)
- Order and payment tracking
- Sales analysis and commission calculation
- Customer and menu management

## Database Tables and Attributes
-	Customers: CustomerID (PK), Name, Phone, Email, Address(Altered into the table)
-	Employees: EmployeeID (PK), Name, Role, Salary
-	Waiter: EmployeeID (PK, FK), Shift, TableServed
-	Chef: EmployeeID (PK, FK), Speciality, Experience
-	Cashier: EmployeeID (PK, FK), RegisterNumber, ShiftHours
-	MenuItems: ItemID (PK), Name, Category, Price
-	Orders: OrderID (PK), CustomerID (FK), EmployeeID (FK), OrderDate, TotalAmount
-	OrderDetails: OrderID (PK, FK), ItemID (PK, FK), Quantity, Subtotal
-	Payments: PaymentID (PK), OrderID (FK), PaymentType, Amount, PaymentDate



