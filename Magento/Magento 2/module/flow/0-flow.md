# Module creation Flow

## Main flow
* Create namespace under app/code, let's call **Monsoon**
* Create a name of the module, let's call **Maintenance**
* Inside of the Module Maintenance you must create the first file called **registration.php**
* This file must contain this structure below:
```php
<?php
    \Magento\Framework\Component\ComponentRegistrar::register(
      \Magento\Framework\Component\ComponentRegistrar::MODULE,
      'Monsoon_Maintenance',
      __DIR__
    );
```
> note: as  you can see, the second parameter is related to yournamespace_yourmodulename, in our case Monsoon_Maintenance
* now you must create a folder called **etc** and create a file called module.xml
```xml
    <?xml version="1.0"?>
    <config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="urn:magento:framework:Module/etc/module.xsd">
        <module name="Monsoon_Maintenance" setup_version="1.0.0" />
    </config>
```
> note: as you can see in the module name it is yournamespace_yourmodulename, in our case Monsoon_Maintenance
* (optional) to generate the validation on php you must do the following
```bash
    bin/magento dev:urn-catalog:generate .idea/misc.xml
```
* Creation of the composer.json file, you must follow the pattern below:
```json
{
  "name" : "Monsoon_Maintenance",
  "description" : "Monsoon Maintenance module",
  "type" : "magento2-module",
  "version": "1.0.0",
  "require" : {
    "php" : ">>=5.5.22|~5.6.0|7.0.2|7.0.4|~7.0.6",
    "magento/framework" : "100.0.*|100.1.*"
  },
  "repositories": {
    "type" : "composer",
    "url" : "https://repo.magento.com"
  },
  "minimum-stability": "stable",
  "autoload": {
    "files" : [
      "registration.php"
    ],
    "psr-4": {
      "Monsoon\\Maintenance\\" : ""
    }
  }
}
```
> note: just change whatever we have **Monsoon** to your namespace and **Maintenance** to your module name
* after that we can check the status of the module doing:
```bash
    bin/magento module:status
```



