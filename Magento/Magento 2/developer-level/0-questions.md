# Questions

Page: 33
Prepare the Questions:


### Plugins
Q: Who is the ObjectManager, I've searched by and I could find only an interface  ObjectManagerInterface,
but I could not see someone implementing it, but I could see classes calling on constructor
```php
 $this->objectManager = \Magento\TestFramework\Helper\Bootstrap::getObjectManager();
 
 use Magento\TestFramework\Helper\Bootstrap;
 $this->objectManager = Bootstrap::getObjectManager();
```
Q: How can we change functionality if everyone is loading by DependencyInjection?
Q: Is it a good thing like this and why?
Q: I could see that the title it is Plugin but the folder is it Plugin or Plugins?

#### Revertable data patch
Q: How is a good Revertable Data Patch, what are the things that we should worry about while writing it?
Q: Do we have good examples for this?
Q: When should be using this approach?

#### Revertable schema patch
Q: Is it something that we do?
Q: Can I have an example of this?

## What are the 6 areas in magento 2 ?
* base
* adminhtml
* frontend
* weapi_rest
* webapi_soap
* cron

## Module uninstall might be triggering the schema and data patches?
Q: how can i see that?
Q: how can i do that? (examples)

## module to delete modules by command line, runs all necessary drop tables
Q: how can i see that?
Q: how can i do that? (examples)

## difference between templates
1 - view/frontend/templates/hellp.phtml
2 - view/frontend/web/template/hellp.html

## templates
Q: How can I debug those (2) template?
```html
<!-- ko foreach:getRegion('note') -->
<!-- ko template:getTemplate() -->
```
Q: where is being changed from this filetype to the normal html ?

## /view/[area]/web/template
Q: this told me that contains templates and we can asynchronously request by javascript, how? (sample?)
Q: Do we need to study KnockoutJS to be able to do something in the frontend?

### /etc folder
Q: di.xml:  do we have a Cheat-sheet with all capability of this file?
  * Something like: https://cheatography.com/latmiz/cheat-sheets/magento-2/

* mview.xml
```
Triggers a type of event when data is modified in a database column (materialized views).
This is most often used for indexing
```
Q: What is a materialized views?
Q: vendor/magento/module-catalog/etc/mview.xml can we read this file together?
Q: How can i get one of those widgets(vendor/magento/module-catalog/etc/widget.xml) and use in my module?

## Dependency Injection
Q: it is very poor practice to directly use the ObjectManager—the primary class that handles dependency inject.
Q: How can I do that? How can I recognize that ?


## Factory
Q: To be able to create a ProductInterfaceFactory, what is the command that we need to run to make magento create it?
