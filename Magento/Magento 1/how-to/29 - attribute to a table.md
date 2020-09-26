# how to add a new attribute for any table
```

<?php
$installer = $this;
$installer->startSetup();

$installer->getConnection()
->addColumn($installer->getTable('newsletter/subscriber'),
'subscriber_name', 
array(
    'type'      => Varien_Db_Ddl_Table::TYPE_TEXT,
    'length'    => 255,
    'after'     => 'subscriber_email', // column name to insert new column after
    'comment'   => 'Subscriber Name'
    ));   
$installer->endSetup();

```

https://magento.stackexchange.com/questions/147513/add-new-column-in-existing-database-table?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa