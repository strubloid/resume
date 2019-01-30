# How to create a service for systemmd?

1 - Main folder of the services is localized at:
```
    ls /lib/systemd/system
```
> Note: inside of this folder will contain bunch of .service files.

## First code will be a startup things
``` 
[Unit]
Description=Example systemd service.

[Service]
Type=simple
User=root
ExecStart=/bin/bash /usr/local/bin/rafael_startup.sh

[Install]
WantedBy=multi-user.target
```

## How to check the process?
``` 
sudo systemctl status rafael-startup.service
```

## How to start and stop the process?
``` 
sudo systemctl [start|stop|restart] rafael-startup.service
```

## If you fix a process and the previous code was failing you must sometimes do
```
sudo systemctl daemon-reload
```

>Note: you will see that the process /usr/local/bin/rafael_startup.sh will be loaded with all the configurations in it.