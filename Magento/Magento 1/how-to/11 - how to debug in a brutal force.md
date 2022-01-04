# how to brutal force the xdebug
1. go to the url that you need to debug
2. add at the end of the url this param:
```
?XDEBUG_SESSION_START=1
```

# xdebug v3 configurations
```
zend_extension=xdebug.so
xdeoug.mode=debug
xdebug.client_host=192.168.33.1
xdebug.client_port=9003
xdebug.start_with_request=yes
xdebug.idekey=XDEBUG
xdebug.show_error_trace = 1
xdebug.discover_client_host=false
```
