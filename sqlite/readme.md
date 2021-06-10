cat db.sql | sqlite3 database.db
sqlite3 database.db -init dump.sql
