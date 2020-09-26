# basic git flow commands

##Feature

### starting a feature
```
git flow feature start [name-of-the-feature]
```
> this will result on branch name ``feature/[name-of-the-feature]``

### finishing a feature
> you can make commits, pull's and pushes as normal, if you need to finish for real the task yoy should do:

```
git flow feature finish [name-of-the-feature]
```

##Hotfix

### starting a hotfix
```
git flow feature start [name-of-the-hotfix]
```
> this will result on branch name ``feature/[name-of-the-hotfix]``

### finishing a hotfix
> you can make commits, pull's and pushes as normal, if you need to finish for real the task yoy should do:

```
git flow hotfix finish [name-of-the-hotfix]
```

##Release

### starting a release
```
git flow release start [name-of-the-release]
```
> this will result on branch name ``feature/[name-of-the-release]``

### publish a git release
> It's wise to publish the release branch after creating it to allow release commits by other developers. Do it similar to feature publishing with the command:
```
git flow release publish [name-of-the-release]
```

### finishing a release
> you can make commits, pull's and pushes as normal, if you need to finish for real the task yoy should do:

```
git flow release finish [name-of-the-release]
