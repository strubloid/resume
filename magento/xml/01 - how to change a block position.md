# how to change a block position

## the main configuration 
```
<studioforty9_panels_page>
    <reference name="content">
        <block type="studioforty9_panels/renderer" name="studioforty9.panels.renderer" template="studioforty9/panels/renderer.phtml" before="-">
            <block type="core/text_list" name="studioforty9.panels.before"/>
            <block type="core/text_list" name="studioforty9.panels.after"/>
        </block>
    </reference>
</studioforty9_panels_page>
```

## the changed main xml
```
<studioforty9_panels_page>
	<reference name="content">
	    <action method="unsetChild"><name>studioforty9.panels.renderer</name></action>
	    <block type="studioforty9_panels/renderer" name="studioforty9.panels.renderer" template="studioforty9/panels/renderer.phtml" after="category.products">
	        <block type="core/text_list" name="studioforty9.panels.before"/>
	        <block type="core/text_list" name="studioforty9.panels.after"/>
	    </block>
	</reference>
</studioforty9_panels_page>
```

1. you must **unset the child** first doing: <action method="unsetChild"><name>studioforty9.panels.renderer</name></action>
2. the name param will be the name of the block
3. after you can load normally the block and will be changed the configuration without change the main files
