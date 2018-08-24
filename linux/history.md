# history

## common history files
```
~/.bash_history
~/.history
~/.histfile
```

## size of the history
```
echo $HISTSIZE

```

## running commands from history !(BANG)
```
!N           # you must specify the number from the history list number
!!           # this will be loading the last command
!:[argument number] # this will repeat the **n** number of the argument passed in the last command

```

* !^ = this will get the first argument from a command
```
ls -la rafael

!^    => -la
```

* !$ = this will get the last argument from a command
```
ls -la rafael

!$    => rafael
```