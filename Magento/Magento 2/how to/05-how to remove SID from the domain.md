# How to remove the SID from the page domain
> reference: https://www.shoaibrehman.com/solved-remove-sid-session_id-url-magento-2/

## You must follow:
1 - Login to backend 
2 - Store -> Configuration
3 - General tab -> Web
4 - Session validation Settings
5 - untick the **use system value** 
6 - change the value to **no**
7 - save

## where is localized the main config.xml for this changes? 
1 - Go to vendor/magento/module-store/etc/config.xml
2 - inside of this file you will find the <default> block that stand for main default configuration of m2
3 - for our case you must go to the ```<web> -> <session> -> <use_frontend_sid>``` and change the value to 0, if you want to see this working be aware that you must clean the caches after

### How to figure it out this previous steps ?
1 - go to the magento admin place that we have on the first topic of this file
2 - click to inspect the element Use SID on Storefront, you will get something like this:
```html
    <select id="web_session_use_frontend_sid" name="groups[session][fields][use_frontend_sid][value]">
        <option value="1" selected="selected">Yes</option>
        <option value="0">No</option>
    </select>
```
> note: as you can see we have the id = **web_session_use_frontend_sid**, this means ```<web> -> <session> -> <use_frontend_sid>```

### how to check this in database level?
```sql
    SELECT * 
      FROM core_config_data
     WHERE path like "%use_frontend_sid%";
```
> note: this can be stored by store scope, so be aware that 0 it is the main scope, 
that will be the default value and the other ones will be refereed to the store code.


