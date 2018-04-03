# For some packages we will need to add
```
"minimum-stability" : "dev"
```
> Note: this will be in the main object*

# How to re-deploy everything

```
composer.phar run-script post-install-cmd -vvv -- --redeploy
```