# how-to-change-apache-user

## Change of the APACHE_RUN configuration
This is localized at `/etc/apache2/envvars`, you must edit this file to change the data on **APACHE_RUN_USER** and **APACHE_RUN_GROUP**, so you must:
### Change from
```
export APACHE_RUN_USER=www-data
export APACHE_RUN_GROUP=www-data
```
### To
```
export APACHE_RUN_USER=strubloid
export APACHE_RUN_GROUP=strubloid
```
> note: strubloid it's my user, so it exist all the basic linux permissions on it, so if you have your own user it's only necessary to change to your own.

## change the fpm www.conf
This file it is localized at `/etc/php/[php-version]/fpm/pool.d/www.conf`, you must edit **www.conf** to replace the **user**, **group**, **listen.owne**r and **listen.group** variables.

### Change from
```
user = www-data
group = www-data

listen.owner = www-data
listen.group = www-data
```
### To
```
user = strubloid
group = strubloid

listen.owner = strubloid
listen.group = strubloid
```

## Change of the fastcgi owner
This file it is localized at `/var/lib/apache2/fastcgi`, you must change the user and group, as it was changed before to be strubloid:strubloid (my case), we need to say to this file has a new owner, your user!

### Syntax
```
    sudo chown [your-user]:[your-user] /var/lib/apache2/fastcgi -Rf
```

### Example
```
    sudo chown strubloid:strubloid /var/lib/apache2/fastcgi -Rf
```
Note: where we have **strubloid:strubloid** you must add your own user
