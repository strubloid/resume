# How to create a validator


## Main folders
* module folder: app/code/Centralbank/Validator
* layout: [module-folder]/view/frontend/layout/checkout_index_index.xml
* rules: [module-folder]/view/frontend/web/js/model/realex-address-rules.js
* validator: [module-folder]/view/frontend/web/js/model/realex-address-validator.js
* pool: [module-folder]/view/frontend/web/js/model/realex-address-validations.js

### create rules
```javascript
define(
    [],
    function () {
        'use strict';
        return {
            getRules: function() {
                return {
                    'invalid': {
                        'characters': 'º'
                    }
                };
            }
        };
    }
)
```

### Create a validator
```javascript
define(
    [
        'jquery',
        'mageUtils',

        './shipping-rates-validation-rules',
        'mage/translate'
    ],
    function ($, utils, validationRules, $t) {
        'use strict';
        return {
            validationErrors: [],
            validate: function(address) {
                var self = this;
                this.validationErrors = [];
                $.each(validationRules.getRules(), function(field, rule) {
                    if (rule.required && utils.isEmpty(address[field])) {
                        var message = $t('Field ') + field + $t(' is required.');
                        self.validationErrors.push(message);
                    }
                });
                return !Boolean(this.validationErrors.length);
            }
        };
    }
);
```

### Register validator and Rules in the validators pool
```javascript
define(
    [
        'uiComponent',
        'Magento_Checkout/js/model/shipping-rates-validator',
        'Centralbank_Validator/js/model/realex-address-validator'

    ],
    function (Component, defaultShippingRatesValidator, yourValidator) {
        'use strict';
        defaultShippingRatesValidator.registerValidator(yourValidator);
        return Component.extend({});
    }
);

```



## How the search for the correct form?
1 - you always can try to use the n98-magerun2.phtml dev:template-hints to know what is the phtml file of that template
1.1 - if you cant find, what you can do is: inspect the element, get the main id of the form like form-shipping-address
1.2 - you can find that we have this id only: vendor/magento/module-checkout/view/frontend/web/template/shipping-address/form.html


### Magento_Checkout/js/model/shipping-rates-validator
* locale: vendor/magento/module-checkout/view/frontend/web/js/model/shipping-rates-validator.js
* alias: Magento_Checkout/js/model/shipping-rates-validator
  * Magento_Checkout: vendor/magento/module-checkout
  * js/model: view/frontend/web/js/model
  * shipping-rates-validator: shipping-rates-validator.js

### app/code/Centralbank/Validator/view/frontend/layout/checkout_index_index.xml
1 - you must search for the main checkout_index_index template file
2 - for the checkout_index_index we can find over: vendor/magento/module-checkout/view/frontend/layout/checkout_cart_index.xml
3 - you should copy this file and remove all the unecessary things til the form that you want to change, like

#### Changes

##### Block to ReferenceBlock tag
* each block you must change from <block> to <referenceBlock name="[block-name]">
```xml
 <!-- From-->
 <block clas="Magento\Checkout\Block\Onepage" name="checkout.root" template="Magento_Checkout::onepage.phtml" cacheable="false">

 <!-- To-->
 <referenceBlock name="checkout.root">
```

