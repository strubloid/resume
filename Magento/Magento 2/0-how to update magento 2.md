# how to update magento 2
> source: https://support.cloudways.com/how-to-upgrade-magento-2-via-cli/

```shell
    $ composer require magento/product-community-edition 2.x.x --no-update
    
    $ composer update
    
    $ rm -rf var/di/* var/generation/* var/cache/* var/log/* var/page_cache/* var/session/* var/view_preprocessed/* pub/static/*
    $ bin/magento setup:upgrade && bin/magento setup:di:compile
    $ bin/magento setup:static-content:deploy -f && bin/magento cache:clean && bin/magento cache:flush && bin/magento indexer:reindex    
```


