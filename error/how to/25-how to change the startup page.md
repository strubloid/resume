
1. admin_startup_page it is the key for the store config
2. cms/widget_instance was the instance that i am choosing now, you can check doing:
```
SELECT * 
  FROM from core_config_data
 WHERE path like "%admin/startup/page%"
```
> Note: a good thing to do is also set to cms/page, if you have too many widgets.
