# reindex by upgrade script

```
$this->startSetup();

process = Mage::getModel('index/indexer')->getProcessByCode('catalog_product_price');
$process->reindexAll();

$this->endSetup();
```

