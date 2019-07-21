# Routers, Frontend Controller and Backend Controller 


## Routers
### frontend
* You must create the folder: **app/code/Mastering/SampleModule/etc/frontend**
* you must follow the basic pattern:
```xml
<?xml version="1.0" encoding="utf-8"?>
<config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="urn:magento:framework:App/etc/routes.xsd">
    <router id="standard">
        <route id="mastering" frontName="mastering">
            <module name="Mastering_SampleModule"/>
        </route>
    </router>
</config>
```

### adminhtml
* You must create a folder: **app/code/Mastering/SampleModule/etc/adminhtml**
* You must follow the basic pattern
```xml
<?xml version="1.0" encoding="utf-8"?>
<config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:noNamespaceSchemaLocation="urn:magento:framework:App/etc/routes.xsd">
    <router id="admin">
        <route id="mastering" frontName="mastering_admin">
            <module name="Mastering_SampleModule"/>
        </route>
    </router>
</config>
```

## Front Controller 
* You must create a folder: **app/code/Mastering/SampleModule/Controller**
* you must follow the basic pattern:
```php
<?php

namespace Mastering\SampleModule\Controller\Index;

use Magento\Framework\App\Action\Action;
use Magento\Framework\Controller\ResultFactory;

class Index extends Action
{

    public function execute()
    {
        /** @var \Magento\Framework\Controller\Result\Raw $result */
        $result = $this->resultFactory->create(ResultFactory::TYPE_RAW);
    
        $result->setContents('Hello World');

        return $result;
    }
    
}
```

## Backend Controller
* you must create a folder: app/code/Controller/Adminhtml/Index
* you must follow the basic pattern: 
```php
<?php

namespace Mastering\SampleModule\Controller\Adminhtml\Index;

use Magento\Backend\App\Action;
use Magento\Framework\Controller\ResultFactory;

class Index extends Action
{

    public function execute()
    {
        /** @var \Magento\Framework\Controller\Result\Raw $result */
        $result = $this->resultFactory->create(ResultFactory::TYPE_RAW);
        $result->setContents('Hello Adminhtml World');

        return $result;
    }
}
```

## Notice: After create those structures you must always clean the cache, doing:
```bash
    bin/magento cache:clean && bin/magento cache:flush
```