# How to export live data and import on stage?
## task ids
> https://jira.monsoonconsulting.com/browse/LFC_SUP-183
> https://monsoonsupport.atlassian.net/browse/LFC-2
> https://monsoonsupport.atlassian.net/servicedesk/customer/portal/10/LFC-2
> https://monsoonsupport.atlassian.net/projects/LFC/queues/custom/45/LFC-2
> 
## Magerun strip options for this
```bash
    n98-magerun.phar db:dump --strip="@stripped @sales @customers @emails @newsletter @trade @idx"
```

## Compressed version of it
```bash
    n98-magerun.phar db:dump --strip="@stripped @sales @customers @emails @newsletter @trade @idx" --no-single-transaction --compression="gzip"
```


## What LFC should do?
1 - Install n98-magerun on live
```
    cd /media/ephemeral0/www/
    wget https://files.magerun.net/n98-magerun.phar
    mv n98-magerun.phar /usr/bin/
    cd /usr/bin/
    chmod +x n98-magerun.phar
```

2 - Export the database using magerun
```
    n98-magerun.phar db:dump --strip="@stripped @sales @customers @emails @newsletter @trade @idx" --no-single-transaction --compression="gzip"
```


3 - 