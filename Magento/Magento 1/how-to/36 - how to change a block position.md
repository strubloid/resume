# how to change a block position

## the main configuration 
```
<strubloid_panels_page>
    <reference name="content">
        <block type="strubloid_panels/renderer" name="strubloid.panels.renderer" template="strubloid/panels/renderer.phtml" before="-">
            <block type="core/text_list" name="strubloid.panels.before"/>
            <block type="core/text_list" name="strubloid.panels.after"/>
        </block>
    </reference>
</strubloid_panels_page>
```

## the changed main xml
```
<strubloid_panels_page>
	<reference name="content">
	    <action method="unsetChild"><name>strubloid.panels.renderer</name></action>
	    <block type="strubloid_panels/renderer" name="strubloid.panels.renderer" template="strubloid/panels/renderer.phtml" after="category.products">
	        <block type="core/text_list" name="strubloid.panels.before"/>
	        <block type="core/text_list" name="strubloid.panels.after"/>
	    </block>
	</reference>
</strubloid_panels_page>
```

1. you must **unset the child** first doing: <action method="unsetChild"><name>strubloid.panels.renderer</name></action>
2. the name param will be the name of the block
3. after you can load normally the block and will be changed the configuration without change the main files
