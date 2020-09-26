# Volume commands

## how to create a new volume?
> syntax: docker create --name [volume name] [id or name of image]
```
    docker volume create --name test_volume
```
> note: this will create a new volume called **test_volume**

## how to setup a volume to a container?
> syntax: docker run -it --name [name of the container] -v[name of the volume]:[folder that is being added data on it] [id or name of the image:tag]
```
    docker run -it --name ubuntu_with_volume -v test_volume:/tmp ubuntu/rafael:1.0

    // entering to the folder that i am maping
    root@60810049f32a:/# cd tmp/
    
    // writing a new file inside of this folder
    root@60810049f32a:/tmp# echo "test" > testfile.txt

    // checking the contant of the file
    root@60810049f32a:/tmp# cat testfile.txt 
    test

    // if you dont specify a  mountpoint, you can check it doing:
    docker volume inspect test_volume -f '{{.Mountpoint}}'
    /var/lib/docker/volumes/test_volume/_data
```

### how to check the mountpoint of a volume?
> syntax: docker volume inspect [volume name] -f '{{.Mountpoint}}'

```
    docker volume inspect test_volume -f '{{.Mountpoint}}'
    /var/lib/docker/volumes/test_volume/_data
```

## how to list all volumes?
> syntax: docker volume ls
```
    docker volume ls 
    DRIVER              VOLUME NAME
    local               test_volume
```

## how to remove a volume?
> syntax: docker volume rm test_volume 
```
    // removing the test_volume

    docker volume rm test_volume 
    test_volume

    // checking that was removed

    docker volume ls 
    DRIVER              VOLUME NAME

```

