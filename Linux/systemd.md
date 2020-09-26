# Systemd things

## folder responsible on ubuntu to have the configurations
```
vim /usr/lib/systemd/user/ssh-agent.service // this talks about the configuration of the ssh agent
```

## folders with .service .target .soket
```
/usr/lib/systemd/user/
```

>note: I think that inside of the **user** folder have **.wants** folders that are like dependencies for the .targets files, you can try:
```

ls /usr/lib/systemd/user/ | grep .wants

drwxr-xr-x 2 root root 4096 Jul 25 04:06 graphical-session-pre.target.wants/
drwxr-xr-x 2 root root 4096 Jul 25 04:08 graphical-session.target.wants/
drwxr-xr-x 2 root root 4096 Jul 25 04:06 sockets.target.wants/

```

## how to check all the services running by systemctl
```
systemctl list-units --full
```


## how to search by logs for ssh(service name)
```
journalctl -u ssh
```

