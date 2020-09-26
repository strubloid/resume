# Procedure


## how to check if a procedure exists?
```
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='my_procedure') BEGIN
    print 'exists'  -- or watever you want
END ELSE BEGIN
    print 'doesn''texists'   -- or watever you want
END
```