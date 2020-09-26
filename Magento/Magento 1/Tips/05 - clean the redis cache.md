# Cache clean for redis

## Steps to follow
* Login to ssh
* Enter the correct folder that contains a project with redis in it
* Do the redis login

## How to check for all keys in this project?
```
info keyspace
```

You will get something like this as return

```
    db0:keys=1460,expires=918,avg_ttl=8818105
    db2:keys=7363,expires=6194,avg_ttl=70300887
    db10:keys=151,expires=77,avg_ttl=6961266
    db12:keys=36,expires=4,avg_ttl=86159693
```
Note: Some companies create those keys db`[n]` to be live, db`[nn]` to be stage environments, as you can see a good example below:
```
  Production Environment
  db0 = magento cache
  db1 = session data 
  db2 = full page cache
  
  Stage Environment
  db10 = magento cache
  db11 = session data 
  db12 = full page cache
```

## How to clean a specific key?
* You must select the key
* You must run **flushdb** command
* And when you are done, you must exit

### Example
```
    select 10
    flushdb
    
    select 12
    flushdb
    
    exit
```

What happened here?
* Was selected the stage server as starts with 2 characters key
* Selected the key 10 = that was the magento cache key
* Was flushed the database with the command **flushdb**
* The same thin was done for full page cache

