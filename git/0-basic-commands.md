# git basic commands

# links
* https://felipec.wordpress.com/2013/09/01/advanced-git-concepts-the-upstream-tracking-branch/

# how to get a repository?
* git clone [url-of-repository]

# how to create a branch?
* git branch [name-of-the-branch]

# how to configure git to

## push all branches
git config push.default simple
* note: will fail if the current branch ins't tracking a remote upstream branch (even if a branch with the same name exist's on the remote)

## push the current branch 
git config push.default current
* note: on the other hand **current** donsen't care about whether or not the current branch tracks an upstream

# how show all branches upstreams
git branch -vv


# how to configure the upstream branch 
* git branch --set-upstream-to [branch-base] [branch-2]
* sample: git branch --set-upstream-to master private 

# how configure git so will be always creating with the master upstream 
git config --global branch.autosetupmerge always