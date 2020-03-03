# fileshortcut

# Reading page: 14

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