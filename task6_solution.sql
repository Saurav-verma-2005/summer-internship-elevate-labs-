
-- Creating sample tables
CREATE TABLE Employees (
    emp_id INTEGER PRIMARY KEY,
    emp_name TEXT,
    department TEXT,
    salary REAL
);

CREATE TABLE Departments (
    dept_name TEXT PRIMARY KEY,
    manager TEXT
);

-- Sample data
INSERT INTO Employees VALUES (1, 'Alice', 'HR', 50000);
INSERT INTO Employees VALUES (2, 'Bob', 'IT', 70000);
INSERT INTO Employees VALUES (3, 'Charlie', 'Finance', 65000);
INSERT INTO Employees VALUES (4, 'David', 'IT', 60000);
INSERT INTO Employees VALUES (5, 'Eva', 'Finance', 72000);
INSERT INTO Employees VALUES (6, 'Frank', 'HR', 48000);

INSERT INTO Departments VALUES ('HR', 'Mr. A');
INSERT INTO Departments VALUES ('IT', 'Ms. B');
INSERT INTO Departments VALUES ('Finance', 'Mr. C');

-- 1. Scalar Subquery in SELECT
SELECT emp_name,
       (SELECT manager FROM Departments WHERE dept_name = Employees.department) AS manager
FROM Employees;

-- 2. Subquery in WHERE using IN
SELECT emp_name
FROM Employees
WHERE department IN (SELECT dept_name FROM Departments);

-- 3. Subquery in WHERE using EXISTS
SELECT emp_name
FROM Employees E
WHERE EXISTS (
    SELECT 1 FROM Departments D WHERE D.dept_name = E.department
);

-- 4. Correlated Subquery (highest salary in each department)
SELECT emp_name, department, salary
FROM Employees E1
WHERE salary = (
    SELECT MAX(salary)
    FROM Employees E2
    WHERE E1.department = E2.department
);

-- 5. Subquery in FROM clause (Derived Table)
SELECT department, AVG(salary) AS avg_salary
FROM (
    SELECT * FROM Employees WHERE salary > 50000
) AS HighEarners
GROUP BY department;

-- 6. Subquery with =
SELECT emp_name
FROM Employees
WHERE salary = (SELECT MAX(salary) FROM Employees);

-- 7. Subquery returning multiple rows (for IN)
SELECT emp_name
FROM Employees
WHERE department IN (SELECT dept_name FROM Departments);
