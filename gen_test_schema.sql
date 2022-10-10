-- Here we are creating a schema on the database
CREATE SCHEMA [Park_Test];
GO
-- We can create tables inside the schema like this
-- CONSTRAINT lets us add constraints, with a name
CREATE TABLE [Park_Test].[Employee]
    (
        Emp_ssn CHAR(9) NOT NULL,
        CONSTRAINT EmpPK
            PRIMARY KEY (Emp_ssn),
        Emp_name VARCHAR(30) NOT NULL,
        Emp_email VARCHAR(30),
        Emp_payrate SMALLMONEY,
        Emp_start_date DATE NOT NULL,
    );
GO
-- Here we create a role in the database
-- It is a type of user that has specific permissions
-- By default they can't do anything, except what is specifically given to them.
CREATE ROLE HRAdder AUTHORIZATION dbo;
GO
-- These permissions are granted using GRANT
-- Here we give users in the HRAdder role the ability to use SELECT queries on the Employee table.
GRANT SELECT ON [Park_Test].[Employee] TO HRAdder;
GO
