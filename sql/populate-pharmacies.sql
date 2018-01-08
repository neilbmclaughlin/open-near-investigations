SET QUOTED_IDENTIFIER ON
Declare @json nvarchar(max)

SELECT @json = BulkColumn
FROM OPENROWSET(BULK 'orgs/dev-pharmacy-data-201813.json', DATA_SOURCE = 'MyAzureBlobStorage', SINGLE_CLOB) as j

TRUNCATE TABLE pharmacies;

INSERT INTO pharmacies(Id, Name, Location)
SELECT Id, Name, geography::STGeomFromText('POINT ('+ Lon + ' ' + Lat + ')', 4326) FROM  
 OPENJSON ( @json )  
WITH (   
    Id varchar(20) '$._source.identifier',
    Name varchar(200) '$._source.name',
    Lat varchar(100) '$._source.location.coordinates[1]',
    Lon varchar(100) '$._source.location.coordinates[0]'
)
