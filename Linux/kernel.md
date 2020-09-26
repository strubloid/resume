

# Steps to update your kernel

## Source
https://linuxhint.com/upgrade-kernel-on-arch-linux/

## upgrade your package manager system
sudo pacman -Syu

## Download a new kernel on https://www.kernel.org/
``` 
    wget https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.20.12.tar.xz
```

### Ps: Make sure that you run this line if you are using Manjaro Linux
```
    sudo pacman -S ncurses make gcc bc openssl
``` 

## Now copy the configuration file that the current kernel is using to the linux-4.15.2 directory with the following command:
```
    zcat /proc/config.gz > .config
```

## Now run the following command to prepare the configuration file for the new version of kernel.
```
    make menuconfig
```

## saving changes
> you must do whatever is necessary and after click to **save** the **.config** file
> later on yu must click on **exit**

## Compiling the kernel
``` 

    # fist part is making the file
    make
    
    # second part is installation of it
    

```


