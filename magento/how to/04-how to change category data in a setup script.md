# changing is_active to be true in a category loading by the attribute url_key

```
$this->startSetup();

// saying that is a secure area
Mage::register('isSecureArea', 1);

// Force the store to be admin
Mage::app()->setUpdateMode(false);
Mage::app()->setCurrentStore(Mage_Core_Model_App::ADMIN_STORE_ID);

//update category
$category = Mage::getModel('catalog/category')
    ->loadByAttribute('url_key','black-friday-deals');

if ($category) {
    $category
        ->setStoreId(Mage_Core_Model_App::ADMIN_STORE_ID)
        ->setData('is_active', 1)
        ->save();
}

$this->endSetup();
```