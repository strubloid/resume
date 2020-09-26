# Upgrade Scripts

## This will involve 2 new files in out Setup folder
* app/code/Mastering/SampleModule/Setup/UpgradeSchema.php
* app/code/Mastering/SampleModule/Setup/UpgradeData.php


## app/code/Mastering/SampleModule/Setup/UpgradeSchema.php
> Note: for this file you will need to follow the following structure
```php
<?php

namespace Mastering\SampleModule\Setup;

use Magento\Framework\Setup\UpgradeSchemaInterface;
use Magento\Framework\Setup\ModuleContextInterface;
use Magento\Framework\Setup\SchemaSetupInterface;

class UpgradeSchema implements UpgradeSchemaInterface
{
    public function upgrade(SchemaSetupInterface $setup, ModuleContextInterface $context)
    {
        if (version_compare($context->getVersion(), "1.0.1", "<")) {

            $setup->getConnection()->addColumn(
                $setup->getTable('mastering_sample_item'),
                'description',
                [
                    Table::TYPE_TEXT,
                    'nullable' => true,
                    'comment' => 'Description field',
                ]
            );
        }
    }
}
```

## app/code/Mastering/SampleModule/Setup/UpgradeData.php
> Note: for this file you will need to follow the following structure
```php
<?php
   
   namespace Mastering\SampleModule\Setup;
   
   use Magento\Framework\Setup\UpgradeDataInterface;
   use Magento\Framework\Setup\ModuleContextInterface;
   use Magento\Framework\Setup\ModuleDataSetupInterface;
   
   class UpgradeData implements UpgradeDataInterface
   {
   
       /**
        * {@inheritdoc}
        */
       public function upgrade(ModuleDataSetupInterface $setup, ModuleContextInterface $context)
       {
           if (version_compare($context->getVersion(), "1.0.1", "<")) {
   
               $setup->getConnection()->update(
                   $setup->getTable('mastering_sample_item'),
                   [
                       'description' => 'Default Description',
                   ]
               );
               $setup->getConnection()->quoteInto('id = ? ',1);
           }
       }
   }
```


## Change of the current version of the module
* edit the file: **app/code/Mastering/SampleModule/etc/module.xml**
* change the number of the module **setup_version** from **1.0.0** to **1.0.1**, like:
```xml
<?xml version="1.0" ?>
<config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="urn:magento:framework:Module/etc/module.xsd">
    <module name="Mastering_SampleModule" setup_version="1.0.1"/>
</config>
```


## Upgrade command
Now that you had changed all the things you will need only to run the main upgrade script, so you must do the following:
```bash
    bin/magento setup:upgrade
```
