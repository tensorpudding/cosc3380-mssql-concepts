-- This is a test for creating stored procedures in MSSQL
-- Run this as a db admin user

-- This creates a stored procedure in the Park_Test schema
-- The @ssn/@name are the arguments, and are typed
CREATE PROC [Park_Test].[AddUser]
    @ssn CHAR(9),
    @name VARCHAR(30)
AS
    INSERT INTO [Park_Test].[Employee]
    ([Emp_ssn], [Emp_name], [Emp_start_date])
    VALUES
    (
        @ssn,
        @name,
        GETDATE()
    );
GO
-- Here we can grant privileges to execute the procedure to a role
-- This allows the role to perform "canned" transactions
GRANT EXECUTE ON [Park_Test].[AddUser] TO HRAdder;
GO
-- We do the same as above for the SetPay stored procedure
CREATE PROC [Park_Test].[SetPay]
    @ssn CHAR(9),
    @rate SMALLMONEY
AS
    UPDATE [Park_Test].[Employee]
    SET Emp_payrate = @rate
    WHERE Emp_ssn = @ssn;
GO
GRANT EXECUTE ON [Park_Test].[SetPay] TO HRAdder;
GO