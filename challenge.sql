-- Create "Department" table 
DROP TABLE IF EXISTS "Department";
CREATE TABLE "Department"(
	id integer NOT NULL PRIMARY KEY,
	name varchar NOT NULL
);

-- Create "Employee" table
DROP TABLE IF EXISTS "Employee";
CREATE TABLE "Employee"(
	id integer NOT NULL PRIMARY KEY,
	name varchar NOT NULL,
	salary integer NOT NULL,
	"departmentId" integer NOT NULL,
	CONSTRAINT dept_id_fkey FOREIGN KEY ("departmentId")
		REFERENCES "Department" ("id")
);

-- Insert into 
INSERT INTO "Department" (id, name)
VALUES 
(1, 'IT'),
(2, 'Sales');


INSERT INTO "Employee" (id, name, salary, "departmentId")
VALUES
(1, 'Joe', 70000, 1),
(2, 'Jim', 90000, 1),
(3, 'Henry', 80000, 2),
(4, 'Sam', 60000, 2),
(5, 'Max', 90000, 1);

-- Write an SQL query to find employees who have the highest salary in each of the departments. 
-- Return the result table in any order
SELECT 
  dept.name AS "Department", 
  emp.name AS "Employee", 
  emp.Salary AS "Salary"
FROM "Employee" emp
JOIN "Department" dept ON emp."departmentId" = dept.id
WHERE emp.salary = (
  SELECT MAX(salary)
  FROM "Employee"
  WHERE "departmentId" = emp."departmentId"
);