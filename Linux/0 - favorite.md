# how to find a user that have file restrictions?
```
find / -perm -4000
```
>note: -4 -> its the restriction that you are looking for 
>note2: we have a s on the ls -la, this "s" means that have a owner striction
require the owner privileges


# pipes or terminal pipes
```
mkpipe [name-of-the-pipe]
```
this will allow [name-of-the-pipe] be possible to used on another terminal/different processes
