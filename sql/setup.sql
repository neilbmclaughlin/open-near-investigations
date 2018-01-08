SET QUOTED_IDENTIFIER ON

DROP EXTERNAL DATA SOURCE MyAzureBlobStorage

CREATE EXTERNAL DATA SOURCE MyAzureBlobStorage
WITH ( TYPE = BLOB_STORAGE, LOCATION = 'https://717e866ad101.blob.core.windows.net');

IF OBJECT_ID('dbo.pharmacies', 'U') IS NOT NULL
  DROP TABLE dbo.pharmacies; 
 
CREATE TABLE pharmacies (
    Id varchar(20),
    Name varchar(200),
    Location Geography,
    CONSTRAINT PK_pharmacies PRIMARY KEY CLUSTERED (Id)
);

CREATE SPATIAL INDEX spatialidx ON pharmacies(Location);

IF OBJECT_ID('dbo.sessions', 'U') IS NOT NULL
  DROP TABLE dbo.sessions; 
 
CREATE TABLE sessions (
    Id varchar(20),
    Opens integer,
    Closes integer,
    INDEX sessionsidx (Opens, Closes)
);

