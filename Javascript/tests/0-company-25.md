Filter Input
  - data-testid: filter-input
  - initial value: "", i.e. empty string


Each employee must be rendered as an element with data-testid = 'employee' and have its text content equal to the employee name.


## mandatory
* When the Filter Input has an empty string as its value, then all employees must be rendered in the order they are given.
* Otherwise, let query be the value of the Filter Input, transformed to lowercase.
* only employees whose lowercased names contain query as their substring must be rendered preserving the order in which they are given in the array of all employees
* 
