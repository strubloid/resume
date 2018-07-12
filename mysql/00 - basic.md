# How to change a table auto_increment 
TRUNCATE [table];
ALTER TABLE [table] AUTO_INCREMENT=0;

# how to convert a database to utf8
mysql -u root -proot --database=hickeys_blog -B -N -e "SHOW TABLES" | awk '{print "ALTER TABLE", $1, "CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;"}' | mysql -u root -proot --database=hickeys_blog &


# how to create with utf8
```
CREATE DATABASE mydatabase CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```


change database collation:

ALTER DATABASE <database_name> CHARACTER SET utf8 COLLATE utf8_unicode_ci;
change table collation:

ALTER TABLE <table_name> CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;
change column collation:

ALTER TABLE <table_name> MODIFY <column_name> VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci;