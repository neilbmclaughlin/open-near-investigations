# open-near-investigations

Place for creating scripts to test querying by proximity, openness and text matching in different data stores

## Background

This repo forms the basis for investigations into Azure technologies which are able to be used to query organisations by proximity to a location and openness. The technologies investigated were Azure Cosmos DB (using the SQL and MongoDB API's) and Azure SQL server. The environment used for evaluation was my MSDN Azure subscription. For completeness I have also included MongoDB queries which work in MongoDB 3.6 but are not yet supported in the Cosmos DB MongoDB API.

## Findings

Azure Cosmos DB
- Able to support querying by proximity to a location and openness in both the SQL and Mongo API's. The SQL API's are limited in that it is not possible to identify the nearest _n_ locations to the reference point within the queries. To achieve this requires handling at the application level. In specific terms the SQL API does not support an `ORDER BY` clause. Although the MongoDB API does not support the $geoNear aggregation a functional equivilent can be created throught the use of the $match, $sort and $filter aggregations (I don't yet have an example of this). According to [this](https://twitter.com/AlekseyMSFT/status/950749743612751877?s=09) tweet $geoNear will be added later this year. There is no support for fuzzy text search. 

Azure SQL Server
- T-SQL support for JSON in Azure SQL Server is well developed and, as the scripts show ([here](/sql)), it is possible to parse the current pharmacy JSON into SQL tables with an indexed column for geolocation as well as an indexed related table of opening times. This allows the the nearest _n_ organisations to the reference point which are open to be easily identified.  There is also no support for fuzzy text search.

## Conclusion

While the Azure technologies are promising there is some lack of maturity in the API's (especially in Cosmos DB) and in neither case do they support complex querying of text. The Mongo API requires the use of aggregations which are currently in preview and are, therefore, not recommended for production use. Azure does have Azure Search which is a search service   supporting complex querying of text but at this point it was not explored as Elastic Search supports all requirements within a single service.
