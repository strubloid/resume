# web api config


## Preference in the di.xml
* File: app/code/Monsoon/Beer/etc/di.xml
> It is the place that you will connect things
```xml
    <preference for="Monsoon\Beer\Api\Data\BeerInterface" type="Monsoon\Beer\Model\Beer" />
    <preference for="Monsoon\Beer\Api\BeerRepositoryInterface" type="Monsoon\Beer\Model\BeerRepository" />
```
> this will connect **Monsoon\Beer\Api\Data\BeerInterface** to type **Monsoon\Beer\Model\Beer**
> this also will connect **Monsoon\Beer\Api\BeerRepositoryInterface** to type **Monsoon\Beer\Model\BeerRepository**



