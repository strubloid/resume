# Elements

## spam
* are used to create inline elements
* you can use btn-block to make span fill entire row

# Selectors
```
universal selector = * // this will run for every element
```

# media queries
```
//mobile
@media screen and (max-width: @screen-xs-max) {
  background-color: red;
}

// tablet
@media screen and (min-width: @screen-tablet) and (max-width: @screen-sm-max) and (min-height: @screen-sm-max) and (max-height: @screen-tablet){
  background-color: green;
}

```

> Note: this is the tablet short version of it
```
@media screen and (min-width: @screen-tablet) 
              and (max-width: @screen-sm-max) 
              and (min-height: @screen-tablet) 
              and (max-height: @screen-sm-max) {
                  background-color: green;
}
```

>Note: this is the current pattern in our projects
```
//mobile
@media screen and (max-width: @screen-xs-max) {
  [...]
}
// tablet
@media screen and (min-height: @screen-tablet) and (max-height: @screen-sm-max) and (orientation : landscape),
       screen and (min-width: @screen-tablet) and (max-width: @screen-sm-max) and (orientation : portrait){
       	[...]
  
}
```