## we cant create var and let with same name
```
var animal;
let animal;
```
> this will generate an error

## when se should be using let?
```
var animal = 'cat';
console.log(animal);

{
    let animal = 'dog';
    console.log(animal);
}

console.log(animal);
```
> as you can see let it is good to create a same variable name inside of an object/function scope
