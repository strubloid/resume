# ho to make text proportional to a high resolution


## Refenrece
* https://www.pcworld.com/article/2911509/how-to-make-linuxs-desktop-look-good-on-high-resolution-displays.html
* https://askubuntu.com/questions/1029436/enable-fractional-scaling-for-ubuntu-18-04
* https://www.omgubuntu.co.uk/2019/06/enable-fractional-scaling-ubuntu-19-04

## Command
```
gsettings set org.gnome.desktop.interface text-scaling-factor 1.4
```

## Command 2
```
xrandr --output eDP1 --scale 1.25x1.25
```

## Comand 3 enable scaling
```
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"
gsettings set org.gnome.mutter experimental-features "['x11-randr-fractional-scaling']"
```


## Test
```
gsettings set org.gnome.desktop.interface scaling-factor 2
gsettings set org.gnome.settings-daemon.plugins.xsettings overrides "{'Gdk/WindowScalingFactor': <2>}"
xrandr --output eDP1 --scale 1.5x1.5
xrandr --output eDP1 --panning 3840x2160
```