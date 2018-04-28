# how to setup alias on mac terminal?
1. first you need to know that the **~/.barshrc** it is for bash terminals, and usually mac is using *zsh*
2. the file that you should look will be at **~/.zshrc**
3. you always can add the alias file to be **~/.zsh_aliases**, you must add to .zshrc file:
```
if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi
```
> note: the name of the file is changeable, just be sure that the file exist after running the **source ~/.zshrc**

# how to change between bash and zsh terminals?
1. exec bash: runs as bash
2. exec zsh: runs as zsh

