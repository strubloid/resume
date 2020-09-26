# how to reindex on a shell php?
```php
$indexCatUrl = Mage::getSingleton('index/indexer')->getProcessByCode('catalogsearch_fulltext');
$indexCatUrl->reindexAll();

$indexCatUrl2 = Mage::getSingleton('index/indexer')->getProcessByCode('catalog_category_flat');
$indexCatUrl2->reindexAll();
```