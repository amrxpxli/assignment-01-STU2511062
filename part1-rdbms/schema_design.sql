-- Customers
CREATE TABLE Customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) UNIQUE,
    customer_city VARCHAR(50) NOT NULL
);

INSERT INTO Customers VALUES
('C002','Priya Sharma','priya@gmail.com','Delhi'),
('C001','Rohan Mehta','rohan@gmail.com','Mumbai'),
('C006','Neha Gupta','neha@gmail.com','Delhi'),
('C003','Amit Verma','amit@gmail.com','Bangalore'),
('C005','Vikram Singh','vikram@gmail.com','Mumbai');


-- Products
CREATE TABLE Products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    unit_price DECIMAL(10,2) NOT NULL
);

INSERT INTO Products VALUES
('P004','Notebook','Stationery',120),
('P007','Pen Set','Stationery',250),
('P005','Headphones','Electronics',3200),
('P003','Desk Chair','Furniture',8500),
('P006','Standing Desk','Furniture',22000);


-- Sales Representatives
CREATE TABLE Sales_Reps (
    sales_rep_id VARCHAR(10) PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    sales_rep_email VARCHAR(100),
    office_address VARCHAR(200)
);

INSERT INTO Sales_Reps VALUES
('SR02','Anjali Mehta','anjali@company.com','Delhi Office, Connaught Place, New Delhi - 110001'),
('SR01','Rahul Verma','rahul@company.com','Mumbai HQ, Nariman Point, Mumbai - 400021'),
('SR03','Karan Shah','karan@company.com','South Zone, MG Road, Bangalore - 560001'),
('SR04','Sneha Iyer','sneha@company.com','Chennai Office, T Nagar, Chennai - 600017'),
('SR05','Arjun Patel','arjun@company.com','Ahmedabad Office, SG Highway, Ahmedabad - 380015');


-- Orders
CREATE TABLE Orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10) NOT NULL,
    sales_rep_id VARCHAR(10) NOT NULL,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES Sales_Reps(sales_rep_id)
);

INSERT INTO Orders VALUES
('ORD1027','C002','SR02','2023-11-02'),
('ORD1114','C001','SR01','2023-08-06'),
('ORD1153','C006','SR01','2023-02-14'),
('ORD1002','C002','SR02','2023-01-17'),
('ORD1118','C006','SR02','2023-11-10');


-- Order Details
CREATE TABLE Order_Details (
    order_id VARCHAR(10),
    product_id VARCHAR(10),
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Order_Details VALUES
('ORD1027','P004',4),
('ORD1114','P007',2),
('ORD1153','P007',3),
('ORD1002','P005',1),
('ORD1118','P007',5);