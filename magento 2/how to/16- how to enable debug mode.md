## How to enable debug mode?
* reference: https://www.magestore.com/magento-2-tutorial/debug-technique-in-magento-2/

## steps to get there
1 - Enable developer mode
```bash
    php bin/magento deploy:mode:set developer
```
2 - Change line in .htaccess to have:
```
    SetEnv MAGE_MODE developer
```
3 - Add local.xml configuration under pub/errors/local.xml
* Just copy from local.xml.sample 
```bash
    cp pub/errors/local.xml.sample pub/errors/local.xml 
```
4 - Open the app/bootstrap.php, and uncomment the line:
```php
    // from
    # ini_set('display_errors', 1);
    
    // to 
    ini_set('display_errors', 1);
```
