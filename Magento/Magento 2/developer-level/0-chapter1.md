
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
* If you want to load data we must use the repository class model, like: **vendor/magento/module-catalog/Model/ProductRepository.php**


### /Model/ResourceModel: Database Interactions
* This represent how data will be retrieved an saved in the database
* Any database interaction should happen in these files
* Sample file:  **vendor/magento/module-catalog/Model/ResourceModel/Product.php**

### /Observer: Event Listeners
* Magento will fire an event, listeners that are attached to that event will be called
* Magento Commerce integrates with RabbitMQ which allows even more control and reliability to this process
* Event Listeners must implement the ObserverInterface: **\Magento\Framework\Event\ObserverInterface**
* An observer class must be understandable as the intent of its function
* Class must be following the stand of using **CamelCase** and events must be **snake_case**
* We should avoid to put business logic on an Observer, so you must put the business logic in another location and inject that class into your Observer

### /Plugin: Function Modification
* Plugins are one of the most powerful features in Magento 2
* They allow you to modify or change the functionality for almost any class or interface
* Plugins only work on Objects that are instantiated by the **ObjectManager**
* Plugins can be placed anywhere, but for convention we place in **/Plugin** folder
* Naming suggestion is name the plugin after the **class that is being customized** followed by **Plugin**

#### Plugin example
* Modifying a method in: **\Magento\Catalog\Api\Data\ProductInterface**
* A class must be created in: **[module-dir]/Plugins/Magento/Catalog/ProductPlugin.php**

### /Setup: Database Modification
* At this place we will be using patches
* We will be placing scripts that will be doing:
  * Installations and upgrade of database schema
  * Installing and upgrading data
  * Invoking other operations that are required when magento is installed or upgraded
* Each patch will be localized at table **patch_list**, so if you need to check/run you must do a select:
```mysql
SELECT * 
  FROM patch_list
 WHERE patch_name like "%YourPatchName&"
```
* We aren't controlled by a version, only by the **patch_list execution**

#### Data patch
* A class that contains data modification instructions
* It can have dependencies on other data or schema patches

#### Revertable data patch
* A data patch that contains a revert()
* Revert method will provide operations that revert revertable changes caused by the module.
* Revertable operations are usually related to changes in the database.

#### Migration
* A type of non-revertable data patch that can be applied, but not reverted.
* Any complex operation, such as one that contains an application layer (for example, Collections or Serializers) is non-revertable.
* SQL delete operations are non-revertable because they can cause triggering.

#### Schema patch
* A class that contains custom schema modification instructions
* Schema patches are used along with declarative schema
* Complex operations:
  * Adding triggers, stored procedures, functions
  * Performing data migration with inside DDL operations
  * Renaming tables, columns, and other entities
  * Adding partitions and options to a table

#### Revertable schema patch
* It is the same idea of the Schema Patch but now we will have the revert() method

### /Test
* This is the place for module tests
* Unit tests are localized at: **/Test/Unit**
* You can run a test going to a terminal and doing:
```bash
  bin/magento dev:tests:run  [all, unit, integration, integration-all, static, static-all, integrity, legacy, default]
```

### /Ui: Ui Component Data Providers
* This folder will contain data providers and modifiers for the UI components
* Will be localized the Layout XML Directives: **/view/[area]/layout**
* Layout XML links blocks (/Blocks) with templates, this will control what is displayed

### /view/[area]/templates: Block Templates
* Files over /Block represents the business logic
* Template files represents how the result of the business logic are shown to the user
* The best is to have as little as possible of PHP code over those files

### /view/adminhtml/ui_component
* the **template folder** inside will contain template for the ui element
* this folder contain **xml** configuration files for the **ui component**

### /view/[area]/web
* This will store web assets
* js, css, less, scss

### /view/[area]/web/template
* Contains html templates (that can be asynchronously requested with Javascript)
* These files often contain KnockoutJS declarative bindings

### /view/[area]/requirejs-config.js
* This is the place that will have the requirejs-config file
* This is used to control Javascript Module dependencies

## /etc folder
* module.xml
  * module configuration file
  * this contains the loading order
* acl.xml
  * This defines permission for accessing protected resources
* config.xml
  * This is related to store -> configurations
* crontab.xml
  * this will contain the magento 2 cronjob rules
* di.xml
  * This configures the dependency injection of your modules
  * Plugins are defined here
  * Class substitutions can be done here
  * Concrete classes are specified for interfaces
  * Virtual types setup, and constructor arguments can be specified or modified
* email_templates.xml
  * This is a xml file that will contain each email template and the respective template file
* events.xml
  * This is responsible to create all events that an observer can observ
* indexer
  *  Configure all magento indexes
  * Check: vendor/magento/module-catalog/etc/indexer.xml
* adminhtml/menu.xml
  * Define the admin menu elements
  * Check: vendor/magento/module-customer/etc/adminhtml/menu.xml
* mview.xml
  * This will trigger events when data is modified in a database column
  * Check:  vendor/magento/module-catalog/etc/mview.xml
* [area]/routes.xml
  * this is for the web requests
  * the route configures the first part of the layout handle (route ID) and the frontname
* adminhtml/system.xml
  * Specifies configuration tabs, sections, groups and fields found in Store Configuration.
  * Check vendor/magento/module-customer/etc/adminhtml/system.xml
* view.xml
  * Similar to config.xml but it is used for **specify default values**
* webapi.xml
  * Configures API access and routes
  * Check: : vendor/magento/modulecatalog/etc/webapi.xml
* widget.xml
  * This will configure the widget
  * It can be used in products, CMS pages, and CMS blocks
  * Check:  vendor/magento/module-catalog/etc/widget.xml

## Dependency Injection

### Points to remember
* This is a way to give the class the object that is needed by loading in the constructor
* The ObjectManager makes implementing the Composition over Inheritance principle possible.
* This makes the test easier

### Magento’s dependency injection approach and architecture
* Magento uses constructor injection: that is, all of the dependencies are specified as arguments in the __construct() function.
* Note that it is very poor practice to directly use the ObjectManager—the primary class that handles dependency inject
* Magento DI container holds a list of objects
* Each time that a new object it is created and instantiated to a module
 di.xml this is added into the container
* Unless you clone the object, anywhere you pass the object (as an argument) that
 same object is referenced.

#### Proxy
* For objects that might be time intensive to create, Magento provides proxies.
* A proxy lazy loads the class. To utilize this, **specify a class** like \Magento\Catalog\Model\Product\Proxy **in di.xml**.
* Proxies **must NOT** be specified in the **__constructor method**.

#### Factory
* For objects that need to **be new every time** they are used, Magento uses factories.
* To use a factory, specify the class or interface name and append Factory to the end.
```
Like: \Magento\Catalog\Api\Data\ProductInterfaceFactory. 
1 ) Will search for the reference of ProductInterface
2 ) Will generate a factory for that class 
* note: The default place will always be \Magento\Catalog\Model\Product
```
* The factory has one public method, create.
* Calling this method creates a new instance of the desired class.
* Magento creates these classes automatically. (what command to run?)
* Check:  vendor/magento/module-paypal/Model/IpnFactory.php.

