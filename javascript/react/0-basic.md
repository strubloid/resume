# React Basic

## Components
* We use components to tell React what we want to see on the screen
* When our data changes, React will efficiently update and re-render our components


## Creating an element with react
```javascript
return React.createElement('div', {className: 'shopping-list'},
  React.createElement('h1', /* ... h1 children ... */),
  React.createElement('ul', /* ... ul children ... */)
);
```
* We ask React to create an element, where params are:
  * what is the type of element
  * props = properties that this element will have
> Note:  ins htis case we are returning 3 elements a div, a h1 and a ul element
>
>  