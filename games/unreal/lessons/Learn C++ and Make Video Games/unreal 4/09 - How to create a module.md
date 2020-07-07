# How to create a module in Unreal 4

## Nomenclature
* [project-root]: this is the folder that you have your project, like:
```bash
    # For windows users
    c:/Games

    # For linux/mac users
    ~/Games
```
Note: for linux/mac users the character **~** means the user folder, if my user is rafa, **my ~ folder** will be: ``/home/rafa``

## Basic structure of a module
So for this explanation I will be using the folder **~/Games/Newgame**:
<pre><code class="shell">
    # You must create the module folder
    $ mkdir Mymodule

    # Inside you must create 3 files .cpp, .h and .Build.cs
    $ touch Mymodule.cpp Mymodule.h Mymodule.Build.cs

    # Showing the results
    $ ls -la
    -rw-r--r-- 1 rafa   0 Jul  7 12:41 Mymodule.Build.cs
    -rw-r--r-- 1 rafa   0 Jul  7 12:41 Mymodule.cpp
    -rw-r--r-- 1 rafa   0 Jul  7 12:41 Mymodule.h
</code></pre>

### Step1 - Crating the Mymodule.h
> **Path** /home/rafa/Games/Newgame/Mymodule <br />
> **File** /home/rafa/Games/Newgame/Mymodule/**Mymodule.h**

<pre><code class="cpp">
    #pragma once

    #include "CoreMinimal.h"

    void testrafa()
    {
        UE_LOG(LogTemp, Error, TEXT("TESTTTT RAFAEL"));
    }
</code></pre>

### Step2 - Crating the Mymodule.cpp
> **Path** /home/rafa/Games/Newgame/Mymodule <br />
> **File** /home/rafa/Games/Newgame/Mymodule/**Mymodule.cpp**

<pre> <code class="cpp">
    #include "Mymodule.h"
    #include "Modules/ModuleManager.h"

    IMPLEMENT_GAME_MODULE(FDefaultGameModuleImpl, Mymodule);
</code></pre>

### Step3 - Crating the Mymodule.Build.cs
> **Path** /home/rafa/Games/Newgame/Mymodule <br />
> **File** /home/rafa/Games/Newgame/Mymodule/**Mymodule.Build.cs**

<pre> <code class="cpp">
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
</code></pre>

## How to load this new module?
* You will need to change the **Newgame.Target.cs** and **NewgameEditor.Target.cs**
* Both are localized at **/home/rafa/Games/Newgame**

### Step4 - Changing the Newgame.Target.cs
<pre><code class="cpp">
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
</code></pre>
> This is the final result, I only added **Mymodule** to load

#### Changes

##### From
<pre><code class="cpp">
    ExtraModuleNames.AddRange( new string[] { "Newgame"} );
</code></pre>
##### To
<pre><code class="cpp">
    ExtraModuleNames.AddRange( new string[] { "Newgame", "Mymodule" } );
</code></pre>


### Step5 - Changing the NewgameEditor.Target.cs
<pre><code class="cpp">
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
</code></pre>
> This is the final result, I only added **Mymodule** to load

#### Changes

##### From
<pre><code class="cpp">
    ExtraModuleNames.AddRange( new string[] { "Newgame"} );
</code></pre>
##### To
<pre><code class="cpp">
    ExtraModuleNames.AddRange( new string[] { "Newgame", "Mymodule" } );
</code></pre>
