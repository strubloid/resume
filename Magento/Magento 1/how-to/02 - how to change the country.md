# how to change the country 
* look to see what is the file, in my case it is project_checkout/billing.phtml
* Look into the table directory_country_region and select the country that you want to change:

```
SELECT *
  FROM [database-name].directory_country_region
 WHERE country_id = 'IE'
```
