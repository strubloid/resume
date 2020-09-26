# For some packages we will need to add
```
"minimum-stability" : "dev"
```
> Note: this will be in the main object*

# How to re-deploy everything
```
composer.phar run-script post-install-cmd -vvv -- --redeploy
```

# how to use a specific version of php with composer:
```

[php alias or path] [composer alias or path] [action] [package]

php5.6 /usr/bin/composer  remove connect20/Doofinder_Feed

```