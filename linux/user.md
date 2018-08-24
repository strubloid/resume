# user commands


# how can i get how many atempts of login i have in my linux?
> the source is: /var/log/faillog 
```
faillog  <--- this will show all failures log in your system

faillog  -a <-- this will show all the users and their atempts, like a list

```


# how to change the max days for a linux user password?
```
PASS_MAX_DAYS   99999

# this variable is localized at:  /etc/login.defs 
```

## sudo nano /etc/login.defs

```
The login.defs file contains the following settings which you might want to change:

PASS_MAX_DAYS - How long before a password expires. 
PASS_MIN_DAYS - How often can a password be changed.
PASS_WARN_AGE - Number of days warning before a password expires.
LOGIN_RETRIES - Number of login attempts before failure.
LOGIN_TIMEOUT - How long is it before the login times out.
DEFAULT_HOME - Can a user login if no home folder exists.
```

## how can i specify those paramethers when we are creating an user? 
```
sudo useradd [user] -m -K PASS_MAX_DAYS=5 -K PASS_WARN_AGE=3 -K LOGIN_RETRIES=1
```

## how to force a user creating without the home folder?
```
useradd -M [user]

```
> the param **-M** is to force this action 


# su command
super user will be called only if you use the command 
```
su
```
## su - [user]
> It is used to provide an enviroment to the current user 

## su -c 'echo $USER' [user]
> the **-c** allows us to send a command for that user
```

  su -c 'echo $USER' oracle <--- this will try to get a variable from your current user


  su -c 'echo $USER' - oracle <--- this will print out the variable from the oracle user

```

## how to create a user with home directory?

```
  sudo useradd -m [user]
```
> sudo useradd -m rafael

## how to create a password for the new user?
```
  sudo passwd [user]
```
> sudo passwd rafael 

# useradd

## how to create a user?
```
 sudo useradd [name-of-the-user]

```
> sudo useradd rafael
> What will happen when this command is run will depend on the contents of the configuration file located in /etc/default/useradd.
> you always can check it out or change the defaults doing:
```
  sudo vim /etc/default/useradd

```

# userdel
## how to delete a user?
```
  sudo userdel [name-of-the-user]

```
> sudo userdel rafael


# usermod

## how to say that a user is a sudor?
```
sudo usermod -aG sudo [user]

```
> sudo usermod -aG sudo rafael
