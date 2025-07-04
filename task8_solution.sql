
-- Using MySQL syntax for procedures and functions

-- Creating a sample Employees table
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(100),
    salary DECIMAL(10,2)
);

-- Inserting sample data
INSERT INTO Employees VALUES (1, 'Alice', 'HR', 50000);
INSERT INTO Employees VALUES (2, 'Bob', 'IT', 70000);
INSERT INTO Employees VALUES (3, 'Charlie', 'Finance', 65000);
INSERT INTO Employees VALUES (4, 'David', 'IT', 60000);
INSERT INTO Employees VALUES (5, 'Eva', 'Finance', 72000);

-- Stored Procedure: Get all employees in a given department
DELIMITER //

CREATE PROCEDURE GetEmployeesByDepartment(IN dept_name VARCHAR(100))
BEGIN
    SELECT emp_id, emp_name, salary
    FROM Employees
    WHERE department = dept_name;
END //

DELIMITER ;

-- Calling the procedure
-- CALL GetEmployeesByDepartment('IT');

-- Function: Calculate bonus (10% of salary)
DELIMITER //

CREATE FUNCTION CalculateBonus(salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN salary * 0.10;
END //

DELIMITER ;

-- Using the function
SELECT emp_name, salary, CalculateBonus(salary) AS bonus
FROM Employees;
