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

-- how to fix this above
DELETE FROM index_event
 WHERE type = 'mass_action'


-- how to fix the groupcatalog issue
DELETE FROM `eav_attribute` WHERE attribute_code = 'groupscatalog2_groups';
DELETE FROM `core_resource` WHERE code = 'netzarbeiter_groupscatalog2_setup';
DELETE FROM `index_process` WHERE indexer_code = 'groupscatalog2_product';
DELETE FROM `index_process` WHERE indexer_code = 'groupscatalog2_category';
DROP TABLE IF EXISTS `groupscatalog_product_idx`;
DROP TABLE IF EXISTS `groupscatalog_category_idx`;


