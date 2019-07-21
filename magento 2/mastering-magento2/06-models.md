# Models

# Usual namespace for models ot is folder model
* app/code/Mastering/SampleModule/Model
> note: in this namespace will be stored collections, models and resource models are stored
> note2: most basic entity it is namespace it is the resource model, because it communicate with a database 



## First case: you must create the Resource Model
* you will create a file: app/code/Mastering/SampleModule/Model/ResouceModel/Item.php
```php
<?php

namespace Mastering\SampleModule\Model\ResourceModel;

use Magento\Framework\Model\ResourceModel\Db\AbstractDb;

class Item extends AbstractDb
{
    protected function _construct()
    {
        $this->_init('mastering_sample_item', 'id');
    }

}
```

## Second step, you will create the abstract extensible class inside of Model namespace
* you will create a file: app/code/Mastering/SampleModule/Model/Item.php
```php
<?php

namespace Mastering\SampleModule\Model;

use Mastering\SampleModule\Model\ResourceModel\Item as ItemResource;  // this is the place that is referring to the Item Resource
use Magento\Framework\Model\AbstractModel;

class Item extends AbstractModel
{
    protected function _construct()
    {
        $this->_init(ItemResource::class);
    }
}
```


## Third step it is very easy, The Collection file, you will connect resource model and the abstract extensible object 
* you will create a file: app/code/Mastering/SampleModule/Model/ResouceModel/Item/Collection.php
```php
<?php

namespace Mastering\SampleModule\Model\ResourceModel\Item;

use Magento\Framework\Model\ResourceModel\Db\Collection\AbstractCollection;
use Mastering\SampleModule\Model\Item;
use Mastering\SampleModule\Model\ResourceModel\Item as ResourceItem;

class Collection extends AbstractCollection
{

    protected $_idFieldName = 'id';

    protected function _construct()
    {
        $this->_init(Item::class, ResourceItem::class);
    }

}
```
