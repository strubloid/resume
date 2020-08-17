## Wifi things

### Try disabling wifi power management 
* by opening /etc/NetworkManager/conf.d/default-wifi-powersave-on.conf 
* change the powersave option to 2
```
wifi.powersave = 3

to

wifi.powersave = 2
```


## You can fix it by turning off bluetooth and wireless coexistence.
> https://askubuntu.com/questions/645009/wi-fi-and-bluetooth-not-working-simultaneously
>
### Run in terminal

```
    sudo tee /etc/modprobe.d/iwlwifi-opt.conf <<< "options iwlwifi bt_coex_active=N"
```
Note: you must reboot after


### Rollback option?
> This setting can be always undone by
```
    sudo rm /etc/modprobe.d/iwlwifi-opt.conf
```


## Another attempt you can do
```
echo "options iwlwifi 11n_disable=1 bt_coex_active=0 power_save=0 auto_agg=0 swcrypto=1" | sudo tee /etc/modprobe.d/iwlwifi-options.conf > /dev/null
```

## Another attempt you can do [2]
```
echo "options iwlwifi 11n_disable=1 11n_disable=8 bt_coex_active=1 power_save=0 swcrypto=1" | sudo tee /etc/modprobe.d/iwlwifi.conf > /dev/null
```

