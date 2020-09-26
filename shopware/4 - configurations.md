# cofigurations

This part you will learn how to configure a different config.php, a development version, with a purpose or difference between live and your local enviroment you must create a new config file, lets call it config_dev.php.

How can we do this?
* copy the config.php: 
```
    $ cp config.php config_dev.php
```
* Edit the file **.htaccess**, uncommenting those lines:
```
# Development environment
#SetEnvIf Host "dev.shopware.in" SHOPWARE_ENV=dev
SetEnv SHOPWARE_ENV dev                              <----  that's the line that you should uncomment
```


