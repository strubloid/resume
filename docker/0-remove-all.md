# How to remove all docker images and clean the docker environment

## Min prune command
```bash
    docker system prune -a
    docker volume rm $(docker volume ls -q)
```


## removing all instances
```bash
    $ docker kill $(docker ps -qa)
    $ docker rm -v $(docker ps -qa) && docker rmi $(docker images -q)
    $ docker system prune && docker container prune && docker image prune && docker volume prune && docker network prune
```

