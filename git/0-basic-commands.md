# git basic commands

# links
* https://felipec.wordpress.com/2013/09/01/advanced-git-concepts-the-upstream-tracking-branch/
* https://stackoverflow.com/questions/2003505/how-do-i-delete-a-git-branch-both-locally-and-remotely

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

# whats a upstrem
* it is the continuation of a main branch to another, so if you setup a branch x to be uptream to master, it is needed to merge into master code for delete this branch for example.
* this is a connection between 2 branches

# how show all branches upstreams
git branch -vv


# how to configure the upstream branch 
* git branch --set-upstream-to [branch-base] [branch-2]
* sample: git branch --set-upstream-to master private 

# how configure git so will be always creating with the master upstream 
git config --global branch.autosetupmerge always


# how to delete a branch
* git checkout [another-branch]
* git branch -d [name-of-the-branch]
* if you need to force use the -D param, like git branch -D [name-of-the-branch]

# how to update a deleted branch 
* git push orign --delete [name-of-the-branch]

# how to propagate changes after delete
* git fetch --all --prune
* note: prune option is to delete all untracked branhces


