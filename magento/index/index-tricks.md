# how to log a file of the handlers

1. Go to index.php and add this line at the end of the file
```
Mage::log(Mage::app()->getLayout()->getUpdate()->getHandles(), null, 'var/log/layouthandlers.log', true);
```
