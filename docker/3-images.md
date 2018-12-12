
# how to get all images ids
``` 
    docker images -q

    6bf21a75719a
    5958914cc558
    b468922dbbd7
    ae6b78bedf88
    e00a21e210f9
    0cbf37812bff
    4ab4c602aa5e
    126b8717cebb
    51519a7b2d45
    
```

# how to remove all the images, like a prune of containers
> note:  for this action you must first get all the ids and run this code into a "docker rmi"
``` 
    docker rmi $(docker images -q)
```

