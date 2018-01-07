sqlcmd -S f40cf7518c2a.database.windows.net -d frosty-fox -U <username> -P <password> -h -1 -i list-pharmacies.sql | jq '.'
