# How to create a module in Unreal 4

## Nomenclature
* [project-root]: this is the folder that you have your project, like:
```sh
    # For windows users
    c:/Games

    # For linux/mac users
    ~/Games
```
Note: for linux/mac users the character **~** means the user folder, if my user is rafa, **my ~ folder** will be: ``/home/rafa``

## Basic structure of a module
So for this explanation I will be using the folder **~/Games/Newgame**:
```Shell
    # You must create the module folder
    $ mkdir Mymodule

    # Inside you must create 3 files .cpp, .h and .Build.cs
    $ touch Mymodule.cpp Mymodule.h Mymodule.Build.cs

    # Showing the results
    $ ls -la
    -rw-r--r-- 1 rafa   0 Jul  7 12:41 Mymodule.Build.cs
    -rw-r--r-- 1 rafa   0 Jul  7 12:41 Mymodule.cpp
    -rw-r--r-- 1 rafa   0 Jul  7 12:41 Mymodule.h
```

### Step1 - Crating the Mymodule.h
> **Path** /home/rafa/Games/Newgame/Mymodule <br />
> **File** /home/rafa/Games/Newgame/Mymodule/**Mymodule.h**

```Shell
    #pragma once

    #include "CoreMinimal.h"

    void testrafa()
    {
        UE_LOG(LogTemp, Error, TEXT("TESTTTT RAFAEL"));
    }
```

### Step2 - Crating the Mymodule.cpp
> **Path** /home/rafa/Games/Newgame/Mymodule <br />
> **File** /home/rafa/Games/Newgame/Mymodule/**Mymodule.cpp**

```cpp
    #include "Mymodule.h"
    #include "Modules/ModuleManager.h"

    IMPLEMENT_GAME_MODULE(FDefaultGameModuleImpl, Mymodule);
```

### Step3 - Crating the Mymodule.Build.cs
> **Path** /home/rafa/Games/Newgame/Mymodule <br />
> **File** /home/rafa/Games/Newgame/Mymodule/**Mymodule.Build.cs**

```cpp
    using UnrealBuildTool;

    public class Mymodule : ModuleRules
    {
        public Mymodule(ReadOnlyTargetRules Target) : base(Target)
        {
            PCHUsage = PCHUsageMode.UseExplicitOrSharedPCHs;

            PublicDependencyModuleNames.AddRange(new string[] { "Core", "CoreUObject", "Engine", "InputCore" });

            PrivateDependencyModuleNames.AddRange(new string[] {  });
        }
    }
```

## How to load this new module?
* You will need to change the **Newgame.Target.cs** and **NewgameEditor.Target.cs**
* Both are localized at **/home/rafa/Games/Newgame**

### Step4 - Changing the Newgame.Target.cs

```cpp
using UnrealBuildTool;
using System.Collections.Generic;

public class Building_EscapeTarget : TargetRules
{
	public Building_EscapeTarget( TargetInfo Target) : base(Target)
	{
		Type = TargetType.Game;
		DefaultBuildSettings = BuildSettingsVersion.V2;
		ExtraModuleNames.AddRange( new string[] { "Newgame", "Mymodule" } );
	}
}
```

> This is the final result, I only added **Mymodule** to load

#### Changes

##### From
```cpp
    ExtraModuleNames.AddRange( new string[] { "Newgame"} );
```
##### To
```cpp
    ExtraModuleNames.AddRange( new string[] { "Newgame", "Mymodule" } );
```


### Step5 - Changing the NewgameEditor.Target.cs
```cpp
using UnrealBuildTool;
using System.Collections.Generic;

public class Building_EscapeEditorTarget : TargetRules
{
	public Building_EscapeEditorTarget( TargetInfo Target) : base(Target)
	{
		Type = TargetType.Editor;
		DefaultBuildSettings = BuildSettingsVersion.V2;
		ExtraModuleNames.AddRange( new string[] { "Newgame", "Mymodule" } );
	}
}
```
> This is the final result, I only added **Mymodule** to load

#### Changes

##### From
```cpp
    ExtraModuleNames.AddRange( new string[] { "Newgame"} );
```
##### To
```cpp
    ExtraModuleNames.AddRange( new string[] { "Newgame", "Mymodule" } );
```

### Step6 - Add the module to the .uproject file
> **File** /home/rafa/Games/Newgame/**Newgame.uproject**

```json
{
	"FileVersion": 3,
	"EngineAssociation": "4.25",
	"Category": "",
	"Description": "",
	"Modules": [
		{
			"Name": "Newgame",
			"Type": "Runtime",
			"LoadingPhase": "Default"
		},
		{
			"Name": "Mymodule",
			"Type": "Runtime",
			"LoadingPhase": "Default"
		}
	]
}
```
> This is the final result, I only added **Mymodule** to load
#### Changes

##### From
```json
"Modules": [
    {
        "Name": "Newgame",
        "Type": "Runtime",
        "LoadingPhase": "Default"
    }
]
```
##### To
```json
"Modules": [
    {
        "Name": "Newgame",
        "Type": "Runtime",
        "LoadingPhase": "Default"
    },
    {
        "Name": "Mymodule",
        "Type": "Runtime",
        "LoadingPhase": "Default"
    }
]
```

Note: Any questions related to this I will be very happy to discuss about it, and if you know how to add as an object, could be nice to talk to me, anyway, if you need help on this I am your guy!
