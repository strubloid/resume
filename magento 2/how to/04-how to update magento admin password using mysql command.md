# How to update magento admin password?

## Mysql approach
```sql
    UPDATE admin_user SET `password` = SHA2('NewPassword', 256) WHERE `username`='admin';
```
