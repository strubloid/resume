# how to load a different store

## index.php solution
> before the end of the file we have a Mage::run(...), you must do:

### store
* get what is the store code, in our case was **uk**
* verify that is store
```
Mage::run('uk', 'store');
```

## website
> for a few cases will be a website instead of a store, so you must:
* get what is the website code, in our case was **uk-site**
* verify that is website
```
Mage::run('uk-site', 'website');
```
