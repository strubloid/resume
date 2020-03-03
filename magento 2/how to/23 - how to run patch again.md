# How to run a patch again?


## Search for the patch
```mysql
SELECT * 
  FROM magento.patch_list
 WHERE patch_name like "%UpgradeValidatorCustomerStreetField"
```

## Delete the item
```mysql
DELETE FROM magento.patch_list
WHERE patch_name like "%UpgradeValidatorCustomerStreetField"
```