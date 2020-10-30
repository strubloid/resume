# Ts files or typescript files
Those are files that will be converted to normal javascript file

## Typescript
Typescript it is a super set to Javascript, it allows us to use **strong types**, **classes**, **interfaces** and other things, a fantastic thing is, typescript checks errors at the time you write it, not at the time you running it.
> Typescript compiles to Javascript

## Component variables
Getting the src/app/app.component.ts as base we cah see:
```
import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'angular10';
}
```
> Note: you can see that for this component AppComponent, we have a variable **title** with value **angular10**

In the template file:
```
<div style="text-align:center">
  <h1>
    Hello app: {{ title }}!
  </h1>
</div>
```
You will see that the value set on ``title = 'angular10';`` its being called in the template ``Hello app: {{ title }}! ``, this is called **data binding**

# @component
```
@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
```
* Selector: its the part that will be replaced in the template
* TemplateUrl: what is the file that we will be replacing the content
* StyleUrl: is what we will override as css property


# module.module.ts
This file contains the configuration that will be used by the component, in the first one app.module.ts you will be able to see what are the main imports and declarations that will be though the whole app


# First flow
* main.ts is called
* on the main.ts have a bootstrap clause that calls **AppComponent** and the AppComponent have the configuration for the template file, what's the main tag of it and the first css

# Decorators
Any @ inside of a typescript file will be such a kind of decorator, and a decorator enhance what the class can do.

## example
```
import { Component } from '@angular/core';

@Component({
  selector : 'app-server',
  templateUrl: './server.component.html'
})
export class ServerComponent {

}
```
This class **ServerComponent** now it is considered an Angular component, because:
* its importing **Component** from the @angular/core
* it contains a decorator @component, that adds a component behaviour


