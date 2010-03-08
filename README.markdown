Import schema from Google Transit feed spec data. Does not use Rails conventions in order to maintain the schema of the GTFS spec.

Which Rails conventions are ignored?
---
 - no generated "id" column for models
 - no generated timestamp columns
 - if a date column cannot be parsed, set column type to String
 - does not take advantage of ActiveRecord associations


Most columns are imported. Missing columns were not used by the author and the Google Transit data the app was designed for, but can be added should they be useful in working with Google Transit data from other agencies.


See available rake tasks
---
rake -T gtfs


Importing the Metro Transit feed data is expensive. The StopTimes model has over 1.5 million records. This took around 4 hours to import on my 3.0Ghz i5 iMac.

    ~/Projects/gtfs-helper[master]% time rake gtfs:import:all
    (in /Users/andy/Projects/gtfs-helper)
    Importing trips...25486 imported.
    Importing routes...214 imported.
    Importing stop times...1463421 imported.
    Importing stops...14793 imported.
    Importing Calendars...5 imported.
    rake gtfs:import:all  13961.78s user 119.42s system 95% cpu 4:06:04.32 total
