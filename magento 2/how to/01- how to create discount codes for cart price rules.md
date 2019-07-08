# How to create discount rules?


* set the cart rule for the wholesale discount 5%, 10%,15%
* We set the rules as we normally we would, you can see them here:
  * ID list: 48, ID 47 and ID 49 
* You must check why isn't applying the correct amount to the total!

## Actions
* Login into the backend
* Access Marketing tab -> Cart Price Rules
* Click to **add new rule** button







Address rule id = 3332
file: vendor/magento/module-sales-rule/Model/Rule/Action/Discount/ByPercent.php
line: 56
```
$discountData = {Magento\SalesRule\Model\Rule\Action\Discount\Data} [4]
 amount = {float} 36.585
 baseAmount = {float} 36.585
 originalAmount = {float} 45.0
 baseOriginalAmount = {float} 45.0
```


file: vendor/magento/module-quote/Model/Quote/Address/Total.php
line: 33



## Code knowledge
 
* vendor\magento\module-catalog-rule\Controller\Adminhtml\Promo\Catalog\ApplyRules.php
* vendor/magento/module-sales-rule/Model/Validator.php

* First of all, we create a service class intended to generate coupon codes using the default coupon generator (\Magento\SalesRule\Model\CouponGenerator)
* This service can be reused in future in case we want to generate the coupon codes by a scheduled CRON job, or we can even additionally create a new CLI command which allows to generate a number of codes for a specified cart price rule by simply calling the \Atwix\CartCouponSample\Service\GenerateCouponCodesService::execute method









