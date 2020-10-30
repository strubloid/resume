# Basic structure
In an Angular app we have 4 key players

## Components
Encapsulate the template, data and behaviour of the view.
* We can call view component
* we have always a root component and lots of other components inside of it
* they are completely decoupled from the DOM. We bind the DOM to the component
```
export class RatingComponent{
  averageRating : number;

  setRating(value){
    ...
  }
}
```

## Services
Sometimes our components needs to talk back and forward with API's (that can be any backend language), for that
we will need to implement a middleware, in our case it's called a Service.
Services are plain class that encapsulates non used user interface logic, HTTP calls, Login, Business rules

## Routers
This is the responsible for the navigation, what component to present after load the page


## Directives
We use directives to work with the DOM, we use them to add behaviour to existent DOM elements.
```
  <input type="text" autoGrow />
```
> autoGrow: it is the directive

# Tip for mac users
If you are using mac, that's ok, we need to remove the sudo option to install packages globally,
so for that we need to create a global npm folder under your user main root folder, so you won't
face any issue with npm.
> I got this information on : https://docs.npmjs.com/resolving-eacces-permissions-errors-when-installing-packages-globally

## configuration
You can follow the previous url link and do all the steps, or you can read my explanation about it:

### Create npm global folder
```
  mkdir ~/.npm-global
```
This command will allow you on a terminal environment to create npm-global under your user home folder (~)

## Configure npm to use the new directory path:
By the way, if you are a curious person and want to know what was there before change to the ~/.npm-global, you must do:
```
  npm config get prefix
```

To Set a new configuration folder you must do the following:
```
  npm config set prefix '~/.npm-global'
```
If you have node installed on your computer, this command config it's to access the node configuration,
set it is the command to override one of those configs, and when we set a prefix, that means we will
be using a new prefix (a new source folder), in our case npm-global (that we created before)

## Adding the path to our ~/.profile or any ~/.bash_aliases file
In your preferred text editor, open or create a ~/.profile file and add this line:
```
 export PATH=~/.npm-global/bin:$PATH
```
If you already have the ~/.profile you must add this content to the bottom of the file

## update the current terminal with this configuration
On linux and mac the file that is loaded anytime its is called .profile under your home folder
you must add variables over there and you can find this file on ~/.profile.
Now we have a new variable on the .profile file, we need to update your system variables:
```
 source ~/.profile
```
Now you are ready to run any npm command without the need of use the sudo

# How to start a new project?

## Installing typescript
```
  ## For linux users
  npm install -g typescript
```

## Install angular project
```
  npm install -g @angular/cli@latest

  ng new [project_name]
  ng serve
```

### Accesing
By default, we will have available on: http://localhost:4200/


