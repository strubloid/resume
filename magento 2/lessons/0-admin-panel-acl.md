# Admin Panel and ACL

## Acl
* Are configured on etc/acl.xml
* Main structure is:
```xml
    <?xml version="1.0"?>
    <config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="urn:magento:framework:Acl/etc/acl.xsd">
        <acl>
            <resources>
                <resource id="Magento_Backend::admin">
                    <resource id="[your resource unique id]" title="[your menu title]" translate="[items to translate]" sortOrder="[order of the menu item]" />
                </resource>
            </resources>
        </acl>
    </config>
```
### Example
```xml
    <?xml version="1.0"?>
    <config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="urn:magento:framework:Acl/etc/acl.xsd">
        <acl>
            <resources>
                <resource id="Magento_Backend::admin">
                    <resource id="Monsoon_Beer::beer" title="Monsoon Beer" translate="title" sortOrder="999" />
                </resource>
            </resources>
        </acl>
    </config>
```

## Menu entry
* Are localized at etc/adminhtml/menu.xml
* Main structure is:
```xml
<?xml version="1.0"?>
<config>
    <menu>
        <add id="[Unique menu id]" title="[Title of the menu]" translate="[things to translate]" sortOrder="[order of menu item]"
             module="Monsoon_Beer" resource="Monsoon_Beer::beer" action="monsoon_beer_huge_name_backend"/>
    </menu>
</config>

```
> Note: after doing this you must clean the caches doing php bin/magento cache:clean, I personally use clean and flush, so the commmad that i am using is
