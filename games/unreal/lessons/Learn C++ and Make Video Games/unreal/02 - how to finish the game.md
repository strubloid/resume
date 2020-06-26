# 02 - How to finish the game?


## All Options
```c++
    Super::EndPlay(EEndPlayReason::Destroyed); // 0
    Super::EndPlay(EEndPlayReason::LevelTransition); // 1
    Super::EndPlay(EEndPlayReason::EndPlayInEditor); // 2
    Super::EndPlay(EEndPlayReason::RemovedFromWorld); // 3
    Super::EndPlay(EEndPlayReason::Quit); // 4
```

## EEndPlayReason::Destroyed

## EEndPlayReason::LevelTransition

## EEndPlayReason::EndPlayInEditor

## EEndPlayReason::RemovedFromWorld

## EEndPlayReason::Quit
> This broke my environment, so we can avoid for now on.