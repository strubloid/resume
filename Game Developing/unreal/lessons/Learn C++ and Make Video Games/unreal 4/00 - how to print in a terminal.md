# How to print in a terminal from unreal?

## Printline
> Unreal has a function that make that possible to print in a terminal object, the name of this function is **Printline**

## How make printline multiplataform?
> You will need to add the function **TEXT** to make this multiplataform text, like:
```c++
	
	// This text will be multiplataform
	PrintLine(TEXT("Welcome Bastard!"));

	// This only will work in the plataform that you are building this game
	PrintLine("Welcome Bastard!");	
```