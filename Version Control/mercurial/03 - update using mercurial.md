# Update Branch with conflicts in phpStorm
* go to the root folder of your project, and do the following
```
    $ cd ~/webroot/project
    
    $ hg pull
    
    $ hg update
    
    $ hg merge default
```
> Note: this is the sequence, so do each element in order, so after the last command, it will try to merge, but with conflicts you must fix them

## On phpstorm

* Right click on root folder
* Select mercurial/merge
* Choose the branch if it is a feature choose to develop else (hotfix) choose default
* Resolve all conflicts
* Finish the merge with a commit that symbolizes it
```
hg commit -m "mergin with [name-of-the-branch]"
```
