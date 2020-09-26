# Installation

## How did I install this module?
```bash
php bin/magento setup:install --base-url=https://it.strubloid.test/ --db-host=database --db-name=magento --db-user=root --db-password=root --admin-firstname=strubloid --admin-lastname=strubloid --admin-email=strubloid@gmail.com --admin-user=admin --admin-password=rafa1234 --language=en_IE --currency=EUR --timezone=Europe/Dublin --use-rewrites=1 --backend-frontname="backend" --cache-backend=redis --cache-backend-redis-server=redis --cache-backend-redis-db=0 --session-save=redis --session-save-redis-host=redis --session-save-redis-log-level=3 --session-save-redis-db=1 --http-cache-hosts=varnish:80
bin/magento deploy:mode:set production #or deploy:mode:set developer
```