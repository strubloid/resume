# Laravel things


## How to check where are all the providers that is being set in the project?
* go to the file: **vendor/laravel/framework/src/Illuminate/Foundation/Application.php**
* check the function: **registerConfiguredProviders**
* add to the first line this command: **dd($this->config['app.providers']);**
* you will get something like:
```php
    public function registerConfiguredProviders()
    {
        dd($this->config['app.providers']);   // this is the code to add!

        $providers = Collection::make($this->config['app.providers'])
                        ->partition(function ($provider) {
                            return Str::startsWith($provider, 'Illuminate\\');
                        });

        $providers->splice(1, 0, [$this->make(PackageManifest::class)->providers()]);

        (new ProviderRepository($this, new Filesystem, $this->getCachedServicesPath()))
                    ->load($providers->collapse()->toArray());
    }
```


## How to create a provider?
The command to create a new provide is: 
```
    php artisan make:provider [providerName]
```

This is the place that Providers files are:
* app/Providers/GridProvider.php

This is a file example
```php
<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Helpers\GridHelper;

class GridProvider extends ServiceProvider
{
    public $object = 'empty';

    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        // This way you can create multiple references of it
        $this->app->bind(GridHelper::class, function(){
            return new GridHelper("Hello World");
        });

        // This way you can only have an unique instance
        $this->app->singleton(GridHelper::class, function(){
            return new GridHelper("Hello World");
        });
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }
}
```