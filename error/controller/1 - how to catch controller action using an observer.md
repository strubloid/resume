

# how to catch a controller action using an observer

1. go to app/code/core/Mage/Core/Controller/Varien/Action.php
2. use a breakport at function preDispatch or postDispatch, depends what function will u be using (pre = before the controller action and post it is after the controller action)
3. check the result for each thing being triggered in Mage::dispatchEvent first argument, like

```
Mage::dispatchEvent(
            'controller_action_postdispatch_'.$this->getFullActionName(),   <---- you should get this string
            array('controller_action'=>$this)
        );
```

4. now you should go to your config.xml file and add
```
<?xml version="1.0"?>
<config>
    <!-- [...] the rest of the things from our module-->
    <frontend>
        <events>
            <controller_action_postdispatch_hickeys_clickandreserve_order_reserve>
                <observers>
                    <hickeys_newsletter_reservation_order_reserve>
                        <type>model</type>
                        <class>hickeys_newsletter/observer</class>
                        <method>reservationOrder</method>
                    </hickeys_newsletter_reservation_order_reserve>
                </observers>
            </controller_action_postdispatch_hickeys_clickandreserve_order_reserve>
        </events>
    </frontend>
</config>
```

5. How the things works?
```
In my controller varien action on method post dispatch i got in here ('controller_action_postdispatch_'.$this->getFullActionName()) that the response is hickeys_clickandreserve_order_reserve, so that's why the tag is:

<controller_action_postdispatch_hickeys_clickandreserve_order_reserve>
    <!-- your observer configuration -->
</controller_action_postdispatch_hickeys_clickandreserve_order_reserve>
```