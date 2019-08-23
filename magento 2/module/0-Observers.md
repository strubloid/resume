
# What is the observer design pattern?


#Publish–subscribe pattern

## Publish (Event)
> Will send some messages
> should listen

## Subscriber (Observer)
> Will receive some messages
> should recive the message
> can have more than one 
>can listen for lots of publishes
> We use to listen a particular publisher (Event)



# events.xml
## Example
```xml
<?xml version="1.0" ?>
<config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="urn:magento:framework:Event/etc/events.xsd">
	<event name="customer_register_success">
		<observer name="customer-register" instance="Testcase\FirstUnit\Observer\ChangeCustomerGroupIp"/>
	</event>
</config>
```
* <event> name is the event will be triggered for each <observer> that will be listening

# routes.xml
## Example
```xml
<config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="urn:magento:framework:App/etc/routes.xsd">
    <router id="standard">
        <route id="testcase" frontName="testcase">
            <module name="Test_Case" />
        </route>
    </router>
</config>
```