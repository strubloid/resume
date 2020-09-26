# Props

- Every react component has a variable called **props**
- Its a plain javascript object that contains all attributes that we set
  on the declaration of the component, like:

## Prop Example

- We have 2 Containers
- Counters and Counter
- Counters has a Counter object inside

```jsx
import React, { Component } from "react";
import Counter from "./Counter";

class Counters extends Component {
  render() {
    return (
      <div>
        <Counter key={counter.id} value={counter.value} selected="true" />
      </div>
    );
  }
}

export default Counters;
```
The Counters component has a Counter with 3 attributes:
* **Key**: It's a special attribute to identify elements, **this wont
  be passing as props** as it is special from the language
* **Value** and **Selected** are values that are considered **Counter Prop**

So we have as Counter Props
```jsx
<Counter key={counter.id} value={counter.value} selected="true" />
```
* value
* selected


### How to get this value being set correctly on Counter Object?
```jsx
import React, { Component } from "react";

class Counter extends Component {
  state = {
    value: this.props.value,
  };
  render() {
    return (
        <div>{this.props.value}</div>
    );
  }
}

export default Counter;
```
> As you can see we have set on the state as well as returning the value
> with this we can access the value from the **Parent Counters Object**

### How to get a declared child on the Counters object?
* In this case we have a **Counter object** passing an **h4**
```jsx
import React, { Component } from "react";
import Counter from "../Counter/Counter";

class Counters extends Component {
  render() {
    return (
      <div>
        <Counter key={counter.id} value={counter.value} >
          <h4>Counter: {counter.id} </h4>
        </Counter>
      </div>
    );
  }
}

export default Counters;
```
* On Counter Object you will be able to get data:
  `{this.props.children}`
```jsx
import React, { Component } from "react";

class Counter extends Component {
  state = {
    value: this.props.value,
  };
  render() {
    return (
      <div>
        {this.props.children}
        <span className={this.getClasses()}>{this.formatCount()}</span>
        <button onClick={() => { this.handleIncrement({ id: "product-id" }); }}
          className="btn btn-secondary btn-sm">Increment
        </button>
      </div>
    );
  }
}

export default Counter;
```
**{this.props.children}**: will load the elements passed on
**`<Counter>`**:
```jsx
<Counter key={counter.id} value={counter.value} >
  <h4>Counter: {counter.id} </h4>
</Counter>
```

## Obs
* You shouldn't set a value on the props, as **it is ready only property**

