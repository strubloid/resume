## Data binding
Communication between a typescript(Business Logic) and the template (HTML)

## How to output typescript data into a template?
* String Interpolation
* Property Binding

### String Interpolation
It is when we have ``{{ data }}``

#### In the component will access the property of the component
```
export class ServerComponent {
  data = 10;
}

```

### Property Binding
It is when we have ``[property]="data"``, with this approach we set html property binding to a data

#### Server.component.html
```
<button class="btn btn-primary" [disabled]="allowNewServer">Add Server</button>
```
* this button has the property **disabled** attached to a conditional **allowNewServer**
* allowNewServer can also be a function like: ``[disabled]="isComponentDisabled()"``
* the main point is ``[what is inside here]="will call this function or attribute"``
* ``[innerText]="function or attribute"``: will show the content inside of the element


## How to get the result from a template ?
We use Event Binding: ``(event)="expression"``

# Events
On the Component you will create a fucntion to bind a click, as a good example, in this case was created the function onCreateServer().
```
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-servers',
  templateUrl: './servers.component.html',
  styleUrls: ['./servers.component.css']
})
export class ServersComponent implements OnInit {

  serverCreationStatus = 'No server was created!';
  
  constructor() { }
  ngOnInit(): void { }

  onCreateServer = () => {
    this.serverCreationStatus = 'Server was created';
  }

}
```

In the template file you must bind this onCreateServer to a **click** event of the **button element**
```
<button
  class="btn btn-primary"
  (click)="onCreateServer()"
>Add Server</button>
```
> Note: (event)="function or attribute of the component"

## Input event

###  On the template file
```
<input
  type="text"
  class="form-control"
  (input)="onUpdateServerName($event)"
/>
<p>{{ serverName }}</p>
```
* ```(input)```="functionName($event)"
* **$event** it's a special key to pass the object, so it will be possible to get the value in the component level.

### ON the Component File
```
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-servers',
  templateUrl: './servers.component.html',
  styleUrls: ['./servers.component.css']
})
export class ServersComponent implements OnInit {

  serverName = '';

  constructor() { }
  ngOnInit(): void { }

  onCreateServer = () => {
    this.serverCreationStatus = 'Server was created';
  }

  onUpdateServerName = (event: Event) => {
    this.serverName = (<HTMLInputElement>event.target).value;
    console.log(this.serverName);
  }

}

```
*  You will be adding the **event: Event** in the function that you want to get the value from the input.
* The way to load the value is: ```(<HTMLInputElement>event.target).value;```


# 2 way data binding
It's the combination pf both: ``[(ngModel)]="data"``

## Minimum requirement
* For Two-Way-Binding to work, you need to enable the ngModel directive. This is done by adding the FormsModule to the imports[] array in the AppModule
```
  imports: [
    ...,
    FormsModule  <--- you must add inside of the imports
  ],
```
* You then also need to add the import from @angular/forms in the app.module.ts file:
```
import { FormsModule } from '@angular/forms';
```

### ON the template file
```
<input
  type="text"
  class="form-control"
  [(ngModel)]="serverName"
/>
```
* NgModel will be bound to the serverName property


