DECLARE @g geography = 'POINT(-1.46519099452929 54.0095586395326 )';

SELECT TOP(1) pharmacies.JsonDocument
FROM pharmacies
WHERE Location.STDistance(@g) IS NOT NULL
ORDER BY Location.STDistance(@g);
