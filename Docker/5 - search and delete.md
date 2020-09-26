

## how to search
```shell
docker ps -f"name=redis"
```

## how to delete the result from a search?
```
docker rm $(docker ps -aqf"name=ftdn")
```

## How to remove Images
```
docker volume rm $(docker volume ls -f "name=pallas" --format "{{.Name}}")
```




## removing all instances
```bash
    $ docker kill $(docker ps -qa)
    $ docker rm -v $(docker ps -qa) && docker rmi $(docker images -q)
    $ docker system prune && docker container prune && docker image prune && docker volume prune && docker network prune
```