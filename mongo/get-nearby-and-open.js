function get_results (result) {
  result._id=result._id.valueOf();
  print(tojson(result));
}

db.pharmacies.aggregate([
   {
     $geoNear: {
        near: { type: "Point", coordinates: [ 0.71503746509552, 52.2453918457031 ]  },
        limit: 10,
        distanceField: "distance",
        maxDistance: 5000,
        spherical: true,
        query: { "openingTimesAsOffset": { $elemMatch: { opens: { $lte: 600 }, closes: { $gte: 600 } } } }
     }
   }
]).forEach(get_results);
