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

## How to use the configurations from the etc/config.xml? 
1. go to etc/contrab.xml
2. change the path on <config_path>, like:

#### Before
```
<?xml version="1.0"?>
<config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="urn:magento:module:Magento_Cron:etc/crontab.xsd">
    <group id="default">
        <job name="monsoon_beer_add" instance="Monsoon\Beer\Cron\AddBeer" method="execute">
            <config_path>* * * * *</config_path>
        </job>
    </group>
</config>
```

#### After
```
<?xml version="1.0"?>
<config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="urn:magento:module:Magento_Cron:etc/crontab.xsd">
    <group id="default">
        <job name="monsoon_beer_add" instance="Monsoon\Beer\Cron\AddBeer" method="execute">
            <config_path>monsoon/general/cron_expression</config_path>
        </job>
    </group>
</config>
```

## Creating config.php file to access the configurations
1. create a file on: app/code/Monsoon/Beer/Model/Config.php
2. use the pattern:
```
<?php

namespace Monsoon\Beer\Model;

// That is how you can change in the config values for the magento backend
use Magento\Framework\App\Config\ScopeConfigInterface;

class Config
{

    const XML_PATH_ENABLED = 'monsoon/general/enabled';
    const XML_PATH_CRON_EXPRESSION = 'monsoon/general/cron_expression';

    private $config;

    public function __construct(ScopeConfigInterface $config)
    {
        $this->config = $config;
    }


    public function isEnabled()
    {
        return $this->config->getValue(self::XML_PATH_ENABLED);
    }

}
```
> Note: use Magento\Framework\App\Config\ScopeConfigInterface; will allow you to change data from the configuration

## How to use that isEnabled?
1. Go to: app/code/Monsoon/Beer/Cron/AddBeer.php
2. Add the conditional on execute function
```
<?php

namespace Monsoon\Beer\Cron;

use Monsoon\Beer\Model\BeerFactory;
use Monsoon\Beer\Model\Config;

class AddBeer
{

    private $beerFactory;
    private $config;

    public function __construct(BeerFactory $beerFactory, Config $config)
    {
        $this->beerFactory = $beerFactory;
        $this->config = $config;                        <---- we are loading the config model object
    }

    public function execute()
    {
        if($this->config->isEnabled()) {                <---- we are checking things in here
            $this->beerFactory->create()
                ->setName('cron beer' . date("Y-m-d-h"))
                ->setPrice(rand(0,100))
                ->save()
            ;
        }
    }

}


```