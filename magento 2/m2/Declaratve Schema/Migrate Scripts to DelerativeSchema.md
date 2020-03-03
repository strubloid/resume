# Migrate Scripts to DelerativeSchema
* Reference: https://devdocs.magento.com/guides/v2.3/extension-dev-guide/declarative-schema/migration-commands.html

## Monsoon Reference
* https://code.monsoonconsulting.com/magento2/osi/commit/7b22da732692bf066024d26dff474c1baf47901b
* https://code.monsoonconsulting.com/magento2/osi/commit/f8b3027a882609d91d4fc915a1d5eae39d93e0c8

## Overview
* Magento provide comands to help convert you installation and upgrades to declarative schema
* These commands also help you test your changes, roll back if anything goes wrong, and maintain the backward compatibility
Note: once you start with **data patches** you cannot continue to use upgrade scripts

## Convert install/upgrade schema scripts to db_schema.xml files
* The Schema Listener Tool converts pre-Magento 2.3 migration scripts into declarative schema.
* to convert you must do the following:
```bash
bin/magento setup:install --convert-old-scripts=1
bin/magento setup:upgrade --convert-old-scripts=1
```
* Note: In Magento 2.3 Alpha, the --convert-old-scripts parameter was named --convert_old_scripts.

## Convert install/upgrade data scripts to the data patch format
* Old scripts might need to use this approach
* Steps to convert are:
  * Generate a patch stub
  ```bash
      bin/magento setup:db-declaration:generate-patch [options] <module-name> <patch-name>
  ```
    * Note: [options]: --revertable determine when a patch can be revertable, the default value it is false
                       --type specifies what type of patch to generate, the default value is **data**
  * All released modules that previously use uptrade scripts must support backward compatibility by
    **implementing \Magento\Framework\Setup\Patch\PatchVersionInteface** and **the getVersion() Method**
  * The getVersion method allows you to skip changes that were applied in previous versions and were done by old scripts
  * The returned value of the **getVersion()** method should be equal to the value of a version in version_compare() function in old scripts
  * When InstallData.php script does not have any version, you just need to specify the first version of your module
    * Example of getversion action:
    ```
        // Imagine that you have a setup/upgrade script with this conditional, and you dont want to run this command
        if (version_compare($context->getVersion(), '1.1.0') < 0) {
           //create cms  block
        }
        
        // You must have a function getVersion()
        public function getVersion(){
            return '1.1.0'
        }
        
        // as you can see this module will return that the version is 1.1.0, and wont be running that script as it is necessary to have lower version than 1.1.0
    ```

## Dry Run mode
* The result of specifying the **--dry-run=1** flag magento creates a log file under /var/log/dry-run-installation.log
* This generated file will contain DDL elements:
```
CREATE   – Creates objects in the database
ALTER    – Alters objects of the database
DROP     – Deletes objects of the database
TRUNCATE – Deletes all records from a table and resets table identity to initial value.
```
* You can/should use those sql for debugging and optimizing performance process

## Safe Installation and Rollback
* Sounds like the best way to do any upgrade script action
* The main advantage and main issue of declarative schema is that can blindly modify the database schema
  *  For example, a developer can make a mistake and potentially remove a structural element from the database, causing data loss.
* As a prevent action of data loss, **you can specify command line options that dump all the data that could be lost**
  * Check this reference: https://devdocs.magento.com/guides/v2.3/install-gde/install/cli/install-cli-backup.html
* Magento provides options to the setup:install and setup:upgrade commands that enable safe installations and rollbacks
```bash
    # Creates a data dump during the installation or upgrade process.
    --safe-mode=1
    
    # (Used with the setup:upgrade command only.) Performs a rollback. Before you rollback,
    # you must first check out code to the previous version of Magento. 
    # Then run setup:upgrade --data-restore=1.
    --data-restore=1 
```
* Destructive operations (DO)
  * SQL DDL operations that cause data deletion or data corruption. The following operations are destructive:
     * Deleting a table
     * Deleting a column
     * Reducing column length
     * Changing column precision
     * Changing the column type
     * Opposite to destructive operations (ODO) - In the case of a failed Magento installation,
     SQL DDL operations that are the opposite of destructive operations can be used for rollback.
     For example, changing the column type from CHAR to INT is a destructive operation.
     The rollback operation changes the type from INT to CHAR.
* When the --save-mode=1 is enabled, Magento creates a CSV file each time that a destructive operation for a table or column occurs
  you can find over locations:
  * Magento_root/var/declarative_dumps_csv/{column_name_column_type_other_dimensions}.csv
  * Magento_root/var/declarative_dumps_csv/{table_name}.csv

## Create a Schema whitelist
* Backward compatibility must be maintained.
* Declarative schema does not automatically delete database tables,columns or keys that are not defined in a db_schema.xml file.
  * Declarative schema cannot delete these elements because these items can be declared somewhere else, such as in an Setup/UpgradeSchema.php file.
* The **<module_vendor>/<module_name>/etc/db_schema_whitelist.json** file provides a history of all tables, columns, and keys added with declarative schema.
* It is required to allow drop operations. It can be generated manually or created automatically with the following command:
```bash
    bin/magento setup:db-declaration:generate-whitelist [options]
```
* [options] can be --module-name[=module-name] specifies wich module to generate the whitelist
* if no module is specified then **the default behaviour** is to **generate a white list for all modules** or
you can specify the param **--module-name=all**
* as best practice you should **generate a new whitelist for each release**.
Q: do we have this set in our docker process?

### Example of db_schema_whitelist.json
```json
{
    "adminnotification_inbox": {
        "column": {
            "notification_id": true,
            "severity": true,
            "date_added": true,
            "title": true,
            "description": true,
            "url": true,
            "is_read": true,
            "is_remove": true
        },
        "index": {
            "ADMINNOTIFICATION_INBOX_SEVERITY": true,
            "ADMINNOTIFICATION_INBOX_IS_READ": true,
            "ADMINNOTIFICATION_INBOX_IS_REMOVE": true
        },
        "constraint": {
            "PRIMARY": true
        }
    },
    "admin_system_messages": {
        "column": {
            "identity": true,
            "severity": true,
            "created_at": true
        },
        "constraint": {
            "PRIMARY": true
        }
    }
}
```

