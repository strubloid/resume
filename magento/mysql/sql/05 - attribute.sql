
-- how to get the main table for the at tribute, you also will have the basic structure
select * from eav_attribute
where attribute_id in (699,700,701,702)

-- how to get more information about the attributes
select * from catalog_eav_attribute
where attribute_id in (699,700,701,702)

-- table with attribute set, group and sort order
select * from eav_entity_attribute
where attribute_id in (699,700,701,702)


-- how to purge an attribute
delete from eav_attribute
where attribute_id in (699,700,701,702)

-- after run the deletion on eav_attribute by cascade will delete the data on catalog_eav_attribute and eav_entity_attribute
delete from catalog_eav_attribute where attribute_id in (699,700,701,702)
delete from eav_entity_attribute  where attribute_id in (699,700,701,702)
-- Only if something weird happened you can run those deletion on catalog_eav_attribute and eav_entity_attribute
