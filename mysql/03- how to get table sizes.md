# How to get each table size of a schema?
```
    SELECT table_schema as `Database`
         , table_name AS `Table`
         , round(((data_length + index_length) / 1024 / 1024), 2) `Size in MB` 
      FROM information_schema.TABLES 
     WHERE [table schema]
  ORDER BY (data_length + index_length) DESC;
```