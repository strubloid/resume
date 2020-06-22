# History

## Windows issue

### Cant see the compiler (cl)
> If you cant find the cl on your visual studio, you must do the following:
* window key + Developer
* you must see the software Developer Command Prompt for VS 2019
* after you open this terminal you must navigate to the correct folder, like: cd d:\unreal-games
* after you are inside of your project folder you must run the following:
``` 
$ code
```
> note: this will open the visual situdio with the c++ compiler, so if you find this cl is missing, you must do all those steps to be able to fix it.

## Issue with the terminal (wasnt bash)
* you must do ctrl + shift + p
* search for: Open Settings Json and change:
 * from
```
    "terminal.integrated.shell.windows": "C:\\WINDOWS\\System32\\cmd.exe",
```
 * To: 
```
    "terminal.integrated.shell.windows": "C:\\Program Files\\Git\\bin\\bash.exe",
```
