# Commands

## Echo
> With this command we can print in the screen what we want show in the terminal.

```
$ echo "Hello Rafael"
```
> This will print out "Hello Rafael" in the terminal

## Echo with >
> using the > you can export the information from your echo to a file, as sample:

```
$ echo "Hello there you bastard" > linux.txt

$ cat linux.txt

```
> After those 2 commands you must  notice that will be printed out "Hello there you bastard", and the information is localized in the file **linux.txt**.

## Cat
> This is a simpler command that it is used to print out in the terminal a file content, can it be with mutiple files, so the result will be ordered by FIFO (first in first out) and will be displayed in the terminal.

```
cat linux.txt

``` 
> After run this command you must see in your terminal the message "Hello there you bastard"

```

echo "You are learning!" > linux2.txt

cat linux.txt linux2.txt

``` 
### Result
```
Hello there you bastard
You are learning!
```

## Watch
> This is a good command to use to watch things, what will change will be changed in the requested file.

```
watch -n 1 cat linux.txt

```
> Note: The watch command will execute something for **"n"** seconds, above we have the cat command that will show the content inside of the linux.txt file, so if you watch this file using one terminal and with another change the content of the linux.txt you will see things changing and you will enjoy this feeling of controlling the situation, so have fun.

## Ls 
> This command lists the contents of a directory.

```
ls -l
```
### Result
```
-rw-r--r--  1 strubloid strubloid   25 Apr  6 10:11 linux.txt
-rw-r--r--  1 strubloid strubloid   18 Apr  6 10:25 linux2.txt
```

## cp
> This will copy files, the first argument is the file that you wish to copy to the second argument that is the content pasted place.
```
cp linux.txt linux2.txt
```
> after this command both files will have the same content "Hello there you bastard".

## mv
> This command will do the same as the cp, but instead of copy it will be moving, like the idea of cut from the first and putting in the second.
```
mv linux.txt linux2.txt
```
> after this command the linux.txt wont exist anymore and the linux2.txt will have the content: "Hello there you bastard"

## Moving lots of files
> To move more than one file is easy, you must say what are the files that you wish to move, choose an existent folder and move them!
```

$ mkdir newdir

$ mv linux.txt linux2.txt newdir

$ ls -l

$ ls -l newdir

```
> After running all commands you must see that in the current folder *we don't have anymore* the **linux.txt** and **linux2.txt** and now it is being printed when we use the ls for the folder **newdir**.

## touch 
> This is a command to create new files, if the file exists this wont do a thing, so this is a safest way to create new files *without the worry about the old content* of the file.

## rm
> This command will remove the file or folder

## cd
> This command will change the **current directory** (current working directory)
> note: If you only do **cd**(omitting the directory) you will be getting your home folder like **cd ~**

## mkdir
> this command will create a new directory

## rmdir 
> this command will remove a directory, this will fail if you have file inside of the folders, so you must opt for **rm -rf [dir]**


## grep
> This command prints the lines from a file or input stream that match an expression, For example, to print lines in **/etc/passwd** that contains a word **root** in it, you must:

```
$ grep root /etc/passwd
```
> This will shown all the lines inside of the **/etc/passwd** file that contains the word **root**
```
$ echo -e "[rafael]you will see something nice\n[rafael]this text ins't bold" > rafael1.txt

$ echo -e "[rafael]new thing in this file that might be so big that you cant read them all \n[rafael]: password123456" > rafael2.txt

$ grep rafael rafael*
```
### Result
```
rafael1.txt:[rafael]you will see something nice
rafael1.txt:[rafael]this text ins't bold
rafael2.txt:[rafael]new thing in this file that might be so big that you cant read them all 
rafael2.txt:[rafael]: password123456
```
1. Notice that tou have [**rafael**] being **bold**, because that is what you were looking for
2. Also you have all the files that we match with the pattern **rafael**\* (rafael1.txt and rafael2.txt)

## Less
> This is a command that will help you out reading files, this will open the file and you can use arrow up or down to scroll though the file.












