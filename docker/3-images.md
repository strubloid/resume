# Images commands

## how to see all images in the current system?
```
    docker images

    REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
    hello-world         latest              4ab4c602aa5e        3 months ago        1.84kB
    
```
> note: this will show you all the images installed in the current machine

## how to get all images ID?
```
    docker images -q
    4ab4c602aa5e
```

## how to delete all images?
1. First you must list all images ids: docker images -q
2. You must to add those elements into a container that docker will do multiple things on it: $([here will be put an array of ids])
3. After those parts you must run the docker rmi to remove them
```
    docker rmi $(docker images -q)

    Untagged: hello-world:latest
    Untagged: hello-world@sha256:0add3ace90ecb4adbf7777e9aacf18357296e799f81cabc9fde470971e499788
    Deleted: sha256:4ab4c602aa5eed5528a6620ff18a1dc4faef0e1ab3a5eddeddb410714478c67f
    Deleted: sha256:428c97da766c4c13b19088a471de6b622b038f3ae8efa10ec5a37d6d31a2df0b

```