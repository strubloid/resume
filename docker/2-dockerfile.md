# FROM 
> indicate the image base

# MAINTAINER 
> this is the author of this image

# RUN [command]
> this will run a shellscript command 

# ADD
> this will be able to copy a file from the host to inside of the thing inside of the image

# EXPOSE
> this will say what is the port that the container will listen

# ENTRYPOINT
> this will be the binary that will be executed, and with the CMD command will say what will be the end of the container execution
> call a shellscript that can specify what are the things that will be executed

# CMD
> define a command that will execute, if was specified and ENTRYPOINT, this will be the params of the execution of that binary(shellscript)
> if this command stop the container will stop as well


# sample of order in the dokerfile
```
    FROM debian
    MAINTAINER Rafael <rafael@rafael.com>
    RUN apt-get update
    RUN apt-get install -y nginx
    ADD ~/index.html /var/www/html
    EXPOSE 80
    ENCRYPOINT ["/usr/sbin/nginx"]
    CMD ["start", "-9"]
```

# shorter version of it
```
    FROM debian
    MAINTAINER Rafael <rafael@rafael.com>
    RUN apt-get update && apt-get install -y nginx
    ADD ~/index.html /var/www/html
    EXPOSE 80
    CMD service nginx start -g
```

# how to build?
> docker build [-t image:tag] [image name] [place]
1. -t [image name tag]: param to inform the image tag (if you don't specify the tag name will be the "latest" set on it)
2. [image name]: name of the image/tag
3. [place]: place that will store the image


> docker build -t rafael/nginx
> -t = image tag

