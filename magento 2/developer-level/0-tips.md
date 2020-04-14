# Tips


# setup upgrade with --keep-generated
* This will allow you to run all upgrades but wont be recreating things on generated folder

## Good idea for --keep-generated
1 - by the name of the module, lets say OrderExport
2 - you will search on the generated folder, and should be deleted
3 - later on you can run again the bin/magento setup:upgrade --keep-generated
Note: this action it is something to try to speed up the process of upgrading your code without need
to remove everything from the generated folder


## How to understand the url and the layout that is being loaded
* sample URL: [domain]/adminhtml/sales/order/export/order_id/3/[key]
* the layout will be cought by the main actions sales/order/export
* the file will be called **sales_order_export.xml**
* it will be stored at view/adminhtml/layout/sales_order_export.xml
* the place can change to be the format view/[area - adminhtml or frontend]/layout/sales_order_export.xml

