# how to setup a local email server

# How to install?

## point a localhost termination
> You must point to **localhost.com**, so you must:

1. go to /etc/hosts
2. add the line:
```
127.0.0.1       localhost.com

```

## you must install postfix
```
sudo apt-get install postfix
```
> Note This will be the steps to install postfix, you must choose:

1. **Local Only**     (first terminal screen)
2. **localhost.com**  (second terminal screen)

# How to configure?

## Configure to catch all emails from @localhost.com
1. If not exists, create file /etc/postfix/virtual: sudo vim /etc/postfix/virtual
2. execute to get your user: 
```
whoami
```
3. add the content changing the [whoami-response] for the response of the **whoami**:
```
@localhost [whoami-response]
@localhost.com [whoami-response]
```

## configure the postfix to read this file
1. open **/etc/postfix/main.cf**:
```
sudo vi /etc/postfix/main.cf
```
2. search to see if this element exists: **virtual_alias_maps**
```
on vim you must type: /virtual_alias_maps
```
> Note: if this line isn't there you can add, otherwise you only need to configure this line.
3. configure to be:
```

virtual_alias_maps = hash:/etc/postfix/virtual
``` 
4. you must activate with a command:
```
sudo postmap /etc/postfix/virtual
```
5. you must reload the postfix to be able to work
```
sudo systemctl restart postfix

or

sudo service postfix reload

```
> Note: check your debian version, you can use systemctl or service, just changes between linux versions.

# How to configure a email catcher like thunderbird to catch those emails?

## how to install thunderbird?

1. you must run the command: 
```
sudo apt-get install thunderbird
```

## how to configure the thunderbird?

1. Skip the welcome screen
2. Click in the Settings button at top right (similar to Chrome settings) then click on Preferences > Account Settings
3. Under Account Actions choose "Add Other Account"
4. Select "Unix Mailspool (Movemail)"
5. identity: **name** and **email** address: [whoami-response]@localhost
6. Ingoing and Outgoing server will be: localhost
7. Restart the thunderbird.

Note: I also restarted my computer after...
