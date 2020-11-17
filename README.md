# Bookmarks Manager

## User Stories

```
As a User,
so I can see sites I visit regularly, 
I'd like to be able to show the full list of my bookmarks.
```

## Setting Up The Database

1) Connect to ```psql``` in the command line

2) Create the database using the command ```CREATE DATABASE "bookmarks_manager";```

3) Connect to the newly created database using ```\c bookmarks_manager```

4) Run the query we have saved in the file ```db/migrations/01_create_bookmarks_table.sql```