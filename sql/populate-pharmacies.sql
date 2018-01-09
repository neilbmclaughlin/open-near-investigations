SET QUOTED_IDENTIFIER ON
Declare @json nvarchar(max)

SELECT @json = BulkColumn
FROM OPENROWSET(BULK 'orgs/dev-pharmacy-data-201813-10000.json', DATA_SOURCE = 'MyAzureBlobStorage', SINGLE_CLOB) as j

TRUNCATE TABLE pharmacies;

INSERT INTO pharmacies(Id, Name, Location, JsonDocument)
SELECT Id, Name, geography::STGeomFromText('POINT ('+ Lon + ' ' + Lat + ')', 4326), JsonDocument
FROM  
 OPENJSON ( @json )  
WITH (   
    Id varchar(20) '$.identifier',
    Name varchar(200) '$.name',
    Lat varchar(100) '$.location.coordinates[1]',
    Lon varchar(100) '$.location.coordinates[0]',
    JsonDocument nvarchar(MAX) '$' AS JSON
)
