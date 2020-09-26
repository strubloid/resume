# How to reset the popup search when is broken?

1 open the file .idea/config/options.dimensions.xml
2 search for
```
(.*search.everywhere.popup.*y=)"([0-9]+)"(.*)
```
3 replace for
```
$1"1"$3
```

### Check the file .idea/workspace.xml
2 search for
```
(.*y=)"(-[0-9]+)"(.*)
```
3 replace for
```
$1"1"$3
```
