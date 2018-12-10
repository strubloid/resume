
#what is an docker image
> it is a shape to create a container, imagine a cake pan as image and the cake as the container itself.
1. template used to create containers

# what is a container
1. steps to execute an application
2. based on images
3. this will be a soruce that can run once or can be 24/7, depends only by the exit command from the container itself

# Docker architecture
Client -> "docker run..." -> Engine -> "search for the image..." -> registry (images)
Registry -> "download the image..." -> Engine(Docker Host) -> "bring the container..." -> Client


1. each application is called container
2. a conteiner could be the apache
3. applications are services

# Docker structure
1. Client
2. Docker Host
2.1 Docker daemon
2.2 Containers
2.3 Images
3. Registry

# commands

## docker image
> this will show all images that are installed in your docker instance
```
   $ docker images
   
    REPOSITORY              TAG                 IMAGE ID            CREATED             SIZE
    redis                   latest              5958914cc558        8 days ago          94.9MB
    mariadb                 latest              b468922dbbd7        2 weeks ago         366MB
    mailhog/mailhog         latest              e00a21e210f9        7 weeks ago         19.2MB
    phpmyadmin/phpmyadmin   latest              126b8717cebb        3 months ago        166MB
    rafaelcgstz/magento2    latest              51519a7b2d45        4 months ago        1.04GB
    eugenmayer/unison       2.51.2.1            8131aeebf904        8 months ago        80.7MB

```
> Note: IMAGE ID, if you need to refer this number you only need to use the first 5 characters

# image id or name
> if you need to refer an image you can do copying the image id or only the first 5 characters of it, or you always can try to use the name of the container to refer as well.

# docker run [options][image][command][args]
> command to create a container
```

Options:

-d = will start a container in background

```


# how to remove a container
1. list your containers: docker ps -a
2. docker rm [id or name]






