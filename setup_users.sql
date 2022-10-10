-- This is how we can create new users
-- First we create a LOGIN, which exists between multiple databases
-- Then logins can create users specific to a database, which can have different roles
CREATE LOGIN fernando WITH password='one,bluff61leigh';
CREATE LOGIN phillip WITH password='koch#frock59flush';
CREATE LOGIN josh WITH password='gospel@sib28fund';
CREATE LOGIN carissa WITH password='porch&dog77banks';
GO
-- This is a fake login for a regular user that will be allowed to do HR tasks
CREATE LOGIN hrdrone WITH password='chubbyemu999!';
GO
CREATE USER fernando FROM LOGIN fernando;
CREATE USER carissa FROM LOGIN carissa;
CREATE USER josh FROM LOGIN josh;
CREATE USER phillip FROM LOGIN phillip;
-- Here we assign these users to the owner role
-- This means the users will be allowed to create and modify any schema they want
ALTER ROLE db_owner ADD MEMBER fernando;
ALTER ROLE db_owner ADD MEMBER carissa;
ALTER ROLE db_owner ADD MEMBER josh;
ALTER ROLE db_owner ADD MEMBER phillip;
GO
-- Here we are creating a user for the "HRAdder" role
CREATE USER hrdrone FROM LOGIN hrdrone;
ALTER ROLE HRAdder ADD MEMBER hrdrone;
GO