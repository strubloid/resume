# Bootstraping

# Reference
* https://docs.angularjs.org/guide/bootstrap

## How to bootstrap an application? 
We can use the **ng-app** in the root of the application, usually people add that on the html tag level
to be able to bootstrap automatically.

## Automatic Initialization
* AngularJs initializes automatically upon DOMContentLoaded event
* the script will be evaluated if at the time **document.readyState** is set to **'complete'**
* after that angular will be looking for the ngApp directive which designates your application root.

## Ng-App
If the ngApp directive is found then AngularJS will:
* load the module associated with the directive
* create the application injector
* compile the DOM treating the ngApp directive as the root of the compilation. 
  This allows you to tell it to treat only a portion of the DOM as an AngularJS application.