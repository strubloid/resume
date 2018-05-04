
-- where is the url for each store
SELECT * FROM core_config_data
WHERE path ='web/unsecure/base_url' OR `path`='web/secure/base_url';

-- where is the custom admin path
SELECT * FROM `core_config_data`
WHERE path like "%admin/url/custom_path%"

-- how to search for a magento core configuration
select * from `core_config_data`
where path like "%path%"

-- main queue for emails in magento.
select * from core_email_queue

-- how to get only the new emails
select * from core_email_queue
where processed_at is null

-- email template generated
select * from core_email_template

-- how to get the eav attribute
SELECT * FROM eav_attribute
WHERE attribute_code like "%sticker%"

-- how to get the actual version of the module
SELECT * FROM core_resource
WHERE code like "%sticker%"

-- how to check how much is space is occupied by the database
  SELECT table_schema as `Database`
       , table_name AS `Table`
       ,  round(((data_length + index_length) / 1024 / 1024), 2) `Size in MB`
    FROM information_schema.TABLES
   WHERE table_schema = "[database-name]"
ORDER BY (data_length + index_length) DESC

-- how to know if the index_event table is too big:
SELECT LENGTH(new_data) FROM index_event
 WHERE type = 'mass_action'

-- how to check the countries in magento
SELECT *
  FROM directory_country_region
 WHERE country_id = 'IE'


# how to get category attributes
select * from eav_attribute
where entity_type_id = 3

