SELECT p.id
FROM pharmacies p
JOIN o IN p._source.openingTimesAsOffset
WHERE ( 600 > o.opens AND 600 < o.closes) AND
ST_DISTANCE(p._source.location, {'type': 'Point', 'coordinates':[-1.46519099452929, 54.0095586395326]}) < 10000


