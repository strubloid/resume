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

## how to remove return from lines
This is our sample case, how should we remove this return?
```jsx
this.setState(state => { return {
    courseGoals : [...state.courseGoals, newGoal]
}});
```
> you can see that we have a **return**, so to be able to remove it, we must add all the returnable values from return {...} and we wrap with parenthesis, like below:

### from
```jsx
    { 
        return {
            [anything that you will return]
        }
    }
```
### to
```jsx
    (
        {
            [anything that you will return]
        }
    )
```
> note: the parenthesis kind of return that value, making this a solution to remove the return word in this case.

So you ca have a result like this in a compact form
```
this.setState(state => ({courseGoals : [...state.courseGoals, newGoal]}));
```

## If you want to filter something, how should I do?
For that you must be aware that we have 2 main functions,
map will be to iterate an array of data, and filter as function to confirm that the data that will be shown in the map function it is only the correct data to show.
```jsx
  const userId = useParams().userId;
  const filteredPlaces = places.filter( place => place.creator === userId);
  
  return (
    <PlaceList items={filteredPlaces} />
  );
```
This part of the code we have the list of places filtering what should be shown, and a component PLaceList, that will be responsible for rendering, so will render everything that we passed by this class

```jsx
import React from 'react';

import PLaceItem from './PlaceItem'

import './PlaceList.css'

const PlaceList = (props) => {
    return <ul className="place-list">
        {props.items.map(place =>
            <PLaceItem key={place.id} id={place.id} image={place.imageUrl}
                       title={place.title} description={place.description}
                       address={place.address} creatorId={place.creator}
                       coordinates={place.location}
        />)}
    </ul>

};

export default PlaceList;
```
As you can notice, we have the **props.item** from ```<PlaceList items={filteredPlaces} />```, and we are iterating on ```{props.items.map(place => ... )}```


