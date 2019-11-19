# How to load data from a custom table?

## Reference 
* https://magento.stackexchange.com/questions/112291/how-to-get-my-custom-table-data-from-magento-2

## Steps to do
1 - You need to use the Dependency Injection to get the model in the __construct function
```php
<?php
    use Namespace\Modulename\Model\ModelNameFactory;
    
    private $_modelFactory;
    
    public function __construct(Context $context, ModelNameFactory $modelNameFactory, array $data = array()) 
    {
        $this->_modelFactory = $modelFactory;
        parent::__construct($context, $data);
    }
```


## How to do a like?
```
    $collection->addAttributeToFilter('name', array('like' => '%'.$needle.'%'));
```