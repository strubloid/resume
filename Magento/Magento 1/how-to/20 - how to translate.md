# How to translate in magento

## what will be translated?
```
<?php echo Mage::helper('catalog')->__('Text here');?>
```
> "Text here": it is the translated text will show over there

```
<reference name="top.links">
    <action method="addLink" translate="label title">
        <label>Text here</label>
        <title>Text here</title>
    </action>
</reference>
```
> Xml configurations with **translate** param will provide the same thing for translations

## Main place
> app/locale/{lang_ISO}/Mage_Catalog.csv

## Theme place
```
app/design/frontend/{interface}/{theme}/locale/{lang_ISO}/translate.csv
```

