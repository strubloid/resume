# How to change a table auto_increment
```sql
TRUNCATE [table];
ALTER TABLE [table] AUTO_INCREMENT=0;
```
# how to convert a database to utf8
```bash
mysql -u root -proot --database=hickeys_blog -B -N -e "SHOW TABLES" | awk '{print "ALTER TABLE", $1, "CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;"}' | mysql -u root -proot --database=hickeys_blog &
```


# how to create with utf8
```sql
CREATE DATABASE mydatabase CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```


## change database collation:
```sql
ALTER DATABASE <database_name> CHARACTER SET utf8 COLLATE utf8_unicode_ci;
change table collation:

ALTER TABLE <table_name> CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;
change column collation:

ALTER TABLE <table_name> MODIFY <column_name> VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER DATABASE `mcelhinneys_blog`
DEFAULT CHARACTER SET utf8mb4
DEFAULT COLLATE utf8mb4_unicode_ci;
```

## DML,DDL,DCL and TCT comamnds
* source: https://blog.sqlauthority.com/2009/05/02/sql-server-example-of-ddl-dml-dcl-and-tcl-commands/

### DML
* DML is abbreviation of Data Manipulation Language.
* It is used to retrieve, store, modify, delete, insert and update data in database.
```
SELECT – Retrieves data from a table
INSERT – Inserts data into a table
UPDATE – Updates existing data into a table
DELETE – Deletes all records from a table
```

### DDL
* DDL is abbreviation of Data Definition Language.
* It is used to create and modify the structure of database objects in database.
```
CREATE   – Creates objects in the database
ALTER    – Alters objects of the database
DROP     – Deletes objects of the database
TRUNCATE – Deletes all records from a table and resets table identity to initial value.
```

### DCL
* DCL is abbreviation of Data Control Language.
* It is used to create roles, permissions, and referential integrity as well
  it is used to control access to database by securing it.
```
GRANT – Gives user’s access privileges to database
REVOKE – Withdraws user’s access privileges to database given with the GRANT command
```

### TCT
* TCL is abbreviation of Transactional Control Language.
* It is used to manage different transactions occurring within a database.
```
COMMIT           – Saves work done in transactions
ROLLBACK         – Restores database to original state since the last COMMIT
                   command in transactions
SAVE TRANSACTION – Sets a savepoint within a transaction
```