# magento structure

## where should I put code of a new module?
> [root-folder]/app/code

## you must specify the namespace (first letter must be uppercase)
> [root-folder]/app/code/Namespace

## sample of a module place
> [root-folder]/app/code/Rafael/Project

## [root-folder]/registration.php
```
\Magento\Framework\Component\ComponentRegistrar::register(
    \Magento\Framework\Component\ComponentRegistrar::MODULE,
    'Rafael_Project',
    __DIR__
);
```

## [root-folder]/etc/module.xml
```

<?xml verion="1.0">
<config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocaltion="urn:magento:framework:Module/etc/module.xsd">
    <module name="Rafael_Project" setup_version="1.0.0">
        <sequence>
            <module name="Magento_Catalog" />
        </sequence>
    </module>
</config>
```

### fixing phpstorm issue with urn
1. go to a terminal and be at [root-folder]
2. run the magento executable into bin folder using the command:
```
bin/magendo dev:urn-catalog:generate .idea/misc.xml
```


## How to enable a module?
1. go to a terminal
2. use the magento binary to enable the module using the following command:
```
    bin/magento module:enable Rafael_Project
```

## Where should I check if the module is enabled?
1. go to app/etc/config.php
2. at this file we will get an array of modules with each index being the name of the module and the value it is a boolean that represents if the module is enabled or disabled (1 = enabled and 0 is disabled)
> the sequence of this file will be a sequence to be loaded as well, this sounds like a thing to avoid issues with dependencies

## how to go though all modules and apply database upgrades?
1. go to terminal
2. run the magento binary with setup variable
```
    bin/magento setup:upgrade
```

## where is our table with all modules versions?
1. go to your sql administrator and check the table **setup_module**
 ```
    SELECT * 
      FROM setup_module
     WHERE module = "Rafael_Project"
 ```