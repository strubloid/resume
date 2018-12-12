# Container main commands

## how to list all active containers?
```
	docker container ls 
	
	CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
	9c7cf253396d        ubuntu              "/bin/bash"         5 seconds ago       Up 3 seconds                            frosty_kowalevski


```
> note this will list all containers that are in execution


## how to list all cantainers (inactive and active)
```
	docker container ls -a

	CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS                     PORTS               NAMES
	20cfd5bb23fd        ubuntu              "/bin/bash"         25 seconds ago      Exited (0) 6 seconds ago                       xenodochial_shirley

```
> note: this will show all containers, active and inactive one as well, so if you need to see if a container exists you might use this command.


## how to run a container?
> syntax: docker run [options] [image name or id] [command] [args for the command]
```
	docker run -it ubuntu

	root@9c7cf253396d:/# 
```
> note: as you can see I am running an image name called **ubuntu** and I am asking to  have options "i and t" (starts with iteration and with a terminal) and the response is a terminal of that container.


### docker container options
1. -i: starts with iteration from the container
2. -t: starts with a terminal
3. -d: starts the container on background

### how to get information from a container using commands and args
```
	docker run ubuntu ps aux 
	
	USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
	root         1  6.0  0.0  25944  1432 ?        Rs   14:49   0:00 ps aux
```
> note: you can see that the comand **ps** with argument **aux** returned a snapshot of the current processes inside of image **ubuntu**, and showing this on the screen this container is finished and now you get your normal terminal line from your pc.


### how to get information running in a backgroud? ([option = -d])
```
	docker run -d ubuntu ps aux 
```

### how to create a container?
> syntax: docker run -itd --name [name of the new container] [name of the image or id]
```
	docker run -itd --name rafael-ubuntu ubuntu
	44949bd3b6587bf849a152fb8bce3c655f97a2c73af44c9d0bf37265bffea4b1

	> strubloid@sabia [/home/strubloid/webroot/docker] 2018-12-12 15:14:03 $
	docker container ls 
	CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
	44949bd3b658        ubuntu              "/bin/bash"         5 seconds ago       Up 3 seconds                            rafael-ubuntu
	9c7cf253396d        ubuntu              "/bin/bash"         32 minutes ago      Up 32 minutes                           frosty_kowalevski

```
> note: the first command I am creating a new image from the **ubuntu** one, i am naming my image as **rafael-ubuntu** using the param **--name**
> note2: the second command I am listing all images, as you can see if you check the name it is **rafael-ubuntu** but **the image** it's still **ubuntu**

#### container check of linux version
> note: this is a good way to check what is the container that you are in the moment, so you can see if you are doing the correct thing in the correct place
```
	docker run ubuntu cat /etc/issue.net
	Ubuntu 18.04.1 LTS
```
> note2: what i was trying to say is if you expect to fix something on a cent.os machine this clearly is an ubutu one, so you must change the id or name of the image to get the correct one.

## how start or stop a container?
> syntax: docker start/stop [container id or name]
```
	docker container ls -a
	
	CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
	44949bd3b658        ubuntu              "/bin/bash"         15 minutes ago      Up 15 minutes                           rafael-ubuntu
	9c7cf253396d        ubuntu              "/bin/bash"         About an hour ago   Up About an hour                        frosty_kowalevski

	docker stop rafael-ubuntu
	rafael-ubuntu

	docker container ls -a
	
	CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS                     PORTS               NAMES
	44949bd3b658        ubuntu              "/bin/bash"         15 minutes ago      Exited (0) 8 seconds ago                       rafael-ubuntu
	9c7cf253396d        ubuntu              "/bin/bash"         About an hour ago   Up About an hour                               frosty_kowalevski

```
note: as you can see we have the first container working fine, I am using it's name to stop and the second **docker container ls -a** it is showing the status **Exited (0) 8 seconds ago**

### how to capture a container that was natually stoped by finishing of the command or using a docker stop?
```
	docker ps -a -f "exited=0"

	CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS                     PORTS               NAMES
	44949bd3b658        ubuntu              "/bin/bash"         18 minutes ago      Exited (0) 3 minutes ago                       rafael-ubuntu
```
> note: In out case we can see only that the rafael-ubuntu stoped by the docker stop command, so the exit status is equal to zero, so we will filter by **exited=0**


