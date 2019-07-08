# System and config xml's


## System configuration
* it is localized the configs on: etc/adminhtml/system.xml
* We have as basic structure
```xml
<?xml version="1.0" ?>
<config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="urn:magento:module:Magento_Config:etc/system_file.xsd">
    <system>
        <tab id="[id of the tab]" sortOrder="[order of the tab]" translate="[elements that you might want to translate]">
            <label>monsoon</label>
        </tab>
        <section id="[unique section id]" showInDefault="[1 or 0 for the default view]" showInStore="1 or 0 for the store view" 
                 showInWebsite="1 or 0 for the website view" sortOrder="[order of the section]" translate="[what are elements that will be translated]">
            
            <label>[label name of the section]</label>
            <tab>[this identify the tab id that we will be adding this section]</tab>
            
            <resource>[resource object of this section]</resource>
            
            <group id="unique group id" showInDefault="1" showInStore="1" showInWebsite="1" sortOrder="10" translate="label">
                
                <label>[label of the group]</label>
                
                <field id="[field unique id]" showInDefault="1" showInStore="1" showInWebsite="1" sortOrder="10" translate="label" type="select">
                    <label>enabled</label>
                    <comment/>
                    <source_model>[object that we will be using as a source model]</source_model>
                </field>
                <field id="cron_expression" showInDefault="1" showInStore="1" showInWebsite="1" sortOrder="10" translate="label" type="text">
                    <label>cron_expression</label>
                    <comment/>
                </field>
            </group>
        </section>
    </system>
</config>
```
> Note: you can find source_model on: **vendor/magento/module-config/Model/Config/Source** folder

### Example
```xml
<?xml version="1.0" ?>
<config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="urn:magento:module:Magento_Config:etc/system_file.xsd">
    <system>
        <tab id="monsoon" sortOrder="999" translate="label">
            <label>monsoon</label>
        </tab>
        <section id="monsoon" showInDefault="1" showInStore="1" showInWebsite="1" sortOrder="10" translate="label">
            <label>monsoon</label>
            <tab>monsoon</tab>
            <resource>Monsoon_Beer::config_monsoon_beer</resource>
            <group id="general" showInDefault="1" showInStore="1" showInWebsite="1" sortOrder="10" translate="label">
                <label>general</label>
                <field id="enabled" showInDefault="1" showInStore="1" showInWebsite="1" sortOrder="10" translate="label" type="select">
                    <label>enabled</label>
                    <comment/>
                    <source_model>Magento\Config\Model\Config\Source\Yesno</source_model>
                </field>
                <field id="cron_expression" showInDefault="1" showInStore="1" showInWebsite="1" sortOrder="10" translate="label" type="text">
                    <label>cron_expression</label>
                    <comment/>
                </field>
            </group>
        </section>
    </system>
</config>
```

### How to set default values for those fields (enabled and cron_expression)?
* file to add this etc/config.xml
* file have the structure:
```
    <?xml version="1.0"?>
    <config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="urn:magento:module:Magento_Store:etc/config.xsd">
        <default>
            <[section id from system.xml]>
                <[group id from system.xml]>
                    <[field id from system.xml]>0</enabled>
                </general>
            </monsoon>
        </default>
    </config>
```
### Example
```xml
<?xml version="1.0"?>
<config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="urn:magento:module:Magento_Store:etc/config.xsd">
    <default>
        <monsoon>
            <general>
                <enabled>0</enabled>
                <cron_expression>* * * * *</cron_expression>
            </general>
        </monsoon>
    </default>
</config>
```
> Note: as you can see we have enabled default value as "0" and the main cron expression default value is "* * * * *"


