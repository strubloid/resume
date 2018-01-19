# Problem: Wrong redirect
UPDATE `steamline`.`core_config_data` 
SET `value`='http://steamline.dev/' 
WHERE `path`='web/unsecure/base_url' OR `path`='web/secure/base_url';

# Problem: Path to dir in link
UPDATE `steamline`.`core_config_data` 
SET `value`='0' 
WHERE `path`='dev/css/merge_css_files' OR `path`='dev/js/merge_files';

# Problem: cant log in the backend
DELETE 
FROM `steamline`.`core_config_data` 
WHERE `path`='web/cookie/cookie_domain' OR `path`='web/cookie/cookie_path';

# Problem: cant log in the backend ( wrong link )
UPDATE `steamline`.`core_config_data`
SET `value` = 0
WHERE `path` = 'admin/url/use_custom';

# Problem: cant log in the backend ( wrong link )
DELETE FROM `steamline`.`core_config_data`
WHERE `path` = 'admin/url/custom';

UPDATE `steamline`.`core_config_data`
SET `value` = 0
WHERE `path` = 'admin/url/use_custom_path';

DELETE FROM `greenes`.`core_config_data` WHERE `path` = 'admin/url/custom_path';
WHERE `path` = 'admin/url/use_custom';




select * from evergreen_stage.core_config_data
-- where path like "%base_url%"
WHERE  path like "%web/cookie/cookie_domain%"




# use http only
UPDATE `steamline`.`core_config_data` 
SET `value`='0' 
WHERE `path`='web/cookie/cookie_httponly';




-- select * from core_email_queue