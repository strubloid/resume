# how to use magerun to create a vanilla project

```
 n98-magerun.phar install --dbHost="localhost" --dbUser="mydbuser" 
 --dbPass="mysecret" --dbName="magentodb" 
 --installSampleData=yes --useDefaultConfigParams=yes 
 --magentoVersionByName="magento-ce-1.7.0.2" 
 --installationFolder="magento" --baseUrl="http://magento.localdomain/"
 ```
 > you must change: <br />
 > 1 - magentoVersionByName to be the version that you wish <br />
 > 2 - baseUrl to be the base url of the vanilla <br />
 > 3 - dbUser, dbPass and dbName <br />
 