# Vagrant Good Stuff (VGS)


# Commands

## vagrant version
This will show the version of the current installed vagrant

## vagrant init [repository name]
This will start a new repository or download from that reference.
```
    vagrant init puppetlabs/ubuntu-14.04-32-nocm
```
> Note: in this case you will be able to download from the repository puppetlabs the image ubuntu-14.04-32-nocm

## vagrant up
This we basically use for starting a server, it is necessary to have a **Vagrantfile** to be able to trigger this action

### Flow
* Vagrant will try to see if exist in your machine the **puppetlabs/ubuntu-14.04-32-nocm**
* if can find it will be downloaded
* else will start a new box


## vagrant ssh
This is necessary to use the functionality of **ssh**, with that terminal you will be able to
access the content from the whole image while login into it.

### Defaults
* username: vagrant
* password: vagrant

### vagrant configuration to get a GUI terminal
```ruby
config.vm.provider "virtualbox" do |v|
    v.gui = true
end
```
> Note: if your vagrant is stuck in a bad situation, you always can start the gui and 
> see by yourself how to fix it













# Actions

## exit or control+d
These are the commands that will make you leave the machine.

## vagrant halt
This will stop the current machine, this will also keep
the environment available for later use.

## vagrant destroy
This will close the actual machine, and it will also
delete the current linux distribution and all elements
that you changed inside the machine.
So if you need to destroy, make sure that before you create
another 