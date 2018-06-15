
# how to block an underires device
1. rfkill list all
2. check your undesired device, in our case (ideapad)
```
0: ideapad_wlan: Wireless LAN
	Soft blocked: no
	Hard blocked: yes
1: ideapad_bluetooth: Bluetooth
	Soft blocked: yes
	Hard blocked: yes
2: hci0: Bluetooth
	Soft blocked: yes
	Hard blocked: no
3: phy0: Wireless LAN
	Soft blocked: no
	Hard blocked: no
```
3. do it on terminal
```
echo "blacklist ideapad-laptop" | sudo tee /etc/modprobe.d/ideapad-blacklist.conf
```


condition failed 
active (running)
active (exited)
failed (Result: exit-code)