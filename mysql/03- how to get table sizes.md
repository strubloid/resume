
# How to get database information doing queries?

## How to get the information for each table of each schema in your mysql?
```
    SELECT table_schema as `Database`
         , table_name AS `Table`
         , round(((data_length + index_length) / 1024 / 1024), 2) `Size in MB` 
      FROM information_schema.TABLES 
  ORDER BY (data_length + index_length) DESC;
```

##### This will return something like:
|Database| Table |Size in MB|
|--------|-------|----------|
|magento            |catalogsearch_fulltext_cl                         |   1073.00|
|magento            |catalog_product_index_price_cl                    |    698.00|
|magento            |cataloginventory_stock_status_cl                  |    608.00|
|magento2           |catalog_category_product_index_cl                 |    317.88|
|magento2           |catalog_product_flat_cl                           |    277.83| 



# How to get each table size of a specific schema?
```
    SELECT table_schema as `Database`
         , table_name AS `Table`
         , round(((data_length + index_length) / 1024 / 1024), 2) `Size in MB` 
      FROM information_schema.TABLES 
     WHERE table_schema = 'magento'
  ORDER BY (data_length + index_length) DESC;
```

##### This will return something like:
|Database| Table |Size in MB|
|--------|-------|----------|
|magento           |catalogsearch_fulltext_cl                         |   1073.00|
|magento           |catalog_product_index_price_cl                    |    698.00|
|magento           |cataloginventory_stock_status_cl                  |    608.00|
|magento           |catalog_category_product_index_cl                 |    317.88|
|magento           |catalog_product_flat_cl                           |    277.83| 


# How to get database for specific tables
> sometimes you might need to get a screenshot of a few tables, so you might be using this

```
	 SELECT table_schema as `Database`
	 	  , table_name AS `Table`
	 	  , round(((data_length + index_length) / 1024 / 1024), 2) `Size in MB`
	   FROM information_schema.TABLES
	  WHERE table_schema = 'magento'
	    AND table_name in ('sales_flat_quote_address_item', 'sales_flat_quote_address', 'sales_flat_quote_item_option', 'sales_flat_quote_shipping_rate', 'sales_flat_quote_payment', 'sales_flat_quote_item', 'sales_flat_quote')
   ORDER BY (data_length + index_length) DESC;
```