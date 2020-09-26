# how to save a config data

## script
```
$store=Mage::app()->getStore()->getStoreId();
Mage::getConfig()->saveConfig('design/head/demonotice', '1', 'default', 0);
```

## extra
```
// setting that will be the update mode
Mage::app()->setUpdateMode(true);
```
> http://prattski.com/2014/09/23/using-the-magento-registry-mageregister/