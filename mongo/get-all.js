function get_results (result) {
  result._id=result._id.valueOf();
  print(tojson(result));
}

db.getCollection('pharmacies').find().forEach(get_results)
