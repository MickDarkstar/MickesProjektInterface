/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
MERGE INTO Project AS Target 
USING (VALUES 
        (1, 'Laga bilen', '2016-11-01'), 
        (2, 'Måla huset', '2016-06-11'), 
        (3, 'Bygg staket', '2016-07-12')
) 
AS Source (ProjectID, ProjectTitle, Deadline) 
ON Target.ProjectID = Source.ProjectID 
WHEN NOT MATCHED BY TARGET THEN 
INSERT (ProjectTitle, Deadline) 
VALUES (ProjectTitle, Deadline);


MERGE INTO Person AS Target
USING (VALUES 
        (1, 'Fehrm', 'Micke', '0707070707'), 
        (2, 'Grahn', 'Dawid', '0730707070'), 
		(3, 'Nilsson', 'Pähr', '0730730730')
)
AS Source (PersonID, LastName, FirstName, PhoneNr)
ON Target.PersonID = Source.PersonID
WHEN NOT MATCHED BY TARGET THEN
INSERT (LastName, FirstName, PhoneNr)
VALUES (LastName, FirstName, PhoneNr);


MERGE INTO ProjectDetails AS Target
USING (VALUES 
	(1, 'Köp delar',					1, 1),
	(2, 'Köp färg och måla huset',	2, 2),
	(3, 'Måla huset',					2, 1),
	(4, 'Måla huset',					2, 3),
	(5, 'Köp material och bygg staket', 3, 2)
)
AS Source (ProjectDetailsID, Todo, ProjectID, PersonID)
ON Target.ProjectDetailsID = Source.ProjectDetailsID
WHEN NOT MATCHED BY TARGET THEN
INSERT (Todo, ProjectID, PersonID)
VALUES (Todo, ProjectID, PersonID);