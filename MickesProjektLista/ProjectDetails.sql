CREATE TABLE [dbo].[ProjectDetails]
(
	[ProjectDetailsID] INT IDENTITY(1,1) NOT NULL,
	[ProjectID] INT NOT NULL,
	[PersonID] INT NOT NULL,
	[Todo] NVARCHAR(50) NULL,
	PRIMARY KEY CLUSTERED ([ProjectDetailsID] ASC),
    CONSTRAINT [FK_dbo.ProjectDetails_dbo.Project_ProjectID] FOREIGN KEY ([ProjectID]) 
        REFERENCES [dbo].[Project] ([ProjectID]) ON DELETE CASCADE,
    CONSTRAINT [FK_dbo.ProjectDetails_dbo.Person_PersonID] FOREIGN KEY ([PersonID]) 
        REFERENCES [dbo].[Person] ([PersonID]) ON DELETE CASCADE
)
