# How to get store information?

## Reference
* https://blog.chapagain.com.np/magento-2-get-store-information-store-id-code-name-url-website-id/

## Main steps
* you must load in your __construct the StoreManagerInterface that 
you can find on: use Magento\Store\Model\StoreManagerInterface;
```php
<?php
// ...
use Magento\Store\Model\StoreManagerInterface;

class YourClass extends AbstractModel
{
    /**
     * @var StoreManagerInterface
     */
    private $storeManager;
    
    public function __construct(StoreManagerInterface $storeManager)
    {
        $this->storeManager = $storeManager;
    }
}
```
* you must get the store object, and later on you will be able to get 
the store information from it, like
```
    $store = $this->storeManager->getStore();
```

* Store Id
```
    $storeId = $store->getStoreId();
```

* Website Id
```
    $websiteId = $store->getWebsiteId();
```

* Store Code
```
    $storeCode = $store->getCode();
```

* Store Name
```
    $storeName = $store->getName();
```


* Store Url
```
    $storeUrl = $store->getCurrentUrl();
```

* Store Is active?
```
    $storeUrl = $store->isActive();
```