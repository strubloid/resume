#SOLID principles

## Single responsibility
```
A class should have one, and only one, reason to change
```

> In plain terms, a good class only will have methods for itself, if one of the functions call things outside of the class scope this will break this principle.
### Why should we follow this principle?
1. makes a class easier to maintain
2. make the class reusable
3. this will be easier class to test

## Open / Close
```
Entities should be open for extension, but close for modification
``` 
> This will be solved using an interface to make sure that all the instructions will be implemented on each class that implements this interface
### Why should we follow this principle?
1. we should be able to change the behaviour
2. change behaviour without modifying the source code
3. this will make it easier to mantain
4. will prevent the "Code Rot" - preventing the code from become slower and unusuable


## Liskov Substitition
```
Derived classes must be substitutable for their base class
```
1. we have a parent an a child class
2. we have the class named "world" which calls the child
3. Class "world" should be able to swap the child class for the parent class without having the code modified 
### Why should we follow this principle?
1. To make easier to mantain
2. To prevent "Code Rot" - prevent the code from becoming slower and unusable
3. Make code reusable and flexible
> The flow of the code can't change, a class that is doing the task can extends from another class that instead of breaking the code can fix it and do the correct steps to solve the issue without changing anything in the code flow, just changing the class that extrends from it.

## Interface Segregations
```
A client should not be forced to implement an interface that it does not use. 
```
### Why should we follow this principle?
1. Prevent methods from being dependent on unnecessary classes
2. Prevent classes from having unnecesssary methods
> dont be afraid of break uo your interface removing some methods that isnt useable for all implemented classes from it
> you always can have multiple interfaces into classes, when i said break, should move functions that isnt common and you should put into another interface and say that only the classes that should implement this behaviour will extend from this new interface as well the old one

## Dependecy Inversion
```
High level modules, should not depend on low level modules
```
### What does the principle mean?
1. Dont confuse this with dependency injection
2. High level code is not concerned with the details
3. Low level code is concerned with the details
4. Both should depend on abstractions
```
You must implement an interface to ensure that the high level code wont change, as we have the dependencies being triggered on the low level code by implement an interface.
```
