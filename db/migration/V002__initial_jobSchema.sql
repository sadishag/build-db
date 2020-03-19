IF EXISTS (SELECT 1
FROM sys.schemas
WHERE name = 'job')
BEGIN
  DROP SCHEMA [job]
END 
GO

CREATE SCHEMA [job]
      CREATE TABLE [Jobs]
(
  [JobID] [int] IDENTITY(1,1) NOT NULL,
  [Name] [varchar](100) NOT NULL,
  [CommitSHA] [varchar](100) NOT NULL,
  [CreatedAt] [datetime] NOT NULL DEFAULT (getdate()),
  [Status] [varchar](100) NOT NULL
);
GO