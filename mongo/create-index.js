db.pharmacies.createIndex( { "location" : "2dsphere" }, { name: "Location" } )
db.pharmacies.createIndex( { "openingTimesAsOffset" : 1 }, { name: "OpeningTimesAsOffset" } )
