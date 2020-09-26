# how change things on plugin.xml
> note: this file will be the configuration data of your new plugin.

* make the changes on your **plugin.xml** file
* you need restart your plugin with a command:
```
    bin/console sw:plugin:uninstall [plugin-name]; 
    bin/console sw:plugin:install [plugin-name] --activate;
```
* you also must to clean the caches
```
    bin/console sw:cache:clear
```
