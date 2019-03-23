# how to fix issue with mac using bash instead of zsh
> So I am pasting this solution as i took long to understand why should we use zsh on mac, I am working with mac environment and I was almost killing myself only because i was with issue with the keyboard after the migration from zsh to bash, so let's fix this don't you think? 

## fixing the file /etc/imputrc
> this file mainly is the terminal keyboard source, so you will be able to control a few nice things, just paste the content below and have fun!

```
# Begin /etc/inputrc
# Modified by Chris Lynn <roryo@roryo.dynup.net>

# Allow the command prompt to wrap to the next line
set horizontal-scroll-mode Off

# Enable 8bit input
set meta-flag On
set input-meta On

# Turns off 8th bit stripping
set convert-meta Off

# Keep the 8th bit for display
set output-meta On

# none, visible or audible
set bell-style none

# All of the following map the escape sequence of the value
# contained in the 1st argument to the readline specific functions
"\eOd": backward-word
"\eOc": forward-word

# for linux console
"\e[1~": beginning-of-line
"\e[4~": end-of-line
"\e[5~": beginning-of-history
"\e[6~": end-of-history
"\e[3~": delete-char
"\e[2~": quoted-insert

# for xterm
"\eOH": beginning-of-line
"\eOF": end-of-line

# for Konsole
"\e[H": beginning-of-line
"\e[F": end-of-line

# End /etc/inputrc

```

Have fun!


Raf.
