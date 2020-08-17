#!/bin/bash

## First steps on ubuntu update of the distro after install
sudo apt-get update && sudo apt-get dist-upgrade
sudo apt install -y ubuntu-restricted-extras gnome-tweaks rar unrar p7zip-full p7zip-rar

# Chrome tools
sudo apt install -y chrome-gnome-shell

## Utility package
sudo apt install -y htop terminator vim curl

## A few basic packages that are minimum for a dev
sudo apt install -y  git ssh 

## packages for javascript developer
sudo apt install -y npm nodejs mongodb

## configuring NPM
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
npm config set prefix ~/.npm-global
sudo apt-get install libcap2-bin

## Allowing the nodejs run on port 80 on localhost
[ -d "/usr/bin/node" ] sudo setcap cap_net_bind_service=+ep '/usr/bin/node'
[ -d "/usr/local/bin/node" ] sudo setcap cap_net_bind_service=+ep '/usr/local/bin/node'


## gnome 3 settings
sudo apt-get install gnome-shell-pomodoro

## Windows apps
wget -q "http://deb.playonlinux.com/public.gpg" -O- | sudo apt-key add -
sudo wget http://deb.playonlinux.com/playonlinux_cosmic.list -O /etc/apt/sources.list.d/playonlinux.list
sudo apt-get update
sudo apt install -y playonlinux
sudo apt install -y wine64 winbind winetricks

sudo dpkg --add-architecture i386
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key
sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main'

sudo apt update
sudo apt install -y --install-recommends winehq-stable

## This will install lutris, this will be make games like starcraft work!
sudo add-apt-repository ppa:lutris-team/lutris
sudo apt update
sudo apt install -y lutris

## Installation of steam
sudo apt install -y steam

## Net tools that you will be using
sudo apt install net-tools
