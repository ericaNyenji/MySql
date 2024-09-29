-- 1. Create a table for storing employee information
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    hire_date DATE,
    department VARCHAR(50)
);

-- 2. Insert sample data into the employees table
INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, department)
VALUES 
(1, 'John', 'Doe', 'john.doe@example.com', '2021-01-15', 'Sales'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '2022-03-22', 'Marketing'),
(3, 'Emily', 'Johnson', 'emily.johnson@example.com', '2020-07-30', 'HR');

-- 3. Select all employees from the employees table
SELECT * FROM employees;

-- 4. Find employees hired after January 1, 2021
SELECT * FROM employees
WHERE hire_date > '2021-01-01';

-- 5. Update the department of an employee
UPDATE employees
SET department = 'Human Resources'
WHERE employee_id = 3;

-- 6. Delete an employee from the table
DELETE FROM employees
WHERE employee_id = 2;

-- 7. Count the number of employees in each department
SELECT department, COUNT(*) AS num_employees
FROM employees
GROUP BY department;

-- 8. Get the latest hired employee
SELECT * FROM employees
ORDER BY hire_date DESC
LIMIT 1;