##### Remove uncessesary items
* You can remove any kind of item that you wont be changing
* the structure must look like items over items, like above example:
```xml
    <!--from-->
    <arguments>
        <argument name="jsLayout" xsi:type="array">
            <item name="components" xsi:type="array">
                <item name="checkout" xsi:type="array">
                    <item name="children" xsi:type="array">
                        <item name="steps" xsi:type="array">
        This must die -->   <item name="component" xsi:type="string">uiComponent</item>
        This must die -->   <item name="displayArea" xsi:type="string">steps</item>
                            <item name="children" xsi:type="array">
                                <item name="shipping-step" xsi:type="array">
            This must die -->       <item name="component" xsi:type="string">uiComponent</item>
            This must die -->       <item name="sortOrder" xsi:type="string">1</item>
                                    <item name="children" xsi:type="array">
                                        <item name="shippingAddress" xsi:type="array">
                                            <item name="config" xsi:type="array">
    
    
    
    <!--to-->
    <arguments>
        <argument name="jsLayout" xsi:type="array">
            <item name="components" xsi:type="array">
                <item name="checkout" xsi:type="array">
                    <item name="children" xsi:type="array">
                        <item name="steps" xsi:type="array">
                            <item name="children" xsi:type="array">
                                <item name="shipping-step" xsi:type="array">
                                    <item name="children" xsi:type="array">
                                        <item name="shippingAddress" xsi:type="array">
                                            <item name="config" xsi:type="array">

```
* This is a good sample of the checkout shipment form
```xml
<?xml version="1.0"?>
<page xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" layout="checkout" xsi:noNamespaceSchemaLocation="urn:magento:framework:View/Layout/etc/page_configuration.xsd">
    <body>
        <referenceContainer name="content">
            <referenceBlock name="checkout.root">
                <arguments>
                    <argument name="jsLayout" xsi:type="array">
                        <item name="components" xsi:type="array">
                            <item name="checkout" xsi:type="array">
                                <item name="children" xsi:type="array">
                                    <item name="steps" xsi:type="array">
                                        <item name="children" xsi:type="array">
                                            <item name="shipping-step" xsi:type="array">
                                                <item name="children" xsi:type="array">
                                                    <item name="shippingAddress" xsi:type="array">
                                                        <item name="children" xsi:type="array">
                                                            <item name="shipping-address-fieldset" xsi:type="array">
                                                                <item name="children" xsi:type="array">
                                                                    <!-- The following items override configuration of corresponding address attributes -->
                                                                    <item name="region" xsi:type="array">
                                                                        <!-- Make region attribute invisible on frontend. Corresponding input element is created by region_id field -->
                                                                        <item name="visible" xsi:type="boolean">false</item>
                                                                    </item>
                                                                    <item name="region_id" xsi:type="array">
                                                                        <item name="component" xsi:type="string">Magento_Ui/js/form/element/region</item>
                                                                        <item name="config" xsi:type="array">
                                                                            <item name="template" xsi:type="string">ui/form/field</item>
                                                                            <item name="elementTmpl" xsi:type="string">ui/form/element/select</item>
                                                                            <item name="customEntry" xsi:type="string">shippingAddress.region</item>
                                                                        </item>
                                                                        <item name="validation" xsi:type="array">
                                                                            <item name="required-entry" xsi:type="boolean">true</item>
                                                                        </item>
                                                                        <!-- Value of region_id field is filtered by the value of county_id attribute -->
                                                                        <item name="filterBy" xsi:type="array">
                                                                            <item name="target" xsi:type="string"><![CDATA[${ $.provider }:${ $.parentScope }.country_id]]></item>
                                                                            <item name="field" xsi:type="string">country_id</item>
                                                                        </item>
                                                                    </item>
                                                                    <item name="postcode" xsi:type="array">
                                                                        <!-- post-code field has custom UI component -->
                                                                        <item name="component" xsi:type="string">Magento_Ui/js/form/element/post-code</item>
                                                                        <item name="validation" xsi:type="array">
                                                                            <item name="required-entry" xsi:type="boolean">true</item>
                                                                        </item>
                                                                    </item>
                                                                    <item name="company" xsi:type="array">
                                                                        <item name="validation" xsi:type="array">
                                                                            <item name="min_text_length" xsi:type="number">0</item>
                                                                        </item>
                                                                    </item>
                                                                    <item name="fax" xsi:type="array">
                                                                        <item name="validation" xsi:type="array">
                                                                            <item name="min_text_length" xsi:type="number">0</item>
                                                                        </item>
                                                                    </item>
                                                                    <item name="country_id" xsi:type="array">
                                                                        <item name="sortOrder" xsi:type="string">115</item>
                                                                    </item>
                                                                    <item name="telephone" xsi:type="array">
                                                                        <item name="config" xsi:type="array">
                                                                            <item name="tooltip" xsi:type="array">
                                                                                <item name="description" xsi:type="string" translate="true">For delivery questions.</item>
                                                                            </item>
                                                                        </item>
                                                                    </item>
                                                                </item>
                                                            </item>
                                                        </item>
                                                    </item>
                                                </item>
                                            </item>
                                        </item>
                                    </item>
                                </item>
                            </item>
                        </item>
                    </argument>
                </arguments>
            </referenceBlock>
        </referenceContainer>
    </body>
</page>

```



<item name="shipping-rates-validation" xsi:type="array">
                                                            <item name="children" xsi:type="array">
                                                                <item name="realex-address-validation" xsi:type="array">
                                                                    <item name="component" xsi:type="string">Centralbank_Validator/js/view/realex-address-validation</item>
                                                                </item>
                                                            </item>
                                                        </item>


shipping-address/form.html


<?xml version="1.0"?>
<!--
/**
 * Copyright © 2013-2017 Magento, Inc. All rights reserved.
 * See COPYING.txt for license details.
 */
