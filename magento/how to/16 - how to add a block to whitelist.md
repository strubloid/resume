
# how to add a block to the whitelist
> Note this will allow a block to be printed on a CMS page or email template

```
$installer = $this;

$installer->startSetup();

$tonykealysProductFeaturedBlock = 'tonykealys_order/order';

// adding our block to magento whitelist
$whitelistBlock = Mage::getModel('admin/block')->load($tonykealysProductFeaturedBlock, 'block_name');

// will save only if don't exist the block
if(!$whitelistBlock->hasData())
{
    $whitelistBlock->setData('block_name', $tonykealysProductFeaturedBlock)->setData('is_allowed', 1);
    $whitelistBlock->save();
}

$installer->endSetup();
```
