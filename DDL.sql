create table Customers (
  CustomerID INT primary key,
  Name VARCHAR(100) not null,
  Phone VARCHAR(20),
  Email VARCHAR(100) unique
);

create table Employees (
  EmployeeID INT primary key,
  Name VARCHAR(100) not null,
  Role VARCHAR(50) not null,
  Salary DECIMAL(10, 2) default 0
);

create table Waiter (
  EmployeeID INT primary key,
  Shift VARCHAR(50),
  TableServed INT,
  foreign KEY (EmployeeID) references Employees (EmployeeID)
);

create table Chef (
  EmployeeID INT primary key,
  Speciality VARCHAR(50),
  Experience INT,
  foreign KEY (EmployeeID) references Employees (EmployeeID)
);

create table Cashier (
  EmployeeID INT primary key,
  RegisterNumber INT,
  ShiftHours DECIMAL(4, 2),
  foreign KEY (EmployeeID) references Employees (EmployeeID)
);

create table MenuItems (
  ItemID INT primary key,
  Name VARCHAR(100) not null,
  Category VARCHAR(50),
  Price DECIMAL(8, 2) not null check (Price >= 0)
);

create table Orders (
  OrderID INT primary key,
  CustomerID INT,
  EmployeeID INT,
  OrderDate DATE default CURRENT_DATE,
  TotalAmount DECIMAL(8, 2) default 0,
  foreign KEY (CustomerID) references Customers (CustomerID),
  foreign KEY (EmployeeID) references Employees (EmployeeID)
);

create table OrderDetails (
  OrderID INT not null,
  ItemID INT not null,
  Quantity INT not null check (Quantity > 0),
  Subtotal DECIMAL(8, 2) not null,
  primary key (OrderID, ItemID),
  foreign KEY (OrderID) references Orders (OrderID),
  foreign KEY (ItemID) references MenuItems (ItemID)
);

create table Payments (
  PaymentID INT primary key,
  OrderID INT not null,
  PaymentType VARCHAR(50) not null,
  Amount DECIMAL(8, 2) not null,
  PaymentDate DATE default CURRENT_DATE,
  foreign KEY (OrderID) references Orders (OrderID)
);