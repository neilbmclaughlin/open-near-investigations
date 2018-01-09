`sqlcmd -S f40cf7518c2a.database.windows.net -d frosty-fox -U <username> -P <password> -h -1 -i list-pharmacies.sql | jq '.'`

`setup.sql` - create tables and indexes

`populate-sessions.sql` and `populate-pharmacies.sql` - insert data from JSON into the tables

The remainder of the `sql` files are various queries on the data
