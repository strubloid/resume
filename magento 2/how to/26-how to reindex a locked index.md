# 26-how to reindex a locked index

## Invalidate indexes command
* php bin/magento indexer:reset

## Reference
* https://blog.chapagain.com.np/magento-2-unlock-reindex-process-via-command-line/

### Result must be something like this
```bash
[root@8cb0c1bedd7d html]# php bin/magento indexer:reset 

Design Config Grid indexer has been invalidated.
Customer Grid indexer has been invalidated.
Category Products indexer has been invalidated.
Product Categories indexer has been invalidated.
Catalog Rule Product indexer has been invalidated.
Product EAV indexer has been invalidated.
Stock indexer has been invalidated.
Product Price indexer has been invalidated.
Catalog Product Rule indexer has been invalidated.
Catalog Search indexer has been invalidated.
Google Product Removal Feed indexer has been invalidated.
Google Product Feed indexer has been invalidated.
```