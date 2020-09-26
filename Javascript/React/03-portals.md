# Portals
Concept that allow sus to render a react component that normally will be rendered.
With a portal we can mark a new place, and attach the new element to this new place

on index.html you must create a element, like:
```html
<body>
    <div id="drawer-hook"></div> <!-- Like this one -->
    <div id="root"></div>
  </body>
```
And we can call inside of a component ReactDOM.createPortal()
```jsx
import ReactDOM from 'react-dom';

const SideDrawer = props => {
    const content = <aside className="side-drawer">{props.children}</aside>
    
    return ReactDOM.createPortal(content, document.getElementById('drawer-hook'))
};
```
> As you can notice, we are calling the create portal function that the first parameter is the content that we need to add, and the second place it is the reference of where should we add this content.




