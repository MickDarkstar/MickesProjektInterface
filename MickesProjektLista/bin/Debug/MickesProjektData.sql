﻿/*
Deployment script for master

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "master"
:setvar DefaultFilePrefix "master"
:setvar DefaultDataPath "C:\Users\Mick\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"
:setvar DefaultLogPath "C:\Users\Mick\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
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
        (1, 'Repair car', '2016-11-01'), 
        (2, 'Paint House', '2016-06-11'), 
        (3, 'Build Fence', '2016-07-12')
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
	(1, 'Buy parts',					1, 1),
	(2, 'Buy paint and paint house',	2, 2),
	(3, 'Paint house',					2, 1),
	(4, 'paint house',					2, 3),
	(5, 'Buy supplies and build fence', 3, 2)
)
AS Source (ProjectDetailsID, Todo, ProjectID, PersonID)
ON Target.ProjectDetailsID = Source.ProjectDetailsID
WHEN NOT MATCHED BY TARGET THEN
INSERT (Todo, ProjectID, PersonID)
VALUES (Todo, ProjectID, PersonID);
GO

GO
PRINT N'Update complete.';


GO