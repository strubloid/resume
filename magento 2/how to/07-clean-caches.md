# Clean caches
> I was checking some magento 2 certification training and i could see something interesting on it,
 the instructor was using a different way to clean all the caches:
 ```bash
     sudo rm -rf var/di/* var/generation/* var/cache/* var/page_cache/* var/view_preprocessed/* var/composer_home/cache/*
 ```
 
 > As well we have the command on terminal
 ```bash
     php bin/magento cache:clean
 ```