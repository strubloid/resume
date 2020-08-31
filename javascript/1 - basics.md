
# how to load js only for mobile

```

// only for mobile
if(($j(window).width() < 768 && $j(window).height() < 1024 ) || ($j(window).width() < 1024 && $j(window).height() < 768 ))
{

    alert('mobile');

}
```

# how to get the window sizes in console tab
```
console.log('Your screen resolution is ' + screen.width + 'x' + screen.height);
```


## Object Destructuring
```jsx
formatCount () {
    const { count } = this.state;
    return count === 0 ? 'Zero' : count;
}
```
* you are getting the **this.state** as **subject**
* you will be getting on **count** the **this.state.count**
* you can use **count** as we use **this.state.count**
