# basic hg flow commands


##Feature
### starting a feature 
```
hg flow feature start [name-of-the-feature]
```
> this will result on branch name feature/[name-of-the-feature]

### finishing a feature
> you can make commits, pull's and pushes as normal, if you need to finish for real the task yoy should do:

```
hg flow feature finish [name-of-the-feature]
```


##Hotfix
### starting a hotfix 
```
hg flow feature start [name-of-the-hotfix]
```
> this will result on branch name feature/[name-of-the-hotfix]

### finishing a hotfix
> you can make commits, pull's and pushes as normal, if you need to finish for real the task yoy should do:

```
hg flow hotfix finish [name-of-the-hotfix]
```

##Release
### starting a release
```
hg flow release start [name-of-the-release]
```
> this will result on branch name feature/[name-of-the-release]

### finishing a release
> you can make commits, pull's and pushes as normal, if you need to finish for real the task yoy should do:

```
hg flow release finish [name-of-the-release]
```