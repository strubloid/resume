# Install scripts

## Main structure
* this will be localized at: **app/code/Mastering/SampleModule/Setup**
* Setup folder will contain file like:
  * InstallData.php = this file will be responsible for the first data records after the install schema run
  * UpgradeData.php = this file will be responsible for the upgrade of the records at anytime that you will need to change data for all tables related to this module
  * InstallSchema.php = this file will be responsible for create the table schema structure
  * UpgradeSchema.php = this file will be responsible for upgrade the table schema structure
  
## Setup/InstallSchema.php
> this file will contain the steps to run after run the command **bin/magento setup:upgrade** 


## minimum requirement for the basic module
* you must have setup/InstallSchema.php
* you also must have the setup/InstallData.php

### InstallSchema.php Sample
```php
<?php


namespace Mastering\SampleModule\Setup;

use Magento\Framework\DB\Ddl\Table;
use Magento\Framework\Setup\InstallSchemaInterface;
use Magento\Framework\Setup\ModuleContextInterface;
use Magento\Framework\Setup\SchemaSetupInterface;

class InstallSchema implements InstallSchemaInterface
{

    /**
     * {@inheritdoc}
     */
    public function install( SchemaSetupInterface $setup, ModuleContextInterface $context)
    {
        $setup->startSetup();

        $table = $setup->getConnection()->newTable(
            $setup->getTable('mastering_sample_item')
        )->addColumn(
            'id',
            Table::TYPE_INTEGER,
            null,
            ['identity' => true, 'nullable' => false, 'primary' => true],
            'Item ID'
        )->addColumn(
            'name',
            Table::TYPE_TEXT,
            255,
            ['nullable' => false],
            'Item name'
        )->addIndex(
            $setup->getIdxName('mastering_sample_item', ['name']),
            ['name']
        )->setComment(
            'Mastering Sample Item table'
        );

        $setup->getConnection()->createTable($table);

        $setup->endSetup();
    }
}
```

### InstallData.php Sample
```php
<?php

namespace Mastering\SampleModule\Setup;

use Magento\Framework\Setup\InstallDataInterface;
use Magento\Framework\Setup\ModuleContextInterface;
use Magento\Framework\Setup\ModuleDataSetupInterface;

class InstallData implements InstallDataInterface
{

    /**
     * {@inheritdoc}
     */
    public function install(ModuleDataSetupInterface $setup, ModuleContextInterface $context )
    {
        $setup->startSetup();

        $setup->getConnection()->insert(
            $setup->getTable('mastering_sample_item'),
            ['name' => 'Item 1',]
        );

        $setup->getConnection()->insert(
            $setup->getTable('mastering_sample_item'),
            ['name' => 'Item 1',]
        );

        $setup->endSetup();
    }
}
```

## What to do if the module it is installed before ? 
* We know that a module upgrade scripts  will run after a command **bin/magento setup:upgrade**.
* Will run the scripts setup/InstallSchema.php and setup/InstallData.php
* to be able to run those files you must remove any instance from the **setup_module table**. so you must check if exist the module:
```sql
    SELECT *
      FROM setup_module
     WHERE module like "%Mastering_SampleModule%"
    
    # the result of an existent module will be 
    # module                |schema_version|data_version|
    # ----------------------|--------------|------------|
    # Mastering_SampleModule|1.0.0         |1.0.0       |
```
* If you want to run the scripts on **setup folder** you must remove the instance for the setup_module running:
```sql
    DELETE FROM setup_module
          WHERE module like "%Mastering_SampleModule%"

    # After run again the SELECT command you must get as result
    # module|schema_version|data_version|
    # ------|--------------|------------|
```
* Now that you'd deleted the record on the setup_module table you must run:
```bash
    bin/magento setup:upgrade
```



