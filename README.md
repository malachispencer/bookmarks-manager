# Bookmarks Manager

## User Stories

```
As a User,
so I can see sites I visit regularly, 
I'd like to be able to show the full list of my bookmarks.
```

```
As a User,
so I can save a site I visit regularly,
I'd like to be able to add a bookmark to my manager.
```

## Setting Up The Database

1) Connect to ```psql``` in the command line.

2) Create the database using the command ```CREATE DATABASE "bookmarks_manager";```.

3) Connect to the newly created database using ```\c bookmarks_manager```.

4) Run the queries saved in the files in  ```db/migrations``` to set up the appropriate tables.

5) To set up the test database, repeat steps 2 and 3 in ```psql``` with ```bookmarks_manager_test```.