-->
<page xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" layout="checkout" xsi:noNamespaceSchemaLocation="urn:magento:framework:View/Layout/etc/page_configuration.xsd">
    <body>
        <referenceContainer name="content">
                <referenceBlock name="checkout.root">
                    <arguments>
                        <argument name="jsLayout" xsi:type="array">
                            <item name="components" xsi:type="array">
                                <item name="checkout" xsi:type="array">
                                    <item name="children" xsi:type="array">
                                        <item name="steps" xsi:type="array">
                                            <item name="children" xsi:type="array">
                                                <item name="shipping-step" xsi:type="array">
                                                    <item name="children" xsi:type="array">
                                                        <item name="shippingAddress" xsi:type="array">
                                                            <item name="children" xsi:type="array">
                                                                <item name="shipping-address-fieldset" xsi:type="array">
                                                                    <item name="children" xsi:type="array">
                                                                        <item name="telephone" xsi:type="array">
                                                                            <item name="validation" xsi:type="array">
                                                                                <item name="validate-number" xsi:type="number">0</item>
                                                                            </item>
                                                                            <item name="config" xsi:type="array">
                                                                                <item name="tooltip" xsi:type="array">
                                                                                    <item name="description" xsi:type="string" translate="true">For delivery questions.</item>
                                                                                </item>
                                                                            </item>
                                                                        </item>
                                                                    </item>
                                                                </item>
                                                            </item>
                                                        </item>
                                                    </item>
                                                </item>
                                            </item>
                                        </item>
                                    </item>
                                </item>
                            </item>
                        </argument>
                    </arguments>
                </referenceBlock>
        </referenceContainer>
    </body>
</page>



























### Good example for billing and shipping steps
```xml
<?xml version="1.0"?>
<!--
/**
 * Copyright © 2013-2017 Magento, Inc. All rights reserved.
 * See COPYING.txt for license details.
 */
-->
<page xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" layout="checkout" xsi:noNamespaceSchemaLocation="urn:magento:framework:View/Layout/etc/page_configuration.xsd">
    <body>
        <referenceContainer name="content">
                <referenceBlock name="checkout.root">
                    <arguments>
                        <argument name="jsLayout" xsi:type="array">
                            <item name="components" xsi:type="array">
                                <item name="checkout" xsi:type="array">
                                    <item name="children" xsi:type="array">
                                        <item name="steps" xsi:type="array">
                                            <item name="children" xsi:type="array">
                                                <item name="shipping-step" xsi:type="array">
                                                    <item name="children" xsi:type="array">
                                                        <item name="shippingAddress" xsi:type="array">
                                                            <item name="children" xsi:type="array">
                                                                <item name="shipping-address-fieldset" xsi:type="array">
                                                                    <item name="children" xsi:type="array">
                                                                        <item name="telephone" xsi:type="array">
                                                                            <item name="validation" xsi:type="array">
                                                                                <item name="validate-number" xsi:type="number">0</item>
                                                                            </item>
                                                                            <item name="config" xsi:type="array">
                                                                                <item name="tooltip" xsi:type="array">
                                                                                    <item name="description" xsi:type="string" translate="true">For delivery questions.</item>
                                                                                </item>
                                                                            </item>
                                                                        </item>
                                                                    </item>
                                                                </item>
                                                            </item>
                                                        </item>
                                                    </item>
                                                </item>
                                                <item name="billing-step" xsi:type="array">
                                                    <item name="children" xsi:type="array">
                                                        <item name="payment" xsi:type="array">
                                                            <item name="children" xsi:type="array">
                                                                        <item name="telephone" xsi:type="array">
                                                                            <item name="validation" xsi:type="array">
                                                                                <item name="validate-number" xsi:type="number">0</item>
                                                                            </item>
                                                                        </item>
                                                            </item>
                                                        </item>
                                                    </item>
                                                </item>
                                            </item>
                                        </item>
                                    </item>
                                </item>
                            </item>
                        </argument>
                    </arguments>
                </referenceBlock>
        </referenceContainer>
    </body>
</page>


```



### Create a validator Temp (Remove later)
```javascript
define(
    ['mage/translate', 'Magento_Ui/js/model/messageList'],
    function ($t, messageList) {
        'use strict';
        return {
            validate: function () {
                const isValid = false; //Put your validation logic here

                if (!isValid) {
                    messageList.addErrorMessage({ message: $t('a possible failure message ...  ') });
                }

                return isValid;
            }
        }
    }
);
```
* Note: this will be responsible to apply the rule







```
        window.checkoutConfig = <?= /* @noEscape */ $block->getSerializedCheckoutConfig() ?>;
        
        window.isCustomerLoggedIn = window.checkoutConfig.isCustomerLoggedIn;
        window.customerData = window.checkoutConfig.customerData;
   ```