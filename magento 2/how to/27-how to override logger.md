# 27 how to override the logger from magento?

# File locations
* di.xml: [module-root]/etc/di.xml
* main di.xml: [project-root]/etc/di.xml


## Do you want to know what are the base registered files on your project?
1 - go to [project/root]/etc/di.xml
2 - Check this file
3 - You will see the first way to override this using the preference

## How can I know what is the configuration of one of those preferences under app/etc/di.xml?
1 - go to [project/root]/etc/di.xml
2 - Check what is the module that you want to change, lets say ```Psr\Log\LoggerInterface```
3 - you will see this line above:
```xml
<preference for="Psr\Log\LoggerInterface" type="Magento\Framework\Logger\Monolog" />
```
* for: it is the reference of the file
* type: it is the object that will be called
* preference is: for that reference use the type object
4 - Now if you search for the type you will find how is being build, like:
```xml
<type name="Magento\Framework\Logger\Monolog">
    <arguments>
        <argument name="name" xsi:type="string">main</argument>
        <argument name="handlers"  xsi:type="array">
            <item name="system" xsi:type="object">Magento\Framework\Logger\Handler\System</item>
            <item name="debug" xsi:type="object">Magento\Framework\Logger\Handler\Debug</item>
            <item name="syslog" xsi:type="object">Magento\Framework\Logger\Handler\Syslog</item>
        </argument>
    </arguments>
</type>
```
Note: this is the arguments that we can get on the constructor:
* name: it is the name of the monolog
* handlers: are objects that will be called to make this Monolog works

## How to override the Debug function?
1 - navigate to the file: ```Magento\Framework\Logger\Handler\Debug```
2 - you will see that it is extending from Base
3 - has a $filename and $loggerType

### how to change the $filename of the debugger?
1 - create the new debugger, lets call **debugHandler**
2 - create under [module-root]/model/DebugHandler.php
```php
<?php

namespace [vendor]\[module]\Model;

use Monolog\Logger;

class DebugHandler extends Base
{
    /**
     * @var string
     */
    protected $fileName = '/var/log/different_debug.log';

    /**
     * @var int
     */
    protected $loggerType = Logger::DEBUG;
}
```
Note: as you can notice, now the debug should be logged at **/var/log/different_debug.log**


### how to use preference to use this new debugger ?
1 - [module-root]/etc/di.xml
2 - add a **preference**
```xml
 <preference for="Magento\Framework\Logger\Handler\Debug" type="[vendor]\[module]\Model\DebugHandler" />
```
Note: like this you will be overriding all places that is using the main magento framework logger debug

### how to create a scpecific one?
1 - Lets use type arguments!
```xml
<type name="Magento\Framework\Logger\Monolog">
    <arguments>
        <argument name="handlers" xsi:type="array">
            <item name="debug" xsi:type="object">[vendor]\[module]\Model\DebugHandler</item>
        </argument>
    </arguments>
</type>
```
* for Magento\Framework\Logger\Monolog
* we would like to use debug object to be [vendor]\[module]\Model\DebugHandler
* If we have different loggers this wont be touching it

### How to be more specific?
1 - we are going to use virtual type
2 - we will need to create new class to be based on the Monolog
3 - basically go to [project-root]/app/etc/di.xml
4 - Find the place that <type> of the Monolog is created and paste into your module di.xml([module-root/etc/di.xml])
```xml
<type name="Magento\Framework\Logger\Monolog">
    <arguments>
        <argument name="name" xsi:type="string">main</argument>
        <argument name="handlers"  xsi:type="array">
            <item name="system" xsi:type="object">Magento\Framework\Logger\Handler\System</item>
            <item name="debug" xsi:type="object">Magento\Framework\Logger\Handler\Debug</item>
            <item name="syslog" xsi:type="object">Magento\Framework\Logger\Handler\Syslog</item>
        </argument>
    </arguments>
</type>
```
Note: you will find something like this, so now the first thing is change from type to virtual type
5 - adding the change only for the debug item:
```xml
<virtualType name="NewLogger" type="Magento\Framework\Logger\Monolog">
    <arguments>
        <argument name="name" xsi:type="string">main</argument>
        <argument name="handlers"  xsi:type="array">
            <item name="system" xsi:type="object">Magento\Framework\Logger\Handler\System</item>
            <item name="debug" xsi:type="object">[vendor]\[module]\Model\DebugHandler</item>
            <item name="syslog" xsi:type="object">Magento\Framework\Logger\Handler\Syslog</item>
        </argument>
    </arguments>
</virtualType>
```
* you will need to change:
  * <type> -> **<virtualType>**
  * name -> you can create your own name
  * type -> just change from **name** to **type** argument
  * item:debug -> you must change for the object that you want to override
6 - adding that override to a specific place on di.xml ([module-root/etc/di.xml]), you must add this:
```xml
    <type name="[vendor]\[module]\Console\Command\NewItem">
        <arguments>
            <argument name="logger" xsi:type="object">NewLogger</argument>
        </arguments>
    </type>
```
* The **NewLogger** from the **VirtualType:Name** will be used for **type:name**
* So our **NewLogger** That is a type of **Magento\Framework\Logger\Monolog** will be used
when we are at **[vendor]\[module]\Console\Command\NewItem**
