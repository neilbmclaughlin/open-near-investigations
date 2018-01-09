For a locally running instance of MongoDB:

`mongoimport --jsonArray --db orgs --collection pharmacies --upsertFields identifier  ../data/dev-pharmacy-data-201813-10000.json`

`mongo --quiet orgs mongo/get-all.js  | jq -C '.' | less -R`
