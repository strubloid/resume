# How to get all payment options
```
Mage::getModel('payment/config')->getAllMethods()
```

# how to catch all offline orders
```
$ordersOffline = Mage::getResourceModel('sales/order_payment_collection')->addFieldToFilter('method',array('in' => $offlineTypes) );
```

1 - place an order with special price
2 - place an order with catalog product promotion
3 - place an order with shopping cart promotion rule

# how to create an order with a product with special price 

1 - go to backend -> catalog -> Manage Products
2 - search by a sku: P-78IBC-BYH
3 - go to tab "Prices" and add some lower value for the field "Special Price"
4 - save the product
5 - reindex the product prices index 

# how to add a shopping cart promotion (https://docs.magento.com/m1/ce/user_guide/marketing/price-rules-shopping-cart.html)
1 - you must add a new rule
2 - go to backend -> Promotions -> Shopping Cart Price Rules
3 - Click Add New Rule
4 - In Rule Information tab Under General Information add the rule name, description, Status as active, select a website and Select the Customer Groups to see this
7 - In Actions tab under Update prices using the following information you must add a discount ammount (10)






































SKU: P-78IBC-BYH
Actual Price = 140
Special Price = 100




