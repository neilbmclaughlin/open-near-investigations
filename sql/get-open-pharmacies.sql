SELECT pharmacies.Id, pharmacies.Name
FROM sessions
INNER JOIN pharmacies ON pharmacies.Id=sessions.Id
WHERE $(secondsAfterMidnight) >= Opens and $(secondsAfterMidnight) <= Closes
