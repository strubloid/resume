# etc/module.xml
> This is a main file for module configurations

## How to generate the urn for phpstorm 
```bash
    bin/magento dev:urn-catalog:generate .idea/misc.xml
```

## sample
```xml
    <?xml version="1.0" ?>
    <config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="urn:magento:framework:Module/etc/module.xsd">
        <module name="Mastering_SampleModule" setup_version="1.0.0"/>
    </config>
```

## Sample of module with dependencies? 
```xml
    <?xml version="1.0" ?>
    <config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="urn:magento:framework:Module/etc/module.xsd">
        <module name="Mastering_SampleModule" setup_version="1.0.0">
            <sequence>
                <module name="Magento_Catalog" />
            </sequence>
        </module>
    </config>
```
> Note: this Mastering Sample Module has a minimum requirement(dependency) the Magento_Catalog module, if this module is disabled, our Mastering_Sample module wont work.

