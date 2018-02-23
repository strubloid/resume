# how to translate a file


https://alanstorm.com/magento_loading_config_variables/

```
$store=Mage::app()->getStore()->getStoreId();
Mage::getConfig()->saveConfig('design/head/demonotice', '1', 'default', 0);
```

http://prattski.com/2014/09/23/using-the-magento-registry-mageregister/