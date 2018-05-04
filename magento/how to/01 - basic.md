# Magento basic things

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
```
<remove name="top" />
    <action method="unsetChild">
       <name>topSearchContainer</name>
    </action>
</remove>
```

## how to show the magento billing step without fill any form
```
document.getElementById('checkout-step-billing').show()
```

## how to show the magento shipping step without fill any form
```
document.getElementById('checkout-step-shipping').show()
```

## how to print magento handlers
```
var_dump(Mage::app()->getLayout()->getUpdate()->getHandles());
```

## how to get 100% of the content to be updated in a CMS page
```
<?php

$newOrderEmailContent = <<<'END_OF_EMAIL'
<body>
[the full content of the email]
</body>
END_OF_EMAIL;

$newOrderEmail->setData('template_text', $newOrderEmailContent);
$newOrderEmail->save();

$installer->endSetup();
```

# how to create a magento checkbox field
> https://magento.stackexchange.com/questions/115549/add-checkbox-field-with-catalog-category
```
$installer->addAttribute("catalog_category", "test",  array(
    "type"     => "int",
    "backend"  => "",
    "frontend" => "",
    "label"    => "test",
    "input"    => "checkbox",
    "class"    => "",
    "global"   => Mage_Catalog_Model_Resource_Eav_Attribute::SCOPE_STORE,
    "visible"  => true,
    "required" => false,
    "user_defined"  => false,
    "default" => "0",
    "searchable" => false,
    "filterable" => false,
    "comparable" => false,

    "visible_on_front"  => false,
    "unique"     => false,
    "note"       => ""

    ));
```