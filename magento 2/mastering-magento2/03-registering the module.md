# Registering the module
> For this part you will need top switch to terminal mode and type:
```bash
    bin/magento module:enable Mastering_SampleModule
```
## You will get a response like this above:
```bash
[root@0a986776b296 html]# bin/magento module:enable Mastering_SampleModule
The following modules have been enabled:
- Mastering_SampleModule

To make sure that the enabled modules are properly registered, run 'setup:upgrade'.
Cache cleared successfully.
Generated classes cleared successfully. Please run the 'setup:di:compile' command to generate classes.
Info: Some modules might require static view files to be cleared. To do this, run 'module:enable' with the --clear-static-content option to clear them.
```

## Check that the module it's enabled
* Go to etc/config.php

```php
<?php
return [
    'modules' => [
        'Magento_Store' => 1,
        
        // '[other modules]', 
                
        'Mastering_SampleModule' => 1,    // that is out new module
        
        // '[other modules]', 
        
        'Vertex_Tax' => 1
    ]
];
```

## Finalize the module registration
1 - go to terminal 
2 - run the following database upgrade to create the basic structure of the module in the database level
```bash
    bin/magento setup:upgrade
```

## how to check in database level?
```mysql
    SELECT *
      FROM setup_module
     WHERE module like "%Mastering_SampleModule%"
     
     # The result must be:
     # module                |schema_version|data_version|
     # ----------------------|--------------|------------|
     # Mastering_SampleModule|1.0.0         |1.0.0       |
```

