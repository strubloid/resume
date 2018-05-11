
# root folder
## config.php
> This is the main configuration file for shopware, this will take your configuration and make sure that will coneect with your services (database, elastic search...)

## engine/Shopware/Configs/Default.php
> This file contains the different possibilities about configuration, cache configuration, errors reporting cdn,snipets handling, elastic search ans others as well, so you should study this file.

## config_dev.php
> this is the file that will have the **dev environments** that will be ignored by git, so you will be able to have your local configurations in this file, making the live site uses only the Config.php, separating files and organizing the configuration structure.
