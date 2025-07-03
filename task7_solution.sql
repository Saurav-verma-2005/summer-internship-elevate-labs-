
-- Creating base tables
CREATE TABLE Employees (
    emp_id INTEGER PRIMARY KEY,
    emp_name TEXT,
    department TEXT,
    salary REAL
);

CREATE TABLE Departments (
    dept_name TEXT PRIMARY KEY,
    location TEXT
);

-- Sample data
INSERT INTO Employees VALUES (1, 'Alice', 'HR', 50000);
INSERT INTO Employees VALUES (2, 'Bob', 'IT', 70000);
INSERT INTO Employees VALUES (3, 'Charlie', 'Finance', 65000);
INSERT INTO Employees VALUES (4, 'David', 'IT', 60000);
INSERT INTO Employees VALUES (5, 'Eva', 'Finance', 72000);

INSERT INTO Departments VALUES ('HR', 'Delhi');
INSERT INTO Departments VALUES ('IT', 'Mumbai');
INSERT INTO Departments VALUES ('Finance', 'Bangalore');

-- 1. Creating a view for employees with salary > 60000
CREATE VIEW HighEarners AS
SELECT emp_id, emp_name, department, salary
FROM Employees
WHERE salary > 60000;

-- 2. Using the view
SELECT * FROM HighEarners;

-- 3. View with JOIN
CREATE VIEW EmployeeDetails AS
SELECT E.emp_name, E.department, D.location
FROM Employees E
JOIN Departments D ON E.department = D.dept_name;

-- 4. Using the joined view
SELECT * FROM EmployeeDetails;

-- 5. View with aggregation
CREATE VIEW DepartmentAvgSalary AS
SELECT department, AVG(salary) AS avg_salary
FROM Employees
GROUP BY department;

-- 6. Updating a view (only possible if it meets conditions - here, simple view without joins/aggregations)
-- UPDATE HighEarners SET salary = 75000 WHERE emp_name = 'Bob';

-- 7. Dropping a view
-- DROP VIEW IF EXISTS HighEarners;

-- 8. View with WITH CHECK OPTION (supported in some DBMS, not SQLite)
-- CREATE VIEW HR_Employees AS
-- SELECT * FROM Employees WHERE department = 'HR'
-- WITH CHECK OPTION;
