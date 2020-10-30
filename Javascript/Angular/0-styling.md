# Styling

## Options
* You can use bootstrap classes to create the basic structure
* you can use **stylesUrl**, that accepts multiple files as it is an array of files,
* you can use **styles**, that accept an array of strings


## Both declarations
```
import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
  styles : [`
    h3 {
      color : dodgerBlue
    }
  `],

})
export class AppComponent {

}
```
In this case we have both, angular will load both, but the sequence will be first the styleUrls and after the styles
So in our case we have h3 style in the css will be taken over by out styles h3, so in this case the result of the h3 tag will be **dodgerBlue**

## StyleUlrs
```
import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
})
export class AppComponent {

}
```
This will load: src/app/app.component.css
```
h3 {
  color: darkblue;
}
```
Result will be darkblue;

## Style
```
import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styles : [`
    h3 {
      color : dodgerBlue
    }`
    , 'h3 { color: pink; }'
    , 'h3 { color: yellow; }'
  ],

})
export class AppComponent {

}
```
The **styles** will be one of multiple strings in the array, the order it is similar to css rules, who is blow will be the last being called, and in our example the h3:
* got dodgerBlue
* got pink
* got yellow
The **result** of the h3 style will be the color **yellow**


## Selectors by attribute
* component file: src/app/servers/servers.component.ts
```
import { Component, OnInit } from '@angular/core';

@Component({
  selector: '[app-servers]',
  templateUrl: './servers.component.html',
  styleUrls: ['./servers.component.css']
})
export class ServersComponent implements OnInit {

  constructor() { }

  ngOnInit(): void {
  }

}
```
* template file: src/app/app.component.html
```
<div class="container">
  <div class="row">
    <div class="col-xs-12">
       <div app-servers ></div>
    </div>
  </div>
</div>
```
>note: now you must use as custom attribute

## Selectors by class
* component file: src/app/servers/servers.component.ts
```
import { Component, OnInit } from '@angular/core';

@Component({
  selector: '.app-servers',
  templateUrl: './servers.component.html',
  styleUrls: ['./servers.component.css']
})
export class ServersComponent implements OnInit {

  constructor() { }

  ngOnInit(): void {
  }

}
```
* template file: src/app/app.component.html
```
<div class="container">
  <div class="row">
    <div class="col-xs-12">
       <div class="app-servers"></div>
    </div>
  </div>
</div>
```
>note: now you must use as custom attribute
