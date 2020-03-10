# How to create a validator


## Main files/folders
* Module folder: app/code/Centralbank/Validator
* Javascript path: [module-folder]/Validator/view/frontend/web/js
* Requirejs: [module-folder]/Validator/view/frontend/requirejs-config.js
* Our validator: [module-folder]/Validator/view/frontend/web/js/address-size-validation-mixin.js
* checkout layout: [module-folder]/view/frontend/layout/checkout_index_index.xml

### Require Js
* This file will contain instructions to add javascript into our website
```javascript
var config = {
    config: {
        mixins: {
            'mage/validation': {
                'Centralbank_Validator/js/address-validation-mixin': true,
                'Centralbank_Validator/js/address-size-validation-mixin': true
            }
        }
    }
};
```

### Validator
```javascript

define([
    'jquery',
], function ($) {
    'use strict';
    
    // This is just to have a value in case that something went wrong with the ajax call
    var inputMaxSize = 50;
    
    // This will trigger the loadinputmaxsize action to load what is the stored data on core_config_data
    jQuery.ajax({
        showLoader: true,
        url: '/validate-load/address/loadinputmaxsize',
        type: "post",
        dataType: 'json',
        contentType: "application/json;charset=utf-8",
    }).success(function (data, textStatus, jqXHR) {
        if (data['max-size'] != null) {
            inputMaxSize = data['max-size'];
        }
    });

    return function () {
        $.validator.addMethod(
            'validate-address-size-realex',
            function (value, element) {
                this.errorMessage = $.mage.__(' The maximum size for this field is: ' 
                    + inputMaxSize + ' characters');
                return value.length <= inputMaxSize;
            }, function () {
                return this.errorMessage;
            }
        )
    }
});
```

### Frontend Route validate-load
* I am showing in this sample how to create a frontend route, so we can get data
from core_config_data and upgrade dynamically the error message plus the validator
variable inputMaxSize
* path: app/code/Centralbank/Validator/etc/frontend/routes.xml
```xml
<?xml version="1.0" ?>
<config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="urn:magento:framework:App/etc/routes.xsd">
    <router id="standard">
        <route frontName="validate-load" id="validate">
            <module name="Centralbank_Validator"/>
        </route>
    </router>
</config>
```

### Controller Action
* This will use the variable resultFactory from abstractAction that is a child of Action class that we extend
* With the resultFactory we can return Json in a correct way
* path: app/code/Centralbank/Validator/Controller/Address/LoadInputMaxSize.php
```php
<?php

namespace Centralbank\Validator\Controller\Address;

use Magento\Framework\App\Action\Action;
use Magento\Framework\App\Action\Context;
use Magento\Framework\Controller\ResultFactory;

class LoadInputMaxSize extends Action
{
    /**
     * @param Context $context
     */
    public function __construct(
        Context $context
    ) {
        parent::__construct($context);
    }

    public function execute()
    {
        if ($this->getRequest()->isAjax()) {
            $result = $this->resultFactory->create(ResultFactory::TYPE_JSON);
            $response['max-size'] = 60;
            $result->setData($response);
            return $result;
        }
    }
}
```

## Adding validator to a customer attribute
* Note: It is possible to add a validator to each filed manually going to a template file and add the validator tag
* Usually we should add to customer attribute by magento patch
* File path: app/code/Centralbank/Validator/Setup/Patch/Data/UpgradeValidatorCustomerStreetField.php
```php
<?php

declare(strict_types=1);
namespace Centralbank\Validator\Setup\Patch\Data;

use Magento\Framework\Setup\Patch\DataPatchInterface;
use Magento\Customer\Setup\CustomerSetupFactory;
use Magento\Framework\Setup\ModuleDataSetupInterface;

class UpgradeValidatorCustomerStreetField implements DataPatchInterface
{
    /**
     * @var ModuleDataSetupInterface
     */
    private $moduleDataSetup;

    /**
     * @var CustomerSetupFactory
     */
    private $customerSetupFactory;

    /**
     * UpgradeValidatorCustomerStreetField constructor.
     * @param ModuleDataSetupInterface $moduleDataSetup
     * @param CustomerSetupFactory $customerSetupFactory
     */
    public function __construct(
        ModuleDataSetupInterface $moduleDataSetup,
        CustomerSetupFactory $customerSetupFactory
    ) {
        $this->moduleDataSetup = $moduleDataSetup;
        $this->customerSetupFactory = $customerSetupFactory;
    }

    /**
     * This will return the dependencies.
     */
    public static function getDependencies(): array
    {
        return [];
    }

    /**
     * This will go to eav_attribute and customer_eav_attribute and it will
     * be adding the validation rules and the classes to be printed in the frontend
     * {@inheritdoc}
     */
    public function apply()
    {
        $entityAttributes = [
            'customer_address' => [
                'street' => [
                    'validate_rules' => '{"max_text_length":101,"min_text_length":1}',
                    'frontend_class' => 'validate-address-realex validate-address-size-realex',
                ],
            ],
        ];
        $customerSetup = $this->customerSetupFactory->create(['setup' => $this->moduleDataSetup]);

        $customerSetup->upgradeAttributes($entityAttributes);
    }

    /**
     * This will return the aliases.
     */
    public function getAliases(): array#
    {
        return [];
    }
}
```
