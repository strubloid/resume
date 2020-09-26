# How to get a parent id (configurable product) by the child product id
```
$_productId = YOUR_PRODUCT_ID;
$parentIdArray = Mage::getModel('catalog/product_type_configurable')
                      ->getParentIdsByChild($_productId);
```
