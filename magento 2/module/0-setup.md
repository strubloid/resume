# Convert install/upgrade schema scripts to db_schema.xml files
> for this action we have a magento command to convert from the old to the new method, you must do:
```bash
    # This command below it is for the install scripts
    $ bin/magento setup:install --convert-old-scripts=1 
    
    
    #This command below it is for the upgrade scripts
    $ bin/magento setup:upgrade --convert-old-scripts=1 
```
> this command will loop though the all modules converting all the modules that has the old method


# how to make sure that your setup install/upgrade script dont break anything?
> For magento 2 we have the mode **Dry run mode**, It is important that declarative installation/upgrade does not break anything. 
> A useful way to ensure this is use dry run mode to examine all the DDL SQL statements that are generated during the declarative installation process. 
> In dry run mode, the database state does not change. The schemas and data will be the same before and after installation.

## To enable dry run mode, run one of the following commands:
```bash
    # for install script
    bin/magento setup:install --dry-run=1
    
    # for upgrade scripts
    bin/magento setup:upgrade --dry-run=1
```
> Magento writes a log file at **<Magento_Root>/var/log/dry-run-installation.log**.


# How to rollback a setup/upgrade script? 
> Magento provides options to the setup:install and setup:upgrade commands that enable safe installations and rollbacks:
* --safe-mode=1 - Creates a data dump during the installation or upgrade process.
* --data-restore=1 - (Used with the setup:upgrade command only.) Performs a rollback. Before you rollback, you must first check out code to the previous version of Magento. 

## command to rollback
```bash
   bin/magento setup:upgrade --data-restore=1
```

## where is being stored the safe-mode=1 changes?
> When safe mode is enabled, Magento creates a CSV file each time a destructive operation for a table or column occurs. 
> You can find these files at the following locations:
```bash 
    Magento_root/var/declarative_dumps_csv/{column_name_column_type_other_dimensions}.csv
    Magento_root/var/declarative_dumps_csv/{table_name}.csv
```

# where should we add db_schema.xml?
> <Module_Vendor>/<Module_Name>/etc/db_schema.xml 

# How to generate a patch?
```bash
    bin/magento setup:db-declaration:generate-patch [options] <module-name> <patch-name>
```

bin/magento setup:install --base-url=https://magento2.test/ --db-host=database --db-name=magento --db-user=root --db-password=root --admin-firstname=Magento --admin-lastname=Team --admin-email=magentoteam@monsoonconsulting.com --admin-user=admin --admin-password=rafa1234 --language=en_IE --currency=EUR --timezone=Europe/Dublin --use-rewrites=1 --backend-frontname="admin" --cache-backend=redis --cache-backend-redis-server=redis --cache-backend-redis-db=0 --session-save=redis --session-save-redis-host=redis --session-save-redis-log-level=3 --session-save-redis-db=1 --http-cache-hosts=varnish:80
bin/magento deploy:mode:set production #or deploy:mode:set developer
