# Magento basic commands




## how to get the name of the table
```
Mage::getSingleton('core/resource')->getTableName('mageworx_downloads/categories');
```


## how to get a collection 
```
$pdfCollection = Mage::getModel('files/files')->getCollection();
```

## how to load a collection by a field to filter(attribute):
``` 
Mage::getModel('mageworx_downloads/categories')
      ->getCollection()
      ->addFieldToFilter('title',array('like' => "%{$title}%"))
      ->getFirstItem();
```


## how to get the base url?
```
Mage::getBaseUrl( Mage_Core_Model_Store::URL_TYPE_WEB, true );
```


## how to load extra attributes after a called ->getCollection()
```
$this->getLoadedProductCollection()->clear()->addAttributeToSelect('package_sticker_id');
```

## remove methods
<remove name="top" />
<action method="unsetChild"><name>topSearchContainer</name></action>