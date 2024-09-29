-- Create the departments table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL
);

-- Create the employees table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    hire_date DATE NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Insert data into departments
INSERT INTO departments (department_id, department_name)
VALUES 
(1, 'Sales'),
(2, 'Marketing'),
(3, 'Human Resources'),
(4, 'IT'),
(5, 'Finance');

-- Insert data into employees
INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, salary, department_id)
VALUES 
(1, 'John', 'Doe', 'john.doe@example.com', '2021-01-15', 60000, 1),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '2022-03-22', 75000, 2),
(3, 'Emily', 'Johnson', 'emily.johnson@example.com', '2020-07-30', 55000, 3),
(4, 'Michael', 'Brown', 'michael.brown@example.com', '2019-05-12', 80000, 4),
(5, 'Alice', 'Davis', 'alice.davis@example.com', '2023-09-01', 72000, 1);

-- Query to retrieve all employees with their department names
SELECT e.first_name, e.last_name, d.department_name, e.salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

-- Calculate average salary by department
SELECT d.department_name, AVG(e.salary) AS average_salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name;

-- Get the highest-paid employee in each department
SELECT e.first_name, e.last_name, d.department_name, e.salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE (e.salary, e.department_id) IN (
    SELECT MAX(salary), department_id
    FROM employees
    GROUP BY department_id
);

-- Update the salary of an employee
UPDATE employees
SET salary = salary * 1.10  -- Give a 10% raise
WHERE department_id = 1;  -- For the Sales department

-- Delete an employee record
DELETE FROM employees
WHERE employee_id = 5;  -- Delete Alice Davis
