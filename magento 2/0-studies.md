# What I'd learned until now is:

# Magento module
```Module it is a place that will might contain:```
* blocks
* controllers
* helpers
* models
> A module will encapsulate one feature and all dependencies

## When should I create a module?
```
    A module purpose is to provide specific product features by implementing a new functionality
    or extending a new one from another module.
```

## Difference between module and theme
* A module provide business features, so inside of it will have logic and coding
* A theme is literally the frontend of magento 2

## Resemblance between module and theme
* both are allowed to be installed, deleted and disabled

## Module folder structure

### vendor modules
* A module typically live in the **vendor** directory of a base magento installation
* A module follows a PSR-0 format:  **vendor/<vendor>/<type>-<module-name>**, where **type** can be:
    * module: for modules
    * theme: for frontend or admin themes
    * language: for language packs

### local modules
> For new modules you must add inside of:
```
    app/code/<vendor>/<type>-<module-name>
```    

## Magento module Areas
> Magento is organized in 3 main areas:
* Magento Admin(**adminhtml**): entry point fo the **index.php** or **pub/index.php**, The **app/design/adminhtml** directory contains all the code for all components into the admin panel
* Storefront (**frontned**): entry point fo the **index.php** or **pub/index.php**, this contains all templates and layout files that defines your storefront
* Basic (**base**): used as a fallback if we can't find **adminhtml** or **frontend** code implemented
* Cron (**crontab**): the file cron.php we have \Magento\Framework\App\Cron class that will load all **crrontab** area
* Web API REST (**webapi_rest**): entry point fo the **index.php** or **pub/index.php**,  The REST area has a front controller that understands how to do URL lookups for REST-based URLs.
* Web API SOAP (**webapi_soap**): entry point fo the **index.php** or **pub/index.php**, responsible to understand soap objects

## Quick view of module/area interactions
* Modules should not depend on other modules’ areas.
* Disabling an area does not result in disabling the modules related to it.
* Areas are registered in the Dependency Injection framework di.xml file.


## Request Process
> Magento processes a URL request by first stripping off the base URL. 
* The first path segment of the remaining URL identifies the request area.
* Magento extracts the handle from the URL and interprets it as follows: [frontName]/[controller folder]/[controller class]
```
    So we have as an example:
    - catalog/product_compare/add
    
    Goes to:
    Magento/Catalog/Controller/Product/Compare/Add.php
    
    Note that only the execute() method of any given controller is executed.
```
  
