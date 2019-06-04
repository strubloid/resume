# Main commands for a module


## how to enable a module?
```
bin/magento module:enable [name of the module]

[root@1b52361cf0c5 html]# bin/magento module:enable Monsoon_Beer
The following modules have been enabled:
- Monsoon_Beer

To make sure that the enabled modules are properly registered, run 'setup:upgrade'.
Cache cleared successfully.
Generated classes cleared successfully. Please run the 'setup:di:compile' command to generate classes.
Info: Some modules might require static view files to be cleared. To do this, run 'module:enable' with the --clear-static-content option to clear them.

```

## how to check the module status?
```
bin/magento module:status [name of the module]

[root@1b52361cf0c5 html]# bin/magento module:status Monsoon_Beer
Module is enabled

```

## how to have the first version of module?
```
bin/magento setup:upgrade
```