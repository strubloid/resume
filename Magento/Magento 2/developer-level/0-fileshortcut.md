# fileshortcut

# Reading page: 23

## app/etc/NonComposerComponentRegistration.php
* This is responsible to add include the registration.php

## vendor/magento/framework/Component/ComponentRegistrar.php
* This will be responsible to add the module to the static list of components

## vendor/magento/framework/Module/ModuleList/Loader.php
* This file will check what is the order to load modules

## app/etc/config.php
* this file will contain all the modules and the specific status of each module,
if a recent installed module isn't there means that you need to enable it to be
able to see it over there

## vendor/magento/framework/Module/ModuleList/Loader.php
* This file it is responsible for loading all classes by xml configurations, so if you must
debug any xml file you must start from this point


## vendor/magento/magento2-base/setup/src/Magento/Setup/Console/Command/AbstractModuleManageCommand.php
* This will be responsible for the action of turn it on a module, so if you have
any issues with enable a module this is a start point

## vendor/magento/framework/App/FrontController.php
* This is the file that will be responsible for the route, in here you will find
how a route is being mounted and how a controller works, if you are having issues with
a specific route, that is the file to start to check

## vendor/magento/framework/App/Router/Base.php
* This is a default router, this are being used for most of the requests


## vendor/magento/framework/App/Router/NoRouteHandler.php
* this is responsible for all not found routes, so if you are having
issues with a wrong route or not found one, you can start checking this file

### /home/strubloid/Projects/centralbank/vendor/magento/magento2-base/setup/src/Magento/Setup/Model/Installer.php
* This file contains good ways to create a new table that you can use on your Schema patch
