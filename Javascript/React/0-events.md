# Events

## How to raise an event to a Parent Object?

* Counter Object will raize an event **onDelete** to Counters Object
* Counters component will **handle this event** on function
  **handleOnDelete**

## Flow

| Object   | Scope  | Action                                                 |
|:---------|:-------|:-------------------------------------------------------|
| Counter  | Child  | Raise an event                                         |
| Counter  | Child  | Name convention: **on + action** that you are doing |
| Counter  | Child  | Set the name of the event to **onDelete**              |
| Counters | Parent | Will know that a Counter has the **event onDelete**        |
| Counters | Parent | Will handle the event, creating a handle function      |
| Counters | Parent | Name convention is add **handle** before the name of the counter event |
| Counters | Parent | Will have a method called **handleOnDelete**           |
* **Child**: onDelete, onSave
* **Parent**: handleOnDelete, handleOnSave

### How to update a state?

#### Counters (Parent)
* Getting a copy from the current array of counters
* Filtering by the argument **counterId**
* Update on the state (as the parent has all children, should be responsible for this action)
```jsx
handleDelete = (counterId) => {
  const counters = this.state.counters.filter( c => c.id !== counterId);
  this.setState({counters});
}
```

#### Counter (Child)
* Its responsible to raise an event
* The name of the event is called **onDelete**
* It is passing as reference the id of the child by using **this.props.id**
* It is triggered by the click of this button
```jsx
    <button onClick={() => this.props.onDelete(this.props.id)} >
      Delete
    </button>
```

### Good practice on sending references to Parent classes
* It is good to pass the whole object reference, as if we have new variables of this object, it will be also passed

| Object   | From/To | Code                                                                                                   |
|:---------|:--------|:-------------------------------------------------------------------------------------------------------|
| Counters | From    | ```<Counter key={counter.id} onDelete={this.handleDelete} value={counter.value} id={counter.id}  />``` |
| Counter  | To      | ```<Counter key={counter.id} onDelete={this.handleDelete} counter={counter} /> ```                     |

## Single source of truth
* We have state for each component
* Counter will have  a state as well as Counter

### Example of Reset Button
* We can't update the state of the parent and expect that the child will update, as each had it's own
* Data that is showing on the screen is the State of the current object

#### We can't do this and expect that will work
```jsx
// Parent Counters.jsx
handleReset = () => {
    const counters = this.state.counters.map(c => {
      c.value = 0;
      return c;
    });

    this.setState({counters});
}

// Child Counter.jsx
class Counter extends Component {
  state = {
    value: this.props.counter.value,
  };
}
```
> Note: Tis will update the state of the father only

##  Controlled component
* Doesn't have its own local sate
* receives the data by props
* raises events when data needs to change

#### On Counters.jsx (Parent)
* You need to add the call for the **OnDelete**
* we will be handling in the function **handleDelete**

#### On Counter.jsx (Child)
```jsx
import React, { Component } from "react";

class Counter extends Component {

  render() {
    return (
      <div>
        <button className="btn btn-secondary btn-sm"
                onClick={() => this.props.onIncrement(this.props.counter)}
        >Increment
        </button>
      </div>
    );
  }
}

export default Counter;

```