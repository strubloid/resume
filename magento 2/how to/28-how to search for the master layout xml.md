# 28-how to search for the master layout xml.md


## By the page url
* URL: https://localhost.test/admin/sales/order/view/order_id/1/key/f0ddd6ad4e803bdfd2f0999c9eebd983f5e9bcd9dba81ddd5a24d6a622440eb7/
* Admin URL: https://localhost.test/admin/
* Action: sales/order/view
* Paramethers: order_id/1/key/f0ddd6ad4e803bdfd2f0999c9eebd983f5e9bcd9dba81ddd5a24d6a622440eb7/

### To do so you must:
* Take the action value: sales/order/view
* Change / to _
* sales_order_view (This is the layout handdler)
* Template filename will be: sales_order_view.xml

## Imagine that isn't easy to find, or we have duplicates
* Try to search by all *routes.xml
* Search for: the module first element of the action, in our case **frontname="sales"**
* you will find files under: vendor/magento/module-sales/etc/adminhtml/routes.xml
* you will see that the module name will be **module-sales**

## Where should we put this sales_order_view.xml?
* your module base path: app/code/module-vendor/module-name
* the path will be: [module-base-path]/view/[area]/layout/sales_order_view.xml
* in our case this will be: [module-base-path]/view/**adminhtml**/layout/**sales_order_view.xml**
