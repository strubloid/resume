# how to compile less files?

## steps

### Check if you are in developer mode
```bash
    bin/magento deploy:mode:show 
    Current application mode: developer.
```
If you aren't you must use the command: 
```bash
    bin/magento deploy:mode:set developer 
```

### Remove the static frontend and var viewprocessed folders
```bash
    rm -rf pub/static/frontend/ var/view_preprocessed/
```
### Clean all the caches
```bash
    bin/magento cache:clean 
```

## One line command
```bash
    rm -rf pub/static/frontend/ var/view_preprocessed/ && bin/magento cache:clean
``` 

### Extra command
```bash
    bin/magento setup:static-content:deploy
    
    bin/magento setup:static-content:deploy -n en_IE ga_IE en_US -j1
```
#how to shortcut commands?
```bash
    [root@8badb56d4b70 html]# bin/magento ma:disable
    Disabled maintenance mode
```