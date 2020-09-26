#NVM commands


## nvm list
> this will show all local versions avaiable
``` 
    root@bd3069774e18:/workspace# nvm ls                                                                                                                 
    ->      v11.1.0
             system
    default -> 11.1.0 (-> v11.1.0)
    node -> stable (-> v11.1.0) (default)
    stable -> 11.1 (-> v11.1.0) (default)
    iojs -> N/A (default)
    lts/* -> lts/dubnium (-> N/A)
    lts/argon -> v4.9.1 (-> N/A)
    lts/boron -> v6.15.1 (-> N/A)
    lts/carbon -> v8.14.0 (-> N/A)
    lts/dubnium -> v10.14.1 (-> N/A)
    
```

## nvm ls-remote
> this will show all the versions on the server

## how to install a specific version of it ?
``` 
       nvm install 11.0.0
       Note: as you can see, this command i am specifying that will be installed the version 11.0.0
       
       Note2: after installation this will point out to the new installed version, you can check it out doing:
       
       root@bd3069774e18:/workspace# nvm ls
       ->      v11.0.0
               v11.1.0
                system
       default -> 11.1.0 (-> v11.1.0)
       node -> stable (-> v11.1.0) (default)
       stable -> 11.1 (-> v11.1.0) (default)
       iojs -> N/A (default)
       lts/* -> lts/dubnium (-> N/A)
       lts/argon -> v4.9.1 (-> N/A)
       lts/boron -> v6.15.1 (-> N/A)
       lts/carbon -> v8.14.0 (-> N/A)
       lts/dubnium -> v10.14.1 (-> N/A)
        
       or 
       
       root@bd3069774e18:/workspace# nvm current
       v11.0.0    
       
```
## how to check what is the current version runing on my container?
> nvm current

# how to change the version on nvm?
> nvm use [number of the version that you want to set]
``` 
    1. checking the actual version:
        root@bd3069774e18:/workspace# nvm ls
        ->      v11.0.0
                v11.1.0
                 system
        default -> 11.1.0 (-> v11.1.0)
        node -> stable (-> v11.1.0) (default)
        stable -> 11.1 (-> v11.1.0) (default)
        iojs -> N/A (default)
        lts/* -> lts/dubnium (-> N/A)
        lts/argon -> v4.9.1 (-> N/A)
        lts/boron -> v6.15.1 (-> N/A)
        lts/carbon -> v8.14.0 (-> N/A)
        lts/dubnium -> v10.14.1 (-> N/A)
    
    2. changing the version
        root@bd3069774e18:/workspace# nvm use 11.1.0
        Now using node v11.1.0 (npm v6.4.1)
    
    3. checking what is the current version running in the container
        root@bd3069774e18:/workspace# nvm current
        v11.1.0

    Note: this flow was to change from 11.0.0 to 11.1.0 version of nvm
```