## how to execute commands in a container that is already in background execution?
> sintaxe: docker exec [options] [container name or id] [command] [args of the command]
```
	docker exec frosty_kowalevski ps aux
	
	USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
	root         1  0.0  0.0  18508  3432 pts/0    Ss+  14:41   0:00 /bin/bash
	root        23  0.0  0.0  34400  2852 ?        Rs   15:37   0:00 ps aux

	docker container ls -a
	CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS                     PORTS               NAMES
	44949bd3b658        ubuntu              "/bin/bash"         23 minutes ago      Exited (0) 8 minutes ago                       rafael-ubuntu
	9c7cf253396d        ubuntu              "/bin/bash"         About an hour ago   Up About an hour                               frosty_kowalevski
```
note: as you can see the command **docker exec** will run a command inside of a container, wont be creating a new one like **docker run** using the image as reference, also you can notice that i am using the name of the container instead of image name, as you can see above:

```
	docker run ubuntu ps aux
	
	USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
	root         1  0.0  0.0  25944  1568 ?        Rs   15:40   0:00 ps aux

	docker container ls -a

	CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS                      PORTS               NAMES
  *	dc12b352019b        ubuntu              "ps aux"            6 seconds ago       Exited (0) 4 seconds ago                        modest_cocks
	44949bd3b658        ubuntu              "/bin/bash"         26 minutes ago      Exited (0) 10 minutes ago                       rafael-ubuntu
	9c7cf253396d        ubuntu              "/bin/bash"         About an hour ago   Up About an hour                                frosty_kowalevski

	* -> this was generated for the command ps aux
```

### docker exec options
1. -i: starts with iteration from the container
2. -t: starts with a terminal

### how to get an exec command from a container and save into a new file on your computer?
```
	docker container exec -it 9c7cf cat /etc/issue.net > linux-type.txt

	cat linux-type.txt
	Ubuntu 18.04.1 LTS

```


## Container Logs

### how to check all terminal command lines and responses from a container?
> syntax: docker logs [options] [container id or name]
```
	docker logs 9c7cf253396d

	root@9c7cf253396d:/# ls
	bin  boot  dev  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var

	root@9c7cf253396d:/# ps -a
	  PID TTY          TIME CMD
	   14 pts/0    00:00:00 ps
```
> note: you can see that i had 2 commands in this container, first one is the **ls** and the second one is **ps -a** with respectives responses from each command.
> note: anytime that you want to iteract logs you only need to inform 5 first characters from the id and will be the same thing as the whole thinging

### how to have a watch for all iterations on the container?
> syntax: docker logs -f [id or name of the container]
```
	docker logs -f frosty_kowalevski

	root@9c7cf253396d:/# ps -a
	  PID TTY          TIME CMD
	   14 pts/0    00:00:00 ps

	root@9c7cf253396d:/# ls 
	bin  boot  dev  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
	
	root@9c7cf253396d:/# i am iterating with the thing
	bash: i: command not found
```
> note: As you can notice i was getting all the iterations from one shell and i was getting what i was doing on another shell that was logged into the container and doing **ps -1**, **ls** and ** i am iterating with the thing**  with respectives responses below each command.


## Container info

## how to get informations about the container?
> syntax: docker inspect [container id or name]
```
	docker inspect 9c7cf253396d
	[
	    {
	        "Id": "9c7cf253396d400e31aea61df7d2b319e27af2e85bdfcd3f854ba66e1753355c",
	        "Created": "2018-12-12T14:41:18.235815751Z",
	        "Path": "/bin/bash",
	        "Args": [],
	        "State": {
	            "Status": "running",
	            "Running": true,
	            "Paused": false,
	            "Restarting": false,
	            "OOMKilled": false,
	            "Dead": false,
	            "Pid": 24760,
	            "ExitCode": 0,
	            "Error": "",
	            "StartedAt": "2018-12-12T14:41:19.730048863Z",
	            "FinishedAt": "0001-01-01T00:00:00Z"
	        },
	        ... a lot more information about it ...
	    }
    ]
```
### how to filter by parts that you want to know more about it? 
> syntax: docker image inspect --format '{{[place that you want a part of the infrmation, must start with a dot ".", and each child will be following by dot as well]}}' [id of the image or name]
```
	docker image inspect --format '{{.Os}}' 93fd78260bd1
	linux
```
> note: this first example it is showing what is the Operational System of the image 93fd78260bd1

```
	docker image inspect --format '{{.ContainerConfig.Hostname}}' 93fd78260bd1
	1501390588c6
```
> note: you must see that i am just showing how to get information from a ContainerConfig->Hostname data

### how to see what is the status of the container?
```
	docker stats 9c7cf253396d

	CONTAINER ID        NAME                CPU %               MEM USAGE / LIMIT    MEM %               NET I/O             BLOCK I/O           PIDS
	9c7cf253396d        frosty_kowalevski   0.00%               3.16MiB / 15.53GiB   0.02%               25.9kB / 0B         0B / 0B             1

```
> note: this will be showing in a terminal like linux command **top**, this will be changing each time that something iteract with that container, so if you want to see if a container is being too busy, that will be the way using a terminal to check how much memory is being used or cpu, or any related data to execution of this container


