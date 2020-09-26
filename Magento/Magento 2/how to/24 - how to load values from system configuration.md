# how to load values from system configuration

## Steps to do inside of the php class

### Add the scopeConfigInterface for the depedency Inection
```php
use Magento\Framework\App\Config\ScopeConfigInterface;

class LoadInputMaxSize extends Action
{
    /**
     * @var ScopeConfigInterface
     */
    private $scopeConfig;
    
    /**
     * @param Context $context
     * @param ScopeConfigInterface $scopeConfig
     */
    public function __construct(
        Context $context,
        ScopeConfigInterface $scopeConfig
    ) {
        parent::__construct($context);
        $this->scopeConfig = $scopeConfig;
    }
}
```

###





