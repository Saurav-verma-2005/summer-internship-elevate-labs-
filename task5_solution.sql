
-- Creating sample tables: Customers and Orders
CREATE TABLE Customers (
    customer_id INTEGER PRIMARY KEY,
    customer_name TEXT,
    city TEXT
);

CREATE TABLE Orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    order_amount REAL,
    order_date TEXT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Sample Data
INSERT INTO Customers VALUES (1, 'Alice', 'Delhi');
INSERT INTO Customers VALUES (2, 'Bob', 'Mumbai');
INSERT INTO Customers VALUES (3, 'Charlie', 'Bangalore');
INSERT INTO Customers VALUES (4, 'David', 'Chennai');

INSERT INTO Orders VALUES (101, 1, 2500.00, '2024-01-01');
INSERT INTO Orders VALUES (102, 2, 1800.00, '2024-01-03');
INSERT INTO Orders VALUES (103, 1, 3200.00, '2024-01-05');
INSERT INTO Orders VALUES (104, 5, 1500.00, '2024-01-07'); -- order with non-existent customer_id

-- INNER JOIN
SELECT Customers.customer_name, Orders.order_id, Orders.order_amount
FROM Customers
INNER JOIN Orders ON Customers.customer_id = Orders.customer_id;

-- LEFT JOIN
SELECT Customers.customer_name, Orders.order_id, Orders.order_amount
FROM Customers
LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id;

-- RIGHT JOIN (Note: Not supported in SQLite, use LEFT JOIN by reversing table order)
SELECT Orders.order_id, Orders.order_amount, Customers.customer_name
FROM Orders
LEFT JOIN Customers ON Orders.customer_id = Customers.customer_id;

-- FULL OUTER JOIN (SQLite workaround using UNION)
SELECT Customers.customer_id, customer_name, Orders.order_id, Orders.order_amount
FROM Customers
LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id
UNION
SELECT Customers.customer_id, customer_name, Orders.order_id, Orders.order_amount
FROM Orders
LEFT JOIN Customers ON Orders.customer_id = Customers.customer_id;

-- CROSS JOIN
SELECT Customers.customer_name, Orders.order_id
FROM Customers
CROSS JOIN Orders;

-- SELF JOIN: Show customers in the same city
SELECT A.customer_name AS Customer1, B.customer_name AS Customer2, A.city
FROM Customers A, Customers B
WHERE A.city = B.city AND A.customer_id < B.customer_id;
