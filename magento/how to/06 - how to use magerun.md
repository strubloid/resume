# reindex by upgradescript

```
$this->startSetup();

process = Mage::getModel('index/indexer')->getProcessByCode('catalog_product_price');
$process->reindexAll();

$this->endSetup();
```

 n98-magerun.phar install --dbHost="localhost" --dbUser="mydbuser" --dbPass="mysecret" --dbName="magentodb" --installSampleData=yes --useDefaultConfigParams=yes --magentoVersionByName="magento-ce-1.7.0.2" --installationFolder="magento" --baseUrl="http://magento.localdomain/"