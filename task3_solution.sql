
-- Creating a sample table
CREATE TABLE Products (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT NOT NULL,
    category TEXT,
    price REAL,
    stock INTEGER
);

-- Sample Data
INSERT INTO Products VALUES (1, 'Laptop', 'Electronics', 50000, 25);
INSERT INTO Products VALUES (2, 'Smartphone', 'Electronics', 20000, 40);
INSERT INTO Products VALUES (3, 'Tablet', 'Electronics', 15000, 15);
INSERT INTO Products VALUES (4, 'Chair', 'Furniture', 3000, 100);
INSERT INTO Products VALUES (5, 'Desk', 'Furniture', 7000, 50);
INSERT INTO Products VALUES (6, 'Pen', 'Stationery', 10, 1000);
INSERT INTO Products VALUES (7, 'Notebook', 'Stationery', 50, 500);

-- SELECT * 
SELECT * FROM Products;

-- SELECT specific columns
SELECT product_name, price FROM Products;

-- WHERE clause
SELECT * FROM Products WHERE category = 'Electronics';

-- AND & OR conditions
SELECT * FROM Products WHERE category = 'Electronics' AND price > 18000;
SELECT * FROM Products WHERE category = 'Furniture' OR stock > 800;

-- LIKE operator
SELECT * FROM Products WHERE product_name LIKE '%top%';

-- BETWEEN operator
SELECT * FROM Products WHERE price BETWEEN 1000 AND 10000;

-- ORDER BY ascending and descending
SELECT * FROM Products ORDER BY price ASC;
SELECT * FROM Products ORDER BY stock DESC;

-- LIMIT results
SELECT * FROM Products LIMIT 3;

-- Aliasing columns
SELECT product_name AS Name, price AS Cost FROM Products;

-- DISTINCT categories
SELECT DISTINCT category FROM Products;

-- = vs IN
SELECT * FROM Products WHERE category = 'Electronics';
SELECT * FROM Products WHERE category IN ('Electronics', 'Furniture');

-- Default sort order (ASC)
-- This query sorts by product_name in default order (ascending)
SELECT * FROM Products ORDER BY product_name;
