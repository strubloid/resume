
# Associated Flow file

# Step 1: Initial configuration
* This was a main installation of a magento project, so I did the company flow with docker

# Step 2: create the UI updates
## Step 2.1: Identify which layout handle we need to customize
* We need to determine what file we need to update
* How to find by yourself this knowledge on the core
* Case add a form inside of the order edit

### How to get the layout handle to use?
* URL: https://localhost.test/admin/sales/order/view/order_id/1/key/f0ddd6ad4e803bdfd2f0999c9eebd983f5e9bcd9dba81ddd5a24d6a622440eb7/
* Admin URL: https://localhost.test/admin/
* Action: sales/order/view
* Paramethers: order_id/1/key/f0ddd6ad4e803bdfd2f0999c9eebd983f5e9bcd9dba81ddd5a24d6a622440eb7/

#### To do so you must
* Take the action value: sales/order/view
* Change / to _
* sales_order_view (This is the layout handdler)
* Template filename will be: sales_order_view.xml

#### Imagine that isn't easy to find, or we have duplicates
* Try to search by all *routes.xml
* Search for: the module first element of the action, in our case **frontname="sales"**
as our layout handle first parameter is the frontname
* you will find files under: vendor/magento/module-sales/etc/adminhtml/routes.xml
* you will see that the module name will be **module-sales**

#### Where should we put this sales_order_view.xml?
* your module base path: app/code/module-vendor/module-name
* the path will be: [module-base-path]/view/[area]/layout/sales_order_view.xml
* in our case this will be: [module-base-path]/view/**adminhtml**/layout/**sales_order_view.xml**


## Step 2.2: Create switch to toggle functionality (global scope)
* First you must find an sample from the magento core team
* you can search for all files system.xml with a text that you can find on the backend section
* In this case I searched for **Checkout Totals Sort Order** and the file was
vendor/magento/module-sales/etc/adminhtml/system.xml
* You will be able to check how is being built this part of the system configuration and this is must
the file that you will need to follow the xml structure, in our case we must have the base like this:
```xml
<?xml version="1.0"?>
<config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="urn:magento:module:Magento_Config:etc/system_file.xsd">
    <system>
        <section id="sales">
            
        </section>
    </system>
</config>
```
Note: Now it just need to add the new group with all the elements that are required, in our case just a boolean
is enabled will be enough, so should finish this like:
```xml
<?xml version="1.0"?>
<config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="urn:magento:module:Magento_Config:etc/system_file.xsd">
    <system>
        <section id="sales">
            <group id="order_export" translate="label" type="text" sortOrder="5" showInDefault="1">
                <label>Order Export</label>
                <field id="enabled" translate="label comment" type="select" showInDefault="1">
                    <label>Order Export is Enabled</label>
                    <comment>This will turn the module on or off.</comment>
                    <source_model>Magento\Config\Model\Config\Source\Yesno</source_model>
                </field>
            </group>
        </section>
    </system>
</config>
```
Note2: You always need to clean the cache when you have changes in a XML level
Note3: For features Switches we only use for the Default level, as we will be disabling for the whole website

## Step 2.3: Add module dependency

## Step 2.4: Add a new block in sales_order_view.xml
For this step it is mainly the step to add the block into the sales_order_view.xml
```xml
<block name="order.export" template="Strubloid_OrderExport::order-export.phtml" />
```
Note: this will be stored at the referenceContainer name="content", so this will be rendered at the bottom of the page
Note2: if you change from content to left, you will see that it will be rendered in the left page that contains the Order view

## Step 2.5: Create a .phtml template
Now it is necessary to create a phtml file order-export.phtml
* The place that we will need to add this content will be: [vendor]/[module]/view/adminhtml/templates/order-export.phtml

## Step 2.6: Create a view model to provide business logic for this template.
Instead of using blocks to do everything, we can split between view model and blocks
* View model can be small chunk and use each of it inside of a template file
* You can have only 1 view model for a template file, but you can have more than one doing specific actions
and being rendered inside of a same phtml template file
* it has their own directory called **ViewModel**
* the basic structure for a view-model is:
```php
<?php

declare(strict_types=1);

namespace Strubloid\OrderExport\ViewModel;

use Magento\Framework\View\Element\Block\ArgumentInterface;

class OrderDetails implements ArgumentInterface
{
    
}
```
Note: you must have a namespace, and must implement the ArgumentInterface
from Magento\Framework\View\Element\Block

To be able to access that from the template file we must connect the view-model with
the template file, so we must do:
1 - Go to the sales_order_view.xml
2 - Add an argument with the view module being loaded inside of the order-export.phtml, like:
```xml
<block name="order.export" template="Strubloid_OrderExport::order-export.phtml">
    <arguments>
        <argument name="details" xsi:type="object">Strubloid\OrderExport\ViewModel\OrderDetails</argument>
    </arguments>
</block>
```
Note: As our view model it is an object, it is necessary to specify **xsi:type="object"**
Note2: The argument name, will be the name that will be called inside of the template file, as we are doing:
```php
<?php
declare(strict_types=1);

/** @var $block \Magento\Framework\View\Element\Template */
/** @var $view \Strubloid\OrderExport\ViewModel\OrderDetails */
$view = $block->getData('details');
?>
```





## Step 2.7: Create an etc/adminhtml/acl.xml file and add a check to the view model.




# Step 3: create an admin controller
## Step 3.1: Create the routes.xml file
## Step 3.2: Create the controller
## Step 3.3: Determine the URL to trigger this route and add it to the view model.
## Step 3.4: Create the HeaderData model class
## Step 3.5: Add a HeaderDataFactory to the controller

# Step 4: Transform Order into PHP Array
## Step 4.1: Create data patch for product attribute
## Step 4.2: Create the parent iterator class
## Step 4.3: Create an orchestrator to bring all the pieces together
## Step 4.4: Create the child data collector interface
## Step 4.5: Create header data collector interface
## Step 4.6: Create item data

# Step 5: Post the order to a web service

# Step 6: Update the database to provide details as to when the order was exported

## Step 6.1: Create db_schema.xml
## Step 6.2: Generate the model
## Step 6.3: Generate the resource model and collection
## Step 6.4: Create a repository
## Step 6.5: Create extension attributes
## Step 6.6: Save the export details to extension attribute

# Step 7: Return the response to the frontend
## Step 7.1: Create a service provider
## Step 7.2: Create a new view model
## Step 7.3: Create a new template
## Step 7.4: Render the template with Layout XML
