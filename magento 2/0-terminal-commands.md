# List of most usefull commands to run into a docker container for magento 2

## bin/magento dev:urn-catalog:generate [IDE file]
This command will be allowing to generate the structure for autocomplete/navegate things
```
    bin/magento dev:urn-catalog:generate .idea/misc.xml
```
> this is an example of how to configure the phpstorm file

## bin/magento module:enable [Module Name]
This command will need to run after create a new module
```
    bin/magento module:enable Monsoon_Beer
```

## bin/magento setup:install
```
    bin/magento setup:install
```
> this command is for the installation of the module

## bin/magento setup:upgrade
```
    bin/magento setup:upgrade
```
> This command it is for run all the setup upgrades for each module into magento 2
 
##  bin/magento deploy:mode:show
> how to see the deploy mode

## check who invalidate who is clean for sure (removing completely)
```
bin/magento cache:clean
bin/magento cache:flush
```

