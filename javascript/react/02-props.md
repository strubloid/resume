# Props

## How to get any element and print inside of a child?
```jsx
import React from 'react';

import './MainHeader.css';

const MainHeader = props => {
  return <header className="main-header">{props.children}</header>;
};

export default MainHeader;
```
> this is a good example of header that will load all children inside of it.

