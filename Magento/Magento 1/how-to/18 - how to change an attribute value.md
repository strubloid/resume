#how to change an attribute value

```
<?php
$installer = $this;

$installer->startSetup();

$setup = new Mage_Eav_Model_Entity_Setup('core_setup');

$attribute = Mage::getModel('eav/entity_attribute')->loadByCode( Mage_Catalog_Model_Product::ENTITY, 
'module_sticker_id');

if(!$attribute->getData('used_in_product_listing'))
{
    $attribute->setData('used_in_product_listing',1);
    $attribute->save();
}

$installer->endSetup();
```