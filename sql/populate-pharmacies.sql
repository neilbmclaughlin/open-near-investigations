Declare @json nvarchar(max)

SELECT @json = BulkColumn
FROM OPENROWSET(BULK 'orgs/dev-pharmacy-data-201813.json', DATA_SOURCE = 'MyAzureBlobStorage', SINGLE_CLOB) as j

TRUNCATE TABLE pharmacies;

INSERT INTO pharmacies
SELECT * FROM  
 OPENJSON ( @json )  
WITH (   
    Number varchar(200) '$._source.name' ,  
    Id varchar(200) '$._source.identifier'  
 )
