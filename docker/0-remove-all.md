# How to remove all docker images and clean the docker environment

```bash
    docker system prune -a
    docker volume rm $(docker volume ls -q)
```