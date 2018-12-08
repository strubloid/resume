

## how to check what is the shell that is being running?
```
    echo $SHELL
```

## how to see what are the valid shells on your operational system?

``` 
    vim /etc/shells
```

## how can i change the login shell permanently?

1. you must have installed the program **chsh**
2. iteractive method: chsh
2. non-iteractive method: chsh -s [terminal type], like: chsh -s /bin/bash

## how can i paste a command or instruction between shell terminals?
``` 

    1.  check your terminal doing:
    $ set | grep tty
    TTY=/dev/ttys005
    
    2. open a new terminal and do the same command
    $ set | grep tty
    TTY=/dev/ttys007
    
    3. on your ttys005 type an echo command to ttys007, doing:
    echo "i am writing something on ttys007" > /dev/ttys007
    
    If you have both opened you will be able to see that is being written on the second terminal a message: i am writing something on ttys007
    
```

