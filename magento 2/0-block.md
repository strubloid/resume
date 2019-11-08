# Block


## Refence
* https://devdocs.magento.com/guides/v2.3/frontend-dev-guide/layouts/xml-instructions.html
* https://devdocs.magento.com/guides/v2.2/frontend-dev-guide/layouts/layout-overview.html


## How to check what is the block that will be rendered?
1 - Go to: vendor/magento/framework/View/Element/Template/File/Resolver.php
2 - Check the function getTemplateFileName to check if it is cached
3 - To check the file that will be loaded you must go to: /vendor/magento/framework/View/FileSystem.php
4 - Function getTemplateFileName and if you want to get deep, go to View/Design/FileResolution/Fallback/TemplateFile.php
5 - Function getFile will show what is the file that you are trying to load on: vendor/magento/framework/View/Design/FileResolution/Fallback/Resolver/Simple.php
6 - Function resolve will be going though the path and will be loading on: vendor/magento/framework/View/Design/FileResolution/Fallback/Resolver/Simple.php
7 - Function resolveFile you will be able to see what is the loaded file

## Magento will try to load for those directory:
* vendor/magento/theme-frontend-luma/Monsoon_Maintenance/templates/maintenance/index.phtml
* app/code/Monsoon/Maintenance/view/frontend/templates/maintenance/index.phtml


## How to override a block?
* https://www.classyllama.com/blog/template-override-m2