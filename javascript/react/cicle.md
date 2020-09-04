# Phases

## Mount (Life Cycle Hooks)

### Constructor
It s the right place to initialize the properties of the class

###  Render
At this point we have a component, but isn't mounted yet.
> when a component is rendered, it's also your children recursively

### ComponentDidMount
This is the **last step in the Mount lifecyle**, it is the time to insert the component into the DOM.
  * It is the spot for **Ajax Calls**
  * That is the place for any kind of iteration to get some data

## Update
When the State or Props gets changes
* Render
* ComponentDidUpdate

## Unmount
When a component is removed from the DOM
* ComponentWillUnmount

