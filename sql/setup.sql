DROP EXTERNAL DATA SOURCE MyAzureBlobStorage

CREATE EXTERNAL DATA SOURCE MyAzureBlobStorage
WITH ( TYPE = BLOB_STORAGE, LOCATION = 'https://717e866ad101.blob.core.windows.net');

IF OBJECT_ID('dbo.pharmacies', 'U') IS NOT NULL
  DROP TABLE dbo.pharmacies; 
 
CREATE TABLE pharmacies (
    Number varchar(200) ,  
    Id varchar(200) 
);
