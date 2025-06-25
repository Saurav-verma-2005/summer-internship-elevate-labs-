
-- Creating a sample table
CREATE TABLE Employees (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT DEFAULT NULL,
    age INTEGER,
    department TEXT
);

-- INSERT statements
INSERT INTO Employees (id, name, email, age, department) VALUES (1, 'John Doe', 'john@example.com', 30, 'Sales');
INSERT INTO Employees (id, name, age, department) VALUES (2, 'Jane Smith', 25, 'Marketing'); -- email is NULL
INSERT INTO Employees (id, name, email, department) VALUES (3, 'Mike Johnson', 'mike@example.com', 'HR'); -- age is NULL
INSERT INTO Employees (id, name, email, age, department) VALUES (4, 'Emily Davis', NULL, 28, 'Finance');

-- UPDATE statement
UPDATE Employees SET department = 'Operations' WHERE id = 1;
UPDATE Employees SET age = 26 WHERE name = 'Jane Smith';

-- DELETE statement
DELETE FROM Employees WHERE id = 4;

-- Handling NULLs: Find all rows where email is NULL
SELECT * FROM Employees WHERE email IS NULL;

-- Rollback scenario (for systems supporting transactions)
-- BEGIN TRANSACTION;
-- DELETE FROM Employees WHERE department = 'HR';
-- ROLLBACK;

-- Insert using SELECT (copying data into a new table)
CREATE TABLE Employee_Backup AS SELECT * FROM Employees;

-- Inserting partial values (with default or NULL handling)
INSERT INTO Employees (id, name) VALUES (5, 'Alex Turner');

-- ON DELETE CASCADE example setup
CREATE TABLE Departments (
    dept_id INTEGER PRIMARY KEY,
    dept_name TEXT
);

CREATE TABLE Staff (
    staff_id INTEGER PRIMARY KEY,
    staff_name TEXT,
    dept_id INTEGER,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id) ON DELETE CASCADE
);

-- Sample insertions
INSERT INTO Departments VALUES (10, 'Engineering');
INSERT INTO Staff VALUES (101, 'Chris Martin', 10);
-- Deleting from Departments will also delete from Staff due to ON DELETE CASCADE
-- DELETE FROM Departments WHERE dept_id = 10;
