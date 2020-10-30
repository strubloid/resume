# Html files or template files
Those files are the html content rendered by the Angular component, so you will be allowed to add variables, conditionals, and loop in this angular structure.

## Variables
```
<div style="text-align:center">
  <h1>
    Hi this is a new app:  {{ title }}!
  </h1>
</div>
```
In this example we can see that we are using a variable called title, and the way to invoke this variable its using:
```
 {{ [variable-name] }}
```

# Main template file
The main template file it is localized at the **src folder**/index.html

# Directives
* ng-model
```
<input type="text" [(ngModel)]="name">
<p>{{name}}</p>
```
> Basically in this case, ngModel binds the **value** of the **input** into variable **name**

## component.module
This tells angular which pieces belong to our app, in the previous case angular could not know about the ngModel, so we need to configure the typescript so can accept form items

### configuration

#### Importing the FormsModule
```
import { FormsModule } from '@angular/forms';
```
> Note: this is a typescript feature

#### Adding to the imports
```
imports: [
    BrowserModule,
    FormsModule
],
```

#### Final Result
```
import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';

import { AppComponent } from './app.component';

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule,
    FormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
```
