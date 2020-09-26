# how to create a new customer?

## backend option
* login backend
* Customers -> All customers
* Add New Customer 

## password change
* go to mysql console and search for your user doing:

```mysql
    SELECT *
      FROM customer_entity
     WHERE email like "%[the registered email]%" 
```

### Example of customer
```mysql
    SELECT *
      FROM customer_entity
     WHERE email like "%rafael.mendes%" 

    entity_id|website_id|email                              |group_id|increment_id|store_id|created_at         |updated_at         |is_active|disable_auto_group_change|created_in|prefix|firstname|middlename|lastname|suffix|dob       |password_hash|rp_token                        |rp_token_created_at|default_billing|default_shipping|taxvat|confirmation|gender|failures_num|first_failure      |lock_expires|
    ---------|----------|-----------------------------------|--------|------------|--------|-------------------|-------------------|---------|-------------------------|----------|------|---------|----------|--------|------|----------|-------------|--------------------------------|-------------------|---------------|----------------|------|------------|------|------------|-------------------|------------|
          362|         1|rafael.mendes@monsoonconsulting.com|       8|            |       1|2019-07-04 14:23:45|2019-07-04 14:32:41|        1|                        0|English   |      |rafael   |          |mendes  |      |1986-03-04|             |5baeddad8ceb47e5cdada7d80ba450c9|2019-07-04 14:32:41|               |                |      |            |     1|           1|2019-07-04 14:32:12|            |    
```
> Now that you have the **entity_id** of your new user you can use this number to update the password, doing:
```mysql
    UPDATE `customer_entity` 
       SET `password_hash` = CONCAT(SHA2('xxxxxxxxYOURPASSWORD', 256), ':xxxxxxxx:1')
     WHERE `entity_id` = '[the-response-from-your-previous-query]';
```

### Example of update 
```mysql
    
    UPDATE `customer_entity` 
       SET `password_hash` = CONCAT(SHA2('xxxxxxxxrafa1234', 256), ':xxxxxxxx:1')
     WHERE `entity_id` = '362';
```

### How to unlock the user?
* Todo: isn't right, check it again
1 - Search your user on customer_entity
```mysql
    SELECT * 
      FROM customer_entity
     WHERE email like "%@monsoonconsulting.com%"
```
2 - check that it is clean the column **lock_expires**
3 - add a date bigger than today's date: ```2029-01-20 12:35:19```
4 - save

### how to disable the customer confirmation for localhost?
* select command
```mysql
SELECT * 
  FROM core_config_data
 WHERE path like "%customer/create_account/confirm%"
```
* upgrade command
```mysql
 UPDATE core_config_data
    SET value = 0
 WHERE path like "%customer/create_account/confirm%"
```