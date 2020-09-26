# how to avoid double click with jquery

# Dynamically disable any <class-name>

```javascript
var $j = jQuery.noConflict();

var AddToCartRule = {

    config: {
        class: '.btn-cart',
        time: 2000
    },

    init: function() {
        this.addToCartFormRule();
    },

    addToCartFormRule: function() {

        $j(document).on('click', AddToCartRule.config.class, function(event){

            $j(this).prop('disabled', true);

            setTimeout(function(){
                $j(AddToCartRule.config.class).prop('disabled', false);
            }, AddToCartRule.config.time);

        });
    }
};

$j(document).ready(function() {
    AddToCartRule.init();
});
```

## Explanation of this 

### no cinflict
```javascript
var $j = jQuery.noConflict();
```
> this part of the code it is only to make sure that we dont have any conflicts 

### Ready function
```javascript
$j(document).ready(function() {
    AddToCartRule.init();
});
```
> at this part we are making sure that after the document is ready we can start our code

### Object variables
```javascript
var AddToCartRule = {

    config: {
        class: '.btn-cart',
        time: 2000
    }
};
```
> config it is an variable of our object **AddToCartRule**, and you can access by AddToCartRule.config.class or AddToCartRule.config.time, a good note about this is at any place in the code
you can be calling the object variables, as you can see above:
```javascript
    setTimeout(function(){
        $j(AddToCartRule.config.class).prop('disabled', false);
    }, AddToCartRule.config.time)
```

### Init function
> Init function are a pattern to start an object, as you can notice, after the document it is ready we call our object.init function: **AddToCartRule.init();**

```javascript
var AddToCartRule = {

    init: function() {
        this.addToCartFormRule();
    },

    addToCartFormRule: function() {
        // this will doing things
    }
};

$j(document).ready(function() {
    AddToCartRule.init();
});
```
> Note: the flow starts with **AddToCartRule.init();**, enter in the object init function and call the object method **addToCartFormRule**, and that method do the logic of the double click being avoided

### AddToCartFormRule

```javascript
var AddToCartRule = {
    
    addToCartFormRule: function() {

        $j(document).on('click', AddToCartRule.config.class, function(event){

            $j(this).prop('disabled', true);

            setTimeout(function(){
                $j(AddToCartRule.config.class).prop('disabled', false);
            }, AddToCartRule.config.time);

        });
    }
};
```
> This method will be checking all the document class items (AddToCartRule.config.class), will be disabling the property disabled to true, later on the setTimeout will be triggering the disable false
after **AddToCartRule.config.time** time