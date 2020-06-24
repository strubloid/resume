# How to create conditionals in ureal?

## If and else statement
```c++
    if(Input == HiddenWord){
        PrintLine(TEXT("You got IT YEAH!!"));
    } else {
        PrintLine(TEXT("You SUCK!"));
    }
```

## Ternary conditional that returns to a variable, that is printed after
```c++
    FString Guess = (Input == HiddenWord) ? TEXT("You got IT YEAH!!") : TEXT("You SUCK!");
    PrintLine(Guess);
```

## Ternary conditional inside of the PrintLine function
```c++
    PrintLine((Input == HiddenWord) 
        ? TEXT("You got IT YEAH!!") 
        : TEXT("You SUCK!")
    );
```
