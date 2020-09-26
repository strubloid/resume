# programs

# mmv
```
$ sudo aptititude install mmv

```
> this will have a different mv, it will allow you to use wildcards on terminal, like:

```

echo "creating a new file" > rafael1.txt
echo "creating a new file" > rafael2.txt

mmv "rafael*.txt" "rafael#1.md"

```
> this will match the pattern rafael[any char].txt and will change to rafael[any char].md, so the result will be new 2 files **rafael1.md** and **rafael2.md**.

## egrep
```
$ sudo aptititude install egrep

```
> this will allow the grep to be grep -E, that will allow the grep to use regular expressions like:
```
$ egrep r.{2}t /etc/passwd

```
> you must be able to search for **root** things on **/etc/passwd**
