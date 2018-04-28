# using mysql aproach

```
INSERT INTO `wp_users` (`user_login`, `user_pass`, `user_nicename`, `user_email`, `user_status`)
VALUES ('newadmin', MD5('pass123'), 'firstname lastname', 'email@example.com', '0');

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) 
VALUES (NULL, (Select max(id) FROM wp_users), 'wp_capabilities', 'a:1:{s:13:"administrator";s:1:"1";}');

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) 
VALUES (NULL, (Select max(id) FROM wp_users), 'wp_user_level', '10');

```


# updating an existent user on wordpress
```
UPDATE homefocu_wordpress.hickeys_users
SET user_login='rafael',user_pass= MD5('rafa1234')
WHERE ID=5;

```

# few things to check for magento and wordpress

> You might need to setuo the correct form value on
```
UPDATE homefocu_wordpress.hickeys_options
SET option_value='http://hickeys.dev/wordpress'
WHERE option_id=1;
UPDATE homefocu_wordpress.hickeys_options
SET option_value='http://hickeys.dev/blog'
WHERE option_id=2;
```
