# How to override the product-list template file ?

## Checking where is the actual phtml that we will be overriding
> For this case I could see that we have the product list phtml localized at: vendor/magento/module-catalog/view/frontend/templates/product/list.phtml
> You can copy the content from there and paste inside of the your module


## Creating the override file
* file to overwrite: vendor/magento/module-catalog/view/frontend/templates/product/list.phtml 
* The place that this will be stored it is localized at: app/design/frontend
* for this example we have a module called SimplifiedMagento and a CustomTheme, so the place to start to add the things will be: app/design/frontend/SimplifiedMageto/CustomTheme
* First of all you will need to identify what will be the first folder that will make a signal to the overwrite aciton, in our case we have:
  * vendor/magento/**module-catalog** ...: the folder will be called Magento_Catalog
  * we will be adding things on:  app/design/frontend/SimplifiedMageto/CustomTheme/Magento_Catalog
* Now you will need to replicate the structure that comes after frontend, as we are adding things for the app/design/frontend, so will be the path to the file: app/design/frontend/SimplifiedMageto/CustomTheme/Magento_Catalog/templates/product/list.phtml
