CREATE TABLE [dbo].[Project]
(
	[ProjectID] INT IDENTITY(1,1) NOT NULL,
	[ProjectTitle] NVARCHAR(50) NULL,
	[Deadline] Datetime NULL,
	PRIMARY KEY CLUSTERED ([ProjectID] ASC)
)
