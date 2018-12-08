
# how to list all containers
```
    docker ps -a
```

# how to list all containers that finished the job already?
```
    docker ps -a -f "exited=0"
    
    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS                      PORTS               NAMES
    23b5dac8839b        93fd78260bd1        "/bin/bash"         16 minutes ago      Exited (0) 16 minutes ago                       pedantic_albattani
    7e008eadd200        ubuntu:bionic       "/bin/bash"         16 minutes ago      Exited (0) 16 minutes ago                       jovial_hugle
    d5b85608f76d        ubuntu:bionic       "/bin/bash"         17 minutes ago      Exited (0) 17 minutes ago                       determined_dhawan

```
> note: this will show all containers that already exited from their job

# how to untag an image?
```
    docker rmi [image-name]:[tag]
```
# how to list containers filtering by name
```
    docker ps -f"name=redis"
    
    CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                     NAMES
    e0c57eadc6a7        redis               "docker-entrypoint.s…"   18 hours ago        Up 18 hours         0.0.0.0:32769->6379/tcp   m2_redis-session_1
    55aac6d9a588        redis               "docker-entrypoint.s…"   18 hours ago        Up 18 hours         0.0.0.0:32768->6379/tcp   m2_redis_1

```
> note: this will show all containers that have redis on their name structure

# how to delete a container
```
    docker rm [id or name of the container]

    1. listing the exited process that we might need to remove
    docker ps -a -f "exited=0"
    
    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS                      PORTS               NAMES
    23b5dac8839b        93fd78260bd1        "/bin/bash"         19 minutes ago      Exited (0) 19 minutes ago                       pedantic_albattani
*   7e008eadd200        ubuntu:bionic       "/bin/bash"         19 minutes ago      Exited (0) 19 minutes ago                       jovial_hugle
    d5b85608f76d        ubuntu:bionic       "/bin/bash"         20 minutes ago      Exited (0) 20 minutes ago                       determined_dhawan
    * -> this line with be deleted
    
    2. delete of an container you must choose the name or container id, in this case i am choosing the name of it "jovial_hungle"
    docker rm jovial_hugle
    
    3. now we can list again
    docker ps -a -f "exited=0"
    
    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS                      PORTS               NAMES
    23b5dac8839b        93fd78260bd1        "/bin/bash"         19 minutes ago      Exited (0) 19 minutes ago                       pedantic_albattani
    d5b85608f76d        ubuntu:bionic       "/bin/bash"         20 minutes ago      Exited (0) 20 minutes ago                       determined_dhawan
    
```

# docker container commit
> this will publish changes from a container to create a new instance with that container plus changes that you'd made

# docker container prune
> this will delete all containers, so be sure to have images with correct commits updating changes from the container to be possible build again with all changes

# docker container run -P
> this will create autmatically ports for the service, this will map all the ports with randon port value that inst being used

## what is the port used by -P?
> docker port [id or name of the container]
``` 
    $ macbook% docker port 55aac6d9a588
    6379/tcp -> 0.0.0.0:32769
```
> Note: [Important] the -P will create only the ports on Config.ExposedPorts

# how can i format the image command?
> this example i will try to get the port of the container
``` 
    docker image inspect --format '{{.Config.ExposedPorts}}' [id or name of the container]    
```

#docker container inspect --format
> this will format the things that we are inspecting
``` 
    1. how to see the mounted point of a container
    docker container inspect --format '{{.Mounts}}' [id or name of the container]  

    2. how to get the mounted ports of a container
    docker image inspect --format '{{.Config.ExposedPorts}}' [id or name of the container]
    
    
```

# docker network ls 
> you will see all the local network from docker side


# explanation about docker run and how to map a folder fro your pc into the container structure
``` 
    docker run -d -v $(pwd):/workspace -p 8181:8181 sapk/cloud9 --auth rafael:rafa1234
    
    1. explanationa about the -v param: 
    -v it is the option that you will use to map a place
    
    2. sintaxe of the -v param
    -v [place that you will map in your computer] : [place that you will map into your container]
    
    3. Example
    docker run -d -v $(pwd):/workspace -p 8181:8181 sapk/cloud9 --auth rafael:rafa1234
    Note: this will run the current location "pwd"v command and will be mounted at /workspace folder in the container
    
    Note2: if you have an apache container and you need to setup to be inside of /var/www/yourprojectfolder, you must map like:
    docker run -d -v $(pwd):/var/www/yourprojectname -p 8181:8181 sapk/cloud9 --auth rafael:rafa1234
    
    Note3: you dont need to use the linux command pwd, you also can use the literal path on your computer, using the pwd will only speed things up, but be free to map any local path that will dbe syncronized.
    
```


# docker network [dis]connect




# docker network rm [id of the nertowk]
> this will remove a network