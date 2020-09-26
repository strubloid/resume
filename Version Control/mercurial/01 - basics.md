# Mercurial Basics

## how to remove uncommitted branch
```
hg strip [my-pruned-branch-name]
```

## how to remove untracked files
```
hg purge --all
```

## how to revert uncommited changes
```
hg update --clean
```


## how to remove a lock from mercurial
```
You must delete one of those.

# the main one is this
rm .hg/store/lock

rm .hg/wlock
rm .hg/store/phaseroots 

```