## container iterations

### how to copy a file from your pc to a container?
> syntax: docker cp [file on your computer] [container name or id]:[destination path]
```
	docker cp test-file.txt frosty_kowalevski:/copied-files/
```
> note: this will copy the test-file from  your computer to the folder /copied-files/

### how to download a file from the container to your pc?
> syntax: docker [container id or name]:[full path of the file that you need to copy] [destination folder in your computer]

```

	// in the container machine
	root@9c7cf253396d:/copied-files# touch container-file.txt && echo "container file" > container-file.txt  


	// in my local machine
	docker cp frosty_kowalevski:/copied-files/container-file.txt .

	cat container-file.txt 
	container file
```

## container actions

### how to remove a container?
> syntax: docker rm [id or name of the container]
```
	docker rm 44949
```
> note: this will remove this container id(44949bd3b658) only if this container **isn't running**, so you must **stop a container before remove it**


### how to load an image?
> syntax: docker pull [image name]
```
	// checking that i dont have the hello-wolrd image

	docker images
	REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
	ubuntu              latest              93fd78260bd1        3 weeks ago         86.2MB

	// pulling the data from dockerhub, as I dont have on my pc
	docker pull hello-world
	
	Using default tag: latest
	latest: Pulling from library/hello-world
	d1725b59e92d: Pull complete 
	Digest: sha256:0add3ace90ecb4adbf7777e9aacf18357296e799f81cabc9fde470971e499788
  *	Status: Downloaded newer image for hello-world:latest
  	* -> this line is saying that i am downloading an image from dockerhub


	// trying again to pull data from dockerhub, I already have the image, so will use the local image instead of download the image from dockerhub
	docker pull hello-world
	
	Using default tag: latest
	latest: Pulling from library/hello-world
	Digest: sha256:0add3ace90ecb4adbf7777e9aacf18357296e799f81cabc9fde470971e499788
  *	Status: Image is up to date for hello-world:latest
  	* -> this line is saying that I already have the image, so instead of download of the image i am using the local one

```
> note: this will try to load from a local image first, and later on that will be trying to load from dockerhub (main repository of images from docker)


# Containers applications

## how to create a new image with changes by another image base?
1. you must start a container
2. make changes inside of this container
3. persist the data on a new container
4. run the new container

```
	// starting a container 
	docker exec -it ubuntu bash

	// trying to load a vim, but in the ubuntu image **we dont have vim by default**
	root@0383c89f7bde:/# vim rafael        
	bash: vim: command not found

	// installing the vim
	root@0383c89f7bde:/# apt update && apt install vim -y

	// checking that now it is installed
	root@0383c89f7bde:/# vim --version | grep "VIM - Vi"
	VIM - Vi IMproved 8.0 (2016 Sep 12, compiled Apr 10 2018 21:31:58)

	// after leave the bash with ctrl+c you must check the id of the container that you were changing things
	docker container ls -a
	CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS                      PORTS               NAMES
	0383c89f7bde        ubuntu              "bash"              7 minutes ago       Exited (0) 18 seconds ago                       gifted_bhaskara


	// now we must persist the changes into a new container with the VIM installed on it
	docker commit -m "new instance of ubuntu with VIM on it" -a "rafael mendes" 9c7cf253396d ubuntu/rafael:1.0 

	// now listing the new image that i just added
	docker images 
	
	REPOSITORY          TAG                 IMAGE ID            CREATED              SIZE
	ubuntu/rafael       1.0                 bfdd311be1d2        About a minute ago   170MB
	ubuntu              latest              93fd78260bd1        3 weeks ago          86.2MB

	// showing all the containers that we have
	docker container ls -a
	
	CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS                      PORTS               NAMES
	9c7cf253396d        ubuntu              "/bin/bash"         3 hours ago         Exited (0) 17 seconds ago                       frosty_kowalevski

	// deleting this container with changes
	docker container rm 9c7cf253396d	

	// start a new container by the new image **ubuntu/rafael**
	docker run -it ubuntu/rafael:1.0 bash

	// checking that we have the VIM in this image that we just built
	root@36f7b7c75fe1:/# vim --version | grep "VIM - Vi"
	VIM - Vi IMproved 8.0 (2016 Sep 12, compiled Apr 10 2018 21:31:58)

```
note: as you can see the process of commit of changes into a **container** with **commit** command will provide a new image with all the changes on it








