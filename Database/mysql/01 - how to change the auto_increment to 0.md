select * from pittman.mageworx_downloads_categories

select * from pittman.mageworx_downloads_files


TRUNCATE pittman.mageworx_downloads_categories;
ALTER TABLE pittman.mageworx_downloads_categories AUTO_INCREMENT=0;


select * from pittman.core_config_data
WHERE `path`='web/unsecure/base_url' OR `path`='web/secure/base_url';