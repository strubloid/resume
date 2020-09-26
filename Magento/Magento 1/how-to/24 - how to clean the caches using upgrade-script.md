# How to clean the caches by upgrade script
```
    $types=array('config','layout','block_html','translate','collections','eav','config_api','config_api2');
    foreach($types as $type) {
        $c = Mage::app()->getCacheInstance()->cleanType($type);
        Mage::dispatchEvent('adminhtml_cache_refresh_type', array('type' => $type));
    }
```
> Note: make sure that the $types array argument contains all necessary index, if we need to flush the redis cache, you might need to add 
the redis cache into this list of cache refresh, so be aware of that we might need a redis module to be able to run this with redis.



