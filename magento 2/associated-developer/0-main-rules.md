# main-rules

## Event Listeners
* You shouldn't never be dependent of the order of a module load sequence (father and all extensions)
* if you modify layout of another module and your module is initialized first, the other module will overwrite your changes

## Build modules
* When you build a module that are dependent on other modules, whenever possible,
use interfaces as defined by the service contracts, in that way your module works
with a blueprint an doesn't not matter what class or module fulfills that blueprint

