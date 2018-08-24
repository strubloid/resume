# how to change the apache user + php configurations file to use the fpm

## change the APACHE_RUN_USER and APACHE_RUN_GROUP
* locate: /etc/apache2/envvars 
* action: sudo vim /etc/apache2/envvars 
* from:
```
export APACHE_RUN_USER=www-data
export APACHE_RUN_GROUP=www-data
```
* to:
```
export APACHE_RUN_USER=strubloid
export APACHE_RUN_GROUP=strubloid
```

## change the fpm www.conf
* locate: /etc/php/[php-version]/fpm/pool.d/www.conf
* action: sudo vim /etc/php/7.1/fpm/pool.d/www.conf
* from:
```
user = www-data
group = www-data

;check below that you will find the listen

listen.owner = www-data
listen.group = www-data
```
* to:
```
user = strubloid
group = strubloid

listen.owner = strubloid
listen.group = strubloid
```
## changing the /var/lib/apache2/fastcgi owner
* command: sudo chown strubloid:strubloid /var/lib/apache2/fastcgi -Rf