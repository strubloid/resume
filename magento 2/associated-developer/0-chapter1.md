
## Magento Architecture

### Five areas
* adminhtml
* frontend
* base
* webapi_rest
* webapi_soap
* cron
* Module areas reference: https://devdocs.magento.com/guides/v2.3/architecture/archi_perspectives/components/modules/mod_and_areas.html

## Basic configuration files to start a module
* [module-root]/registration.php
* [module-root]/etc/module.xml
* [module-root]/composer.json

## Module lives in
* app/code/ModuleVendor/ModuleName
* vendor/ModuleVendor/ModuleName

## Composer
* it is responsible to upgrade all modules versions
* the **vendor** folder it's considered **untouchable**
* our **vendor** folder reduces technical debt as you no longer have to directly manage the versions of these modules
 composer does it for you

## Registration.php
* This is the file that will configure the basic elements that this module needs
* This file will be added by the composer autoloader file **app/etc/NonComposerComponentRegistration.php**
* This adds the module to the static list of components in the ComponentRegistrar **vendor/magento/framework/Component/ComponentRegistrar.php**
* Once that we have registered in the ComponentRegistrar Magento will look for the **etc/module.xml** file
```php
<?php
declare(strict_types=1);

\Magento\Framework\Component\ComponentRegistrar::register(
    \Magento\Framework\Component\ComponentRegistrar::MODULE,
    'Centralbank_Validator',
    __DIR__
);
```

## etc/module.xml
* This will be responsible for the loading sequence
* The loading sequence means what is required to have this module
* The sequence tells the Loader (vendor/magento/framework/Module/ModuleList/Loader.php)
in which order to load modules
* Any configuration only will be active if the module it is active
* the list of available modules are: **app/etc/config.php**
* The sequence is useful for **events**,**plugins** , **preferences** **and layouts**,
although events listeners should never be dependent on the order in which they are called
```xml
<?xml version="1.0"?>
<config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="urn:magento:framework:Module/etc/module.xsd">
    <module name="Centralbank_Validator">
        <sequence>
            <module name="Magento_Catalog" />
            <module name="Magento_LayeredNavigation" />
        </sequence>
    </module>
</config>
```
* reference to observers: https://devdocs.magento.com/guides/v2.3/ext-best-practices/extension-coding/observers-bp.html

### Module limitations
* a module it is completely contained within the module's directory [app/code/vendor-module/module-name]
 all customizations are made within that folder
* if a module is **disabled**, the module isn't functional and disabling it doesn't automatically remove
 it tables or entries in the database level

### Issues with enabling module you should do:
*  Check if the required files are present
* check if the module it is enabled:
```bash
  bin/magento module:status Centralbank_Validator

  Module is enabled
```
* if isn't enabled you must do the following:
```bash
  bin/magento module:enable Centralbank_Validator  
```


## How do different modules interact with each other?
* Magento 2 it is PSR-4 compliant, this standard declares that the namespace path will match the file path to the class
* In the root folder you will find a composer.json, and inside of this file you will find a psr-0 node
that will be app/code value, this has the same effect of adding an include directory for PHP to search
* These service contracts are stored in the **app/code/vendor-module/module-name/Api** Directory
* Data representations are defined in **app/code/vendor-module/module-name/Api/Data** folder


## Magento Service Contracts introduction
* https://alankent.me/2014/10/31/magento-2-service-contract-patterns/

## What side effects can come from this?
* Any time a module can extend a core functionality, fallout can happen
* It is good to assume that other modules will change in the system, so a module can introduce
changes for a product, but if a custom method exist on \Magento\Catalog\Model\Product you might face
a fatal error when it attempts to call a method that does not exist.
* When is necessary work with a Magento-definied class that have a service contracts (Api/ or Api/Data)
you must use those interfaces instead of the  concrete classes that implement the service contracts, make
the implicit dependency explicit by depending on the concrete implementation instead of the service contract interface

## Magento Directory Stucture

### /Api: Service Contracts
* This folder contains contracts for modules that contain specific actions that can be
used from various places in the app.

### /Api/Data: Data Service Contracts
* This folder contains interfaces that represent data, this can have only getter and setters
but mainly needs to be responsible to get the data and apply object rules over it

### /Block: View Models
* This provide all the business logic for the view part (template files)
* On Magento 2 MVVM (Model, view, view-model) Blocks are view models
* This shouldn't contain rendering functionality
* Block it is responsible for outputting its contents and the view model handles the logic
```xml
<block name="product.promotions" template="AcmeWidgets_ProductPromoter::promotions.phtml" >
    <arguments>
        <argument name="viewModel" xsi:type="object">AcmeWidgets\ProductPromoter\Block\Promotions</argument>
    </arguments>
</block>
```

### /Console: Console Commands
* This will be the place that will store commands that will be showing on **bin/magento** list
* Good example (**bin/magento catalog:productattributes:cleanup**) you can find on
vendor/magento/module-catalog/Console/Command/ProductAttributesCleanUp.php

### /Controller: Web request Handlers
* When a page is requested, the path is parsed out and matched to parameters found in routes.xml and files are found here

### /Controller/Adminhtml
* Admin controllers are spread through their respective and applicable modules

### /Cron: Cron Job Classes
* This folder is the standard place for storing actions that are executed on a schedule (cronjobs)

### /etc: Configuration files
* You can find files like: **module.xml**, **contrab.xml**, **config.xml**, **webapi.xml**, **di.xml**
* all files over **/etc** folder are global
* if you want to create a rule for frontend, you must put inside of **/etc/frontend/** and
if you want to add to the admin part you must add over **/etc/adminhtml/**
* Example of a global file: **/etc/acl.xml**
* Example of a specific files: **/etc/frontend/routes.xml** or **/etc/frontend/sections.xml**
* Example of a global and specific files: **/etc/frontend/di.xml** and **/etc/adminhtml/di.xml**

### /Helper: Occasionaly useful for small, reusable code
* Here are good rules to apply for functionality
* Every method should be capable of being declared static
* No transient data (other than injected classes) is stored ina  helper class

### /i18n: Translation CSV Files
* This is responsible for all module's translations CSV files
* These are CSV files with two columns: **From**,**To**

### /Model: Data Handling and Structures
* This is place to put your models
* Must handle anything related to the data structure
* Product Model you can find on: **vendor/magento/module-catalog/Model/Product.php**





