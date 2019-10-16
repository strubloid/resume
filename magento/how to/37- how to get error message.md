# How to get error message on magento 1?
> Reference: https://inchoo.net/magento/magento-frontend/utilizing-magento-notification-system/

## Error message
```php
    Mage::getSingleton('core/session')->addError('Error message here');
```

## Notice Message
```php
    Mage::getSingleton('core/session')->addNotice('Notice message here');
```

## Success Message
```php
    Mage::getSingleton('core/session')->addSuccess('Success message here');
```

## Warning Admin Message
```php
    Mage::getSingleton('adminhtml/session')->addWarning('Warning message here');
```
