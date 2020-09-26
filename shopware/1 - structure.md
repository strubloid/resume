# bin: `[root]`/bin
this is the shell folder, you can add shell actions in this folder, as an example we have the **console** program over there that will allow you make some handy actions like refresh your plugin, activate it or even clean cache.

# Custom: `[root]`/custom
> Contains subdircture **plugins**, this is the place that will u place your plugins that you will develop.

# Engine: `[root]`/engine
> Contains **engine** folder that provides:

## Engine/Library: `[root]`/engine/Library
> Contains all tird party libraries that shopware relies on

## Engine/shopware: `[root]`/engine/Shopware
> Contains the whole Shopware code, this is the core folder of shopware

### Engine/shopware/Controllers
> All folders inside of this it is called **modules**

### Engine/shopware/plugins
> This is the folder that will store all plugins before the current version of shopware
> Dedicated location for those old things

# Files
> This that you will offer to download in your website by an click action, those files must be visible for the web enviroment, also can it be a product (downloadeable one)

# media
> contains everything that is managed by shopware internal media manager, this folder will contain all hashed folder names that shopware creates it.

# themes
## themes/Frontend
> All files related to frontend stuff

### themes/Frontend/Bare
frontend -> you will find the different **components** that they are
### themes/Frontend/Responsive

## themes/backend
> All files associated to backend things