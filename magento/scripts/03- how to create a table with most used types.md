# How to create a table with most used types
```
<?php

$installer = $this;

$installer->startSetup();

$table = $installer->getConnection()->newTable($this->getTable('mcelhinneys_pickinglist/pickinglist'));

$table->addColumn('picking_list_id',
    Varien_Db_Ddl_Table::TYPE_INTEGER,
    11,
    array('identity' => true, 'primary' => true, 'nullable' => false),
    'Id of the exported picking list'
);

$table->addColumn('responsible_id',
    Varien_Db_Ddl_Table::TYPE_INTEGER,
    255,
    array('nullable' => false),
    'Id of the person that requested the report'
);

$table->addColumn('responsible_name',
    Varien_Db_Ddl_Table::TYPE_VARCHAR,
    255,
    array('nullable' => false),
    'Name of the person that requested the report'
);

$table->addColumn('file_path',
    Varien_Db_Ddl_Table::TYPE_VARCHAR,
    255,
    array('nullable' => false),
    'Path to the file'
);

$table->addColumn('created_date',
    Varien_Db_Ddl_Table::TYPE_DATETIME,
    null,
    array('nullable' => false, 'default' => '0000-00-00 00:00:00')
);

$installer->getConnection()->createTable($table);

$installer->endSetup();
```


