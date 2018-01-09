# open-near-investigations

Place for creating scripts to test querying by proximity, openness and text matching in different data stores

## Background

This repo forms the basis for investigations into Azure technologies which are able to be used to query organisations by proximity to a location and openness. The technologies investigated were Azure Cosmos DB (SQL and MongoDB API's) and Azure SQL server. The environment used for evaluation was my MSDN Azure subscription. For completeness I also included MongoDB queries which work in MongoDB 3.2 but are not yet supported in the Cosmos DB MongoDB API.

## Findings

Azure Cosmos DB
- Able to support querying by proximity to a location and openness in both the SQL and Mongo API's. The API's are, however, limited in that it is not possible to identify the nearest _n_ locations to the reference point within the queries. To achieve this requires handling at the application level. In specific terms the SQL API does not support an `ORDER BY` clause and the MongoDB API does not support the $geoNear aggregation. There is no support for fuzzy text search. 

Azure SQL Server
- T-SQL support for JSON in Azure SQL Server is well developed and as the scripts show ([here](/sql)) it is possible to parse the current pharmacy JSON into SQL tables with an indexed column for geolocation as well as an indexed related table of opening times. This allows the the nearest _n_ organisations to the reference point which are open to be easily identified.  There is also no support for fuzzy text search.

## Conclusion

While the Azure technologies are promising there is some lack of maturity in the API's (especially in Cosmos DB) and in neither case do they support complex querying of text. Azure does have a search service which supports complex querying of text but at this point it was not explored as Elastic Search supports all requirements within a single service.
