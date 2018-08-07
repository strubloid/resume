# how to save a config data


## how to search by the value in the database?
1. go to the page configuration and click with right button to inspect the element, you must get something like this:
```
<select id="design_studioforty9_panels_enable_category_tags" name="groups[studioforty9_panels][fields][enable_category_tags][value]" class=" select">
	<option value="1">Yes</option>
	<option value="0" selected="selected">No</option>
</select>

```
2. go to your mysql administrator and create a select with the last part of the id[enable_category_tags]:
```
    SELECT * 
      FROM core_config_data 
     WHERE path like "%enable_category_tags%"

```
3. you will get a result like this:
```
config_id |scope   |scope_id |path                                            |value |updated_at          |
----------|--------|---------|------------------------------------------------|------|--------------------|
1718      |default |0        |design/studioforty9_panels/enable_category_tags |0     |2018-07-17 10:19:00 |
```


## how to update the value programatically?
1. grab the path for the previous select, in our case is **design/studioforty9_panels/enable_category_tags**
2. create a variable with this value and change using the function Mage::getConfig()->saveConfig();
```
$pathToConfigurationPlace = 'design/studioforty9_panels/enable_category_tags';
$newValue = 1;

$scope = 'default';   // this can be websties, default or page, as we can configure each of those scopes
$scopeId = 0;         // this is the id of the store, website or 0 for all places

Mage::getConfig()->saveConfig($pathToConfigurationPlace, $newValue, $scope, $scopeId);

```


## How to get the current store id? 
```
$store=Mage::app()->getStore()->getStoreId();
```

## extra
```
// setting that will be the update mode
Mage::app()->setUpdateMode(true);
```
> http://prattski.com/2014/09/23/using-the-magento-registry-mageregister/