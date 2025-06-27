
-- Creating a sample table
CREATE TABLE Employees (
    emp_id INTEGER PRIMARY KEY,
    emp_name TEXT,
    department TEXT,
    salary REAL,
    experience INTEGER
);

-- Sample Data
INSERT INTO Employees VALUES (1, 'Alice', 'HR', 40000, 5);
INSERT INTO Employees VALUES (2, 'Bob', 'IT', 60000, 3);
INSERT INTO Employees VALUES (3, 'Charlie', 'Finance', 55000, 4);
INSERT INTO Employees VALUES (4, 'David', 'HR', 45000, 6);
INSERT INTO Employees VALUES (5, 'Eva', 'IT', 70000, 5);
INSERT INTO Employees VALUES (6, 'Frank', 'Finance', 50000, 2);
INSERT INTO Employees VALUES (7, 'Grace', 'IT', 80000, 7);

-- SUM: Total salary per department
SELECT department, SUM(salary) AS total_salary
FROM Employees
GROUP BY department;

-- AVG: Average experience per department
SELECT department, AVG(experience) AS avg_experience
FROM Employees
GROUP BY department;

-- COUNT: Number of employees per department
SELECT department, COUNT(*) AS num_employees
FROM Employees
GROUP BY department;

-- COUNT with DISTINCT
SELECT department, COUNT(DISTINCT experience) AS unique_experiences
FROM Employees
GROUP BY department;

-- MAX: Highest salary by department
SELECT department, MAX(salary) AS highest_salary
FROM Employees
GROUP BY department;

-- GROUP BY multiple columns
SELECT department, experience, COUNT(*) AS count
FROM Employees
GROUP BY department, experience;

-- HAVING: Departments with average salary > 55000
SELECT department, AVG(salary) AS avg_salary
FROM Employees
GROUP BY department
HAVING AVG(salary) > 55000;

-- ROUND average salary
SELECT department, ROUND(AVG(salary), 2) AS avg_salary_rounded
FROM Employees
GROUP BY department;
