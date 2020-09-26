
#how to enable a module
```
$moduleName = 'Mage_Newsletter';

// Disable the module itself
$nodePath = "modules/$moduleName/active";
if (!Mage::helper('core/data')->isModuleEnabled($moduleName)) {
    Mage::getConfig()->setNode($nodePath, 'true', true);
}
```


# how to enable the output of the module
```
$moduleName = 'Mage_Newsletter';

// Disable its output as well (which was already loaded)
$outputPath = "advanced/modules_disable_output/$moduleName";
if (Mage::getStoreConfig($outputPath)) {
    Mage::app()->getStore()->setConfig($outputPath, true);
}
```

# how to disable a module and also the output
```
$moduleName = 'Mage_Newsletter';

// Disable the module itself
$nodePath = "modules/$moduleName/active";
if (Mage::helper('core/data')->isModuleEnabled($moduleName)) {
    Mage::getConfig()->setNode($nodePath, 'true', true);
}

// Disable its output as well (which was already loaded)
$outputPath = "advanced/modules_disable_output/$moduleName";
if (Mage::getStoreConfig($outputPath)) {
    Mage::app()->getStore()->setConfig($outputPath, true);
}
```