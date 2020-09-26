# 25-how to create a controller

## Sample file
```php
<?php
declare(strict_types=1);

namespace Centralbank\Validator\Controller\Address;

use Magento\Framework\App\Action\Action;
use Magento\Framework\App\Action\Context;

use Magento\Framework\App\Action\HttpPostActionInterface;

class LoadAddressInvalidCharacters extends Action implements HttpPostActionInterface
{
    /**
     * @param Context $context
     */
    public function __construct(
        Context $context
    ) {
        parent::__construct($context);
    }

    /**
     * Execute function
     */
    public function execute()
    {
        
    }
}
```

## Exmplanation
1 - We need to implement one of the classes on vendor/magento/framework/App/Action
2 - the main classes are:
* POST = HttpPostActionInterface
* GET = HttpGetActionInterface





