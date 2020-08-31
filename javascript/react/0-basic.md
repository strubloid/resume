# React Basic

## Components
* We use components to tell React what we want to see on the screen
* When our data changes, React will efficiently update and re-render our components


## How react creates an element
```javascript
return React.createElement('div', {className: 'shopping-list'},
  React.createElement('h1', /* ... h1 children ... */),
  React.createElement('ul', /* ... ul children ... */)
);
```
* We ask React to create an element, where params are:
  * what is the type of element
  * props = properties that this element will have

Note:  ins this case we are returning 3 elements a div, a h1 and ul element


### How to create a component in react?
```jsx
import React, {Component} from 'react';

class Counter extends Component {
    render() {
        return (
            <div>
                <h1>Hello World</h1>
            </div>
        );
    }
}

export default Counter;
```
* Basically you will need to **import react**, **extend as a component** and **have a render function**
* Render Function:
  * will return a jsx expression
  * only can render one element at the end, so as conventional we **add a div as main element**
#### Result
```html
<div id="root">
    <div>
        <h1>Hello World</h1>
    </div>
</div>
```
> In this case you will be getting a **div** and **h1** in the root

    
### How to hide this first div to be printed?
```jsx
import React, {Component} from 'react';

class Counter extends Component {


    render() {
        return (
            <React.Fragment>
                <h1>Hello World</h1>
            </React.Fragment>
        );
    }
}

export default Counter
```
#### Result
```html
<div id="root">
    <h1>Hello World</h1>
</div>
```
> In this case you will be getting only a **h1** in the root

## State
* Needs to be an object
* It's an object that has data that the component needs
* To access the value of the state, that is a Component variable, you must use **this**
```jsx
render() {
    return (
        <div>
            <span>{this.state.count}</span>
        </div>
    );
}
```

#### Example
```jsx
import React, {Component} from 'react';

class Counter extends Component {

    state = {
        count: 0
    }
    render() {
        return (
            <div>
                <span>{this.state.count}</span>
            </div>
        );
    }
}

export default Counter;
```
> You will notice that **will be printed 0**



## Attributes
* You will notice that the src of the image **isn't src=""** but **its src={} (object)**
```jsx
import React, {Component} from 'react';

class Counter extends Component {

    state = {
        immageUrl : 'https://picsum.photos/200'
    }
    render() {
        return (
            <div>
                <img src={this.state.immageUrl} alt="Image"/>
            </div>
        );
    }
}

export default Counter;
```
> This example will show an image in the dom


### Adding a class for an element
* The property that you will be using its **className** as class it's a reserved name

```jsx
import React, {Component} from 'react';

class Counter extends Component {

    state = {
        immageUrl : 'https://picsum.photos/200'
    }
    render() {
        return (
            <div>
                <button className="btn btn-secondary btn-sm">Button</button>
            </div>
        );
    }
}

export default Counter;
```
> In this example we have applied bootstrap classes for a button


#### Adding on Styles tag
```jsx
import React, {Component} from 'react';

class Counter extends Component {

    state = {
        count: 0,
    }
    spanStyle = {
        fontSize : '20px'
    }

    buttonStyle = {
        fontSize : 20
    }

    render() {


        return (
            <div>
                <span style={ this.spanStyle } className="badge badge-primary m-2" >{ this.formatCount() }</span>
                <button style={ this.buttonStyle } className="btn btn-secondary btn-sm">Increment</button>
            </div>
        );
    }

    formatCount () {
        const { count } = this.state;
        return count === 0 ? 'Zero' : count;
    }
}

export default Counter;
```
* All css properties will be changed from - to the next a Capital letter like:
  * font-size: fontSize 
  * font-weight: fontWeight
* You must use the attribution as an object, changing from **style="the style"** to **style={ Object }**
* All properties that **expect** to be **in pixels**, like font-size, **we can pass the '20px' or 20**,
that **react will replace to become '20px'**

### Render Classes Dynamically
> For this example we need to have a boostrap knowledge, we want to change from
> badge-warning to badge-primary, as warning its yellow and primary is blue
```jsx
import React, {Component} from 'react';

class Counter extends Component {

    state = {
        count: 0,
    }

    render() {
        let classes = this.getClasses();

        return (
            <div>
                <span className={classes}>
                    {this.formatCount()}
                </span>
            </div>
        );
    }

    getClasses() {
        let classes = "badge m-2 ";
        classes += (this.state.count === 0) ? 'badge-warning' : 'badge-primary';
        return classes;
    }

    formatCount() {
        const {count} = this.state;
        return count === 0 ? 'Zero' : count;
    }
}

export default Counter;
```
* On the render function we can call a class function to build dynamically
* The method getClasses() can try to get this data from any service API and at the needs to return what are the classes for
this element

> Note: you also could be passing the function instead of creating a variable for it, like:
```jsx
<span className={this.getClasses()}>
    Any content here
</span>
```

### Render a list of items
```jsx
import React, {Component} from 'react';

class Counter extends Component {

    state = {
        tags: ['tag1', 'tag2', 'tag3'],
    }

    render() {
        return (
            <div>
                <ul>
                    { this.state.tags.map(tag => <li>{ tag }</li>) }
                </ul>
            </div>
        );
    }
}

export default Counter;
```
* We can use the function **map** for the job
* Map function request an arrow function: **`tag => <li>{ tag }</li>`**
* Arrow function
  * **tag** = will be the current instance of the array **this.state.tags**
  * `<li></li>` = it is the jsx object
  * `<li>{ tag }</li>` = **we use {}** to **get** the **value** from **tag** and this will print out the jsx object
* Basically the map function accept an arrow function with the tag object and what should it be the jsx object to be rendered

