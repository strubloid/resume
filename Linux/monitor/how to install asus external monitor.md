## comands that i ran before

## installing the EDVI
```
    
    cd ~/Downloads/monitor
    
    wget https://aur.archlinux.org/cgit/aur.git/snapshot/evdi.tar.gz
    
    tar -zxvf  evdi.tar.gz -C .
    
    cd /home/strubloid/Downloads/monitor/evdi
    
    makepkg -si
```


## installation of the video driver
``` 
    cd .. (we are inside of /home/strubloid/Downloads/monitor/evdi )
    
    wget https://aur.archlinux.org/cgit/aur.git/snapshot/displaylink.tar.gz

    tar -zxvf  displaylink.tar.gz -C .
    
    cd displaylink
    
    makepkg -si

```

## udl is the kernel module that manage displaylink V1 driver, which the current driver use as a base. activate udl kernel module and start displaylink service,
``` 
    sudo modprobe udl
    
    sudo systemctl start displaylink.service 

```

## extra config for nvidia
``` 
    cd  /etc/X11/xorg.conf.d/

```


## list of files
1. /usr/share/X11/xorg.conf.d/20-evdidevice.conf
2. /etc/X11/mhwd.d/nvidia.conf
3. xorg folder: /etc/X11/xorg.conf.d
4. nvidia different folder for the xorg on manjaro: /etc/X11/mhwd.d/
5. nvidia xorg file: /etc/X11/mhwd.d/nvidia.conf




























## first install the package “base devel”, it will install GCC and other things to compile and build things
``` 
    sudo pacman -S --needed base-devel
```

## second you must download the linux header to be able to make the evidi
```

    1- uname -r
    2- pacman -Ss linux headers | grep 4.19
    
    ps: i added the 4.19 because i got it as a response from "uname -r"
    
    3 - sudo pacman -S core/linux419-headers 

```

> note: in my case i needed to do an extra step to update the header
``` 
    cd /usr/lib/modules/
    
    sudo mv 4.19.18-1-MANJARO ~/usrlibmodules/BACKUP_4.19.18-1-MANJARO -f  
    
    sudo cp 4.19.25-1-MANJARO/ 4.19.18-1-MANJARO/ -Rf 
    
    sudo ln -s ./4.19.25-1-MANJARO 4.19.18-1-MANJARO

```


## third you must to go to a folder that you want to install this
``` 
    cd ~
    mkdir programs
    cd programs
    wget https://aur.archlinux.org/cgit/aur.git/snapshot/displaylink.tar.gz
    
    tar -xvzf  displaylink.tar.gz -C .
    cd displaylink/
    makepkg -si

```

https://savoisn.github.io/post/displaylink_on_arch/

## udl is the kernel module that manage displaylink V1 driver, which the current driver use as a base. activate udl kernel module and start displaylink service,
``` 
    sudo modprobe udl
    sudo systemctl start diplaylink.service
    
```

/home/strubloid/Downloads/kernel/linux-4.20.12

[    2.479087] usb 2-6: Product: ASUSTEK MB169B+
[  401.635592] usb 2-6: Product: ASUSTEK MB169B+




[    2.479087] usb 2-6: Product: ASUSTEK MB169B+
[  401.635592] usb 2-6: Product: ASUSTEK MB169B+
[ 1324.258411] usb 2-6: Product: ASUSTEK MB169B+




sudo vim /usr/share/X11/xorg.conf.d/20-evdidevice.conf 













## now you need to run a few extra steps to configure the monitor
```
    cd displaylink
    
    lsusb
    
    sudo modprobe udl
    
    systemctl enable displaylink.service
    systemctl start displaylink.service
    systemctl status displaylink.service
    xrandr --listproviders
    
    xrandr --setprovideroutputsource 1 0
    xrandr --output DVI-1-0 --mode 1920x1080 --right-of eDP1

```
git clone https://aur.archlinux.org/displaylink.git