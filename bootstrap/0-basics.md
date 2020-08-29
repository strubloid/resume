# Basic commands in Bootstrap 4


# Bootstrap grid
* main div = .container
* now you can create .rows 
* now you can add .colums
```html 
<dic class="container">
    <div class="row">
        <div class="col">
            Content of the column
        </div>
    </div>
</dic>
```

> **col** class will be dividing 50/50, when gets smaller can be transformed inline

## value of the number on the col
* Col-1 to col-12
> Each number represents the amount of the space from 12 spaces available
```html
<dic class="container">
    <div class="row">
        <div class="col-6">
            4 for each
        </div>
        <div class="col-6">
            4 for each
        </div>
        <div class="col-6">
            4 for each
        </div>
    </div>
</dic>
```

## size nomenclature
* **md**:  medium size
* **lg**:  large screens like monitors
* **xl**: huge size screens
* **sm**: small tablet
* **xs**: extra small mobile phone

## Positioning of a row
* justify-content-center
> This will change to become everything from the center, spaces will be on the sides

* row = justify-content-start
> this will move everything to the left

* row = justify-content-end
> this will move everything to the right

* row = justify-content-around 
> this will try to center
> spaces will be added to each block on the left and right side
> this might add extra sizing on the middle, as it takes 2 spaces between 2 tags

* row = justify-content-between 
> this will push the left who is on the left side
> this will push to the right who is on the right side
> space can be showing up in the center as the elements will be on the corner
> all the avaiable space will be put between the columns
>


## vertical align