#### Always set the Key value when you are using maps!
If you dont use it, you will be getting something like:
```
index.js:1 Warning: Each child in a list should have a unique "key" prop.
```

#### Example
```jsx
import React, {Component} from 'react';

class Counter extends Component {

    state = {
        tags: ['tag1', 'tag2', 'tag3'],
    }

    render() {
        return (
            <div>
                <ul>
                    { this.state.tags.map(tag => <li key={tag} >{ tag }</li>) }
                </ul>
            </div>
        );
    }
}

export default Counter;
```
> Note: in this example we are using the **tag value as unique**, but in real life this **will be an object** and this object
will have **object.id** that will be responsible for really identify this object.

### Adding conditionals to a layout, how should we do?
* React dont allow you to create an if/else statement, so the strategy is:
  * Create a function
  * Do the conditional statement inside of the function
  * Call the function inside of the render jsx element
```jsx
import React, {Component} from 'react';

class Counter extends Component {

    state = {
        tags: ['tag1', 'tag2', 'tag3'],
    }
    
    renderTags() {
        const { tags } = this.state;

        if (tags.length === 0) return <p>There are no tags</p>

        return<ul>{tags.map(tag => <li>{tag}</li>)}</ul>
    }

    render() {
        return (
            <div>
                { this.renderTags() }
            </div>
        );
    }
}

export default Counter;

```

#### React accept one conditional on the jsx object
* We will ne using the && to return a text if the first argument its true
```jsx
import React, {Component} from 'react';

class Counter extends Component {

    state = {
        tags: [],
    }
    
    renderTags() {
        const { tags } = this.state;

        if (tags.length === 0) return <p>There are no tags</p>

        return<ul>{tags.map(tag => <li>{tag}</li>)}</ul>
    }

    render() {
        return (
            <div>
                { this.state.count === 0 && 'You must create a new tag'}
                { this.renderTags() }
            </div>
        );
    }
}

export default Counter;
```
* The sentence **this.state.count === 0** is **true**
* The text **'You must create a new tag'** as it is a string that isn't empty, so the value for that is true
* Both are true, so both will be executed!
* The first check's, **if it is true will be printed**, otherwise the first element will be false, so the second instruction wont be invoked

## OnClick
I will use this section to show the important of using the arrow function, I will also show the difference between using
a function as well as using an arrow function

### using normal function
This is a basic function that will be showing that button increment was clicked,
this is using a normal function, so to be able to get the value of **this**, it is
necessary to bind the this on the function, using the constructor as place to do it
```
import React, { Component } from "react";

class Counter extends Component {
  handleIncrement() {
    console.log("Increment Clicked", this);
  }
  constructor() {
    super();
    this.handleIncrement = this.handleIncrement.bind(this);
  }
  
  render() {
    return (
      <div>
        <button onClick={this.handleIncrement}>Increment</button>
      </div>
    );
  }
}

export default Counter;
```
> Note you will see the object in this sample, but if you comment the binding line you will see that
> this is undefined

### Using Arrow function
```jsx
import React, { Component } from "react";

class Counter extends Component {

  handleIncrement = () => {
    console.log("Increment Clicked", this);
  };

  render() {
    return (
      <div>
        <button onClick={this.handleIncrement}>Increment</button>
      </div>
    );
  }
}

export default Counter;
```
> You can notice that the the reference of **this** is correct without any need of bind, so
> use Arrow Function!

## How to update the view? this.setState method!
* First you must change the value on the variable that you have on state object
* If you only do that, react wont know what was changed, even though we changed something (In angular this will be enough)
* So to be able to change in react it is necessary to **setState** and update the object state to make react know about it
```jsx
import React, { Component } from "react";

class Counter extends Component {
  state = {
    count: 0,
  };

  handleIncrement = () => {
    // This increment the variable count
    this.state.count++;

    // This will let react know that the variable was changed
    this.setState({
      count: this.state.count,
    });
  };

  render() {
    return (
      <div>
        <span className={this.getClasses()}>{this.formatCount()}</span>
        <button
          onClick={this.handleIncrement}
          className="btn btn-secondary btn-sm"
        >
          Increment
        </button>
      </div>
    );
  }

  getClasses() {
    let classes = "badge m-2 ";
    classes += this.state.count === 0 ? "badge-warning" : "badge-primary";
    return classes;
  }

  formatCount() {
    const { count } = this.state;
    return count === 0 ? "Zero" : count;
  }
}

export default Counter;
```
> note: In our example we have a specific status changed, but you also could be sending the whole state object, like:
```jsx
handleIncrement = () => {
    this.state.count++;
    this.setState(this.state);
};
```

### Passing arguments in the render()
* We will need to pass an **Arrow function** to be able to pass arguments
* You will notice that **we are passing an object** inside of the **this.handleIncrement function**
```jsx
import React, { Component } from "react";

class Counter extends Component {

  handleIncrement = (product) => {
    console.log(product)
    this.state.count++;
    this.setState(this.state);
  };
    
  render() {
    return (
      <div>
        <button onClick={ () => { this.handleIncrement({ id: 'product-id'})}} 
        className="btn btn-secondary btn-sm" >Increment</button>
      </div>
    );
  }
}

export default Counter;
```
* You also can pass an return of a function like:
```jsx
    getProductId = () => {
        return { id: "product-id" };
    };
    
    <button className="btn btn-secondary btn-sm"
        onClick={() => {
            this.handleIncrement(this.getProductId());
        }}
    >Increment</button>
```
* Or a variable reference
```jsx
class Counter extends Component {
  state = {
    count: 0,
    product: {
      id: "product-id"
    },
  };

    <button className="btn btn-secondary btn-sm"
        onClick={() => {
            this.handleIncrement(this.state.product);
        }}
    >Increment</button>
```
