# Basics

## The Bourne Shell: /bin/sh
> The shell is one of most important parts in Unix system. Shell is a program that runs commands, usually Linux uses an enchanced version of the Bourne shell called **bash**.

## Navigation Directories
> Unix starts with **/** that's the root directory, starts with slash(/) and goes with a few of main subdirectories like **/usr** or **/tmp**.

## Parent directory
> It's represented by two dots **..**

## Current directory 
> It's represented by one dot **.**

## Relative path
> It's a path that not starts with **/**

## Shell Globbing (Wildcards)
> The shell can match simple patterns to file and directory names, a process known as **globbing**, similar concept of *wildcards* in other systems.

```
$ echo file* 

```
> this will show all files that starts with file (file-new, fileSometing...)

### Usage of wildcards
1. searching*  : this will show all filenames that starts with **searching**
2. *searching  : this will show all filenames that finishes with **searching**
3. *searching\* : this will show all filenames that contains **searching** in the file

## Glob card *?*
> The question mark wildcard instructs the shel to match exactly one **arbitrary character**, as example:
```
b?at = boat or brat, because the second letter can be any letter so b[o]at and b[r]at are valid things.
```

## Wildcards
1. asterisk (*): zero characters, all single characters or any string
2. question mark (?): exactly one character, wich can be  any single character
3. Square Brackets ([]): will represent all characters enclosed in the brackets
```
    file [a-cst]*: file that starts with a->c(a,b,c), s or t, getting the group (a,b,c,s,t)
   
    file [a-cx-z]*: file that starts with a,b or c also x,y or z, getting the group (a,b,c,x,y,z
```


# how to move a panel from left monitor to right
```
Right-click the panel you wish to move and select “Properties”.
Uncheck the “Expand” option under the “General” tab.
Grab one of the edges of the panel by clicking on the left or right end (top or bottom end for vertical panels).
Drag the bar to the desired screen and position.
Check the “Expand” option in the “Panel Properties” window and click “Close”.
```






