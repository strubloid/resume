# How to use pv to see the progress of import done 
```
pv {file-zippez} | gunzip | mysql -uroot -proot {database}
```

>Note: for each type of zipped file you must change the second parameter (gunzip)
```
.tar -> tar -xvf 
.tar.gz -> tar -xvfz
tar.bz2 -> tar -xvfj
```
