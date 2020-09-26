
# how to create an upgrade script
```
<?php

try
{
    $installer = $this;

    $installer->startSetup();

    $pathToConfigurationPlace = 'google/analytics/account';
    $newValue = 'AIzaSyCuPAOHSAC_jQM9WpKGA2uuGgEO8OD0TRQ';

    $scope = 'default';   // this can be websties, default or page, as we can configure each of those scopes
    $scopeId = 0;         // this is the id of the store, website or 0 for all places

    Mage::getConfig()->saveConfig($pathToConfigurationPlace, $newValue, $scope, $scopeId);


} catch(Exception $e) {

    var_dump($e->getMessage());

} finally {
    $installer->endSetup();
}
```