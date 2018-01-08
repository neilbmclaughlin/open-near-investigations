Declare @json nvarchar(max)

SELECT @json = BulkColumn
FROM OPENROWSET(BULK 'orgs/dev-pharmacy-data-201813.json', DATA_SOURCE = 'MyAzureBlobStorage', SINGLE_CLOB) as j

TRUNCATE TABLE sessions;

INSERT INTO sessions
SELECT Pharmacies.Id, Sessions.Opens, Sessions.Closes FROM  
 OPENJSON ( @json )  
WITH (   
    Id varchar(20) '$._source.identifier',
    OpeningTimesAsOffset nvarchar(MAX) '$._source.openingTimesAsOffset' AS JSON
) AS Pharmacies
CROSS APPLY OPENJSON(Pharmacies.OpeningTimesAsOffset)
WITH (
  Opens integer '$.opens',
  Closes integer '$.closes'
) AS Sessions
