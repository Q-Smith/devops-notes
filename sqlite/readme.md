# Commands

```bash
sqlite3 database.db -init dump.sql
cat creation.sql | sqlite3 -echo database.db
.headers on
.mode column
.show
.tables
.schema <tablename>

cat seed.sql | sqlite3 -echo database.db
.read seed.sql
.quit
```
