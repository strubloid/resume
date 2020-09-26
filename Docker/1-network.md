# docker network

## types of containers
1. microservice: this is an application of a container, this will execute a command and will finish it
2. container: this is an instance of application that will run until something return as a exit command from the container


## how newtwork works?
> When you create an network is basically a way to create a channel to comunicate between containers, when you have a container inside of a network means that all the containers inside of this network can comunicate, an example could be a ping from one container to another
> note: any container can ping if you know the ip of the container, but if you dont have this IP and it is on the same network you can use the network name as a way to identify a container

### type of network
1. bridge: this type will be bridge between host and all containers
2. VETH(Virtual Ethernet): this will provide that the container can have it own eth

## how to list a network?
> syntax: docker network ls
```
	docker network ls
	
	NETWORK ID          NAME                DRIVER              SCOPE
	aea7d2453462        bridge              bridge              local
	251931b9331c        host                host                local
	d08a85d5a0eb        none                null                local
```

## how to delete a network?
> syntax: docker rm [id of the network]

```
	// checking all my networks

	docker network ls
	NETWORK ID          NAME                          DRIVER              SCOPE
	aea7d2453462        bridge                        bridge              local
	251931b9331c        host                          host                local
  *	116478c8ad9c        magento2_mg2studies-network   bridge              local
	d08a85d5a0eb        none                          null                local
	* -> this will be the network that i should delete

	// after listing all my networks i could see that the id **116478c8ad9c** I want to remove, so will do:
	
	docker network rm 116478c8ad9c
	116478c8ad9c

	/// after the command i am showing that is deleted that network

	docker network ls
	NETWORK ID          NAME                DRIVER              SCOPE
	aea7d2453462        bridge              bridge              local
	251931b9331c        host                host                local
	d08a85d5a0eb        none                null                local

```

## how to map a port into a container?
> sytax: docker run -d **-p 8080:80** [image id or name]
```
	docker run -d -p 8080:80 httpd
```
> note this command is running in background (-d), saying to our local port **8080** will be connected to the port **80** from the container using the container **httpd**

## how can I do the port mappig automatically by the listed ports configured into the docker image?
> syntax: docker run -d **-P** [image name]
```
	// an example of command that will map all ports on .Config.ExposedPorts
	docker run -d -P phpmyadmin/phpmyadmin

	// how to check what are the exposed ports?
	docker image inspect -f '{{.Config.ExposedPorts}}' phpmyadmin/phpmyadmin
	map[80/tcp:{} 9000/tcp:{}]
```
> note: as you can see ports 80 and 9000 will be automatically set as **phpmyadmin/phpmyadmin** had exposed those ports into the Dockerfle

