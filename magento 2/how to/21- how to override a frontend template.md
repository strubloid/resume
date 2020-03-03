# how to override a frontend template


## folders
1 - Module folder we will use to show this will be: app/code/local/Magento/NewModule
2 - layout file will be under: view/frontend/layout/[module name]_[Controler]_[Controller action]



## How to understand view/frontend/layout of your module?
* In this case we will have the layout named newmodule_index_index
* newmodule: you will find on etc/frontend/routes.xml
  * over there you will find the frontname: <route ... frontName="**newmodule**">
* index: came from the controller name that you will find over app/code/local/Magento/NewModule/Controller/**Index**
* index: the second one came from the action name (in this case the file it is called index.php in the Controller/Index/ folder)


## newmodule_index_index.xml
* This will contain the page reference, with layout of that will be generated, like one-column, two-columns and three-columns
* you basically will have a main <body> tag and references to containers that you want to add a block into that container space
* inside of this <referenceContainer> tag you will be adding your blocks specifying the name and a respective class of the block
