Declare @json nvarchar(max)

DROP EXTERNAL DATA SOURCE MyAzureBlobStorage

CREATE EXTERNAL DATA SOURCE MyAzureBlobStorage
WITH ( TYPE = BLOB_STORAGE, LOCATION = 'https://717e866ad101.blob.core.windows.net');

SELECT @json = BulkColumn
FROM OPENROWSET(BULK 'orgs/dev-pharmacy-data-201813.json', DATA_SOURCE = 'MyAzureBlobStorage', SINGLE_CLOB) as j

DROP TABLE pharmacies; 
 
CREATE TABLE pharmacies (
    Number varchar(200) ,  
    Id varchar(200) 
);

INSERT INTO pharmacies
SELECT * FROM  
 OPENJSON ( @json )  
WITH (   
    Number varchar(200) '$._source.name' ,  
    Id varchar(200) '$._source.identifier'  
 )
