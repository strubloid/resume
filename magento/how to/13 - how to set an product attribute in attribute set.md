# how to get all attribute set's for a product? 

```
// entity type for all products
$productEntityTypeId = 4;

// loading all product set's
$attributeSetCollection = Mage::getResourceModel('eav/entity_attribute_set_collection')
    ->addFieldToFilter('entity_type_id', array('eq' => $productEntityTypeId))
    ->load();

```
* the product entity type id will be 4 (product)
> productEntityTypeId = 4 means that will be searchinf only for products attributes, for category you must change to the correct category entity type id.

