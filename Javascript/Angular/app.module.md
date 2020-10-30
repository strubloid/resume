# How to add a new component?
Let's use this file below as example:
```
import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { AppComponent } from './app.component';
import {FormsModule} from '@angular/forms';

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule,
    FormsModule
  ],
  providers: [
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
```
## First step
Change the declarations to contain the **new component** you want o load
```
@NgModule({
  declarations: [
    AppComponent,
    ServerComponent
  ],
...
});
```
> note: this was added a new component called **ServerComponent**

## Second step
You must import this component:
```
    import { ServerComponent } from './server/server.component';
```
> Now it will be set in the app.module.ts and when is necessary it will be available to use.





