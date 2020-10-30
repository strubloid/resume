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

