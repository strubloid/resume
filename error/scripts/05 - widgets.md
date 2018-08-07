# widgets

## how to create a new widget with page_groups for magento 1.9
```
	$newWidget = Mage::getModel('widget/widget_instance');

            // loading the miele logo block
            $staticBlock = Mage::getModel('cms/block')->load('miele_logo');
            $mieleLogoBlockId = $staticBlock->getId() ? $staticBlock->getId() : '329';

            // creating the widget options
            $widgetOptions = array('block_id' => $mieleLogoBlockId,);

            // loading all the entities that we will be adding this rule
            $entities = array(48,69,199,202,207,646,648,649,818,975,985,1110,1175,1286,1560,1717,2010,2016,2017,2018,2020,2021,2073,2361,2362,2364,2499,2624,2625,2627,2628,2629,2630,2631,2632,2633,3083,3402,3405,3406,3486,3492,3617,3800,3808,3809,3810,3851,3884,4318,4355,4457,4581,4644,4680,4710,4757,4812,4847,4927,4961,4989,5103,5203,5401,5404,5406,5559,5650,5692,5773,5774,5859,5997,6036,6124,6322,6345,6400,6578,6632,6797,6806,6807,6832,7091,7100,7166,7611,7654,7719,7798,7815,7817,7818,7820,7996,8108,8618,8911,9119,9133,9143,9317,9318,9341,9452,9509,9511,9517,9571,9572,9573,9574,9575,9576,9577,9578,9579,9580,9581,9582,9583,9584,9585,9586,9587,9588,9589,9590,9591,9592,9593,9594,9595,9596,9598,9599,9600,9601,9602,9603,9604,9605,9606,9607,9608,9609,9610,9611,9612,9613,9614,9615,9616,9617,9618,9619,9620,9621,9622,9623,9624,9625,9626,9627,9628,9629,9630,9631,9632,9633,9634,9635,9636,9637,9638,9639,9640,9641,9643,9644,9645,9646,9647,9648,9659,9660,9661,9662,9672,9749);

            // creating the widgetData array
            $newWidgetData = array(
                'type' => 'cms/widget_block',
                'instance_type' => 'cms/widget_block',
                'package_theme' => 'did/reskin',
                'widget_parameters' => serialize($widgetOptions),
                'title' => 'Block Miele Logo Product Page',
                'store_ids' => array(Mage::app()->getStore('default')->getId()),
                'sort_order' => '0',
                'page_groups' => array(
                    array(
                        'page_group' => 'simple_products',
                        'block ' => "before.product.title",
                        'simple_products' => array(
                            'page_id' => "0",
                            'group '=> "simple_products",
                            'layout_handle' => "PRODUCT_TYPE_simple",
                            'for' => "specific",
                            'block' => "before.product.title",
                            'entities' => implode(',', $entities),
                            'template' => "cms/widget/static_block/default.phtml",
                        )
                    )
                )
            );

            // set of the new widget data
            $newWidget->setData($newWidgetData);

            // saving the new widget
            $newWidget->save();


```




## String of a widget object
```
$widgetInstance = {Mage_Widget_Model_Widget_Instance} [19]
 _underscoreCache = {array} [30]
  AddressType = "address_type"
  HostName = "host_name"
  Port = "port"
  IsDefault = "is_default"
  DefaultGroupId = "default_group_id"
  Front = "front"
  StoreId = "store_id"
  Action = "action"
  SkipEmptySessionCheck = "skip_empty_session_check"
  Locale = "locale"
  ControllerAction = "controller_action"
  User = "user"
  Extra = "extra"
  UserId = "user_id"
  Password = "password"
  UserPasswordChanged = "user_password_changed"
  Acl = "acl"
  ReloadAclFlag = "reload_acl_flag"
  Username = "username"
  Object = "object"
  SyncProcessStopWatch = "sync_process_stop_watch"
  State = "state"
  IsUrlNotice = "is_url_notice"
  IsPrimary = "is_primary"
  Code = "code"
  CouponCode = "coupon_code"
  UsesPerCoupon = "uses_per_coupon"
  UseAutoGeneration = "use_auto_generation"
  UsageLimit = "usage_limit"
  ActionsSerialized = "actions_serialized"
 _layoutHandles = {array} [10]
  anchor_categories = "catalog_category_layered"
  notanchor_categories = "catalog_category_default"
  all_products = "catalog_product_view"
  all_pages = "default"
  simple_products = "PRODUCT_TYPE_simple"
  grouped_products = "PRODUCT_TYPE_grouped"
  configurable_products = "PRODUCT_TYPE_configurable"
  virtual_products = "PRODUCT_TYPE_virtual"
  bundle_products = "PRODUCT_TYPE_bundle"
  downloadable_products = "PRODUCT_TYPE_downloadable"
 _specificEntitiesLayoutHandles = {array} [9]
  anchor_categories = "CATEGORY_{{ID}}"
  notanchor_categories = "CATEGORY_{{ID}}"
  all_products = "PRODUCT_{{ID}}"
  simple_products = "PRODUCT_{{ID}}"
  grouped_products = "PRODUCT_{{ID}}"
  configurable_products = "PRODUCT_{{ID}}"
  virtual_products = "PRODUCT_{{ID}}"
  bundle_products = "PRODUCT_{{ID}}"
  downloadable_products = "PRODUCT_{{ID}}"
 _widgetConfigXml = null
 _eventPrefix = "widget_widget_instance"
 _eventObject = "object"
 _resourceName = "widget/widget_instance"
 _resource = null
 _resourceCollectionName = "widget/widget_instance_collection"
 _cacheTag = "widget_instance"
 _dataSaveAllowed = true
 _isObjectNew = null
 _data = {array} [9]
  instance_id = "73"
  instance_type = "cms/widget_block"
  package_theme = "did/reskin"
  title = "Block Miele Logo Product Page"
  store_ids = "1"
  widget_parameters = "a:1:{s:8:"block_id";s:3:"329";}"
  sort_order = "0"
  type = "cms/widget_block"
  page_groups = {array} [1]
   0 = {array} [8]
    page_id = "7"
    instance_id = "73"
    page_group = "simple_products"
    layout_handle = "PRODUCT_TYPE_simple"
    block_reference = "before.product.title"
    page_for = "specific"
    entities = "48,69,199,202,207,646,648,649,818,975,985,1110,1175,1286,1560,1717,2010,2016,2017,2018,2020,2021,2073,2361,2362,2364,2499,2624,2625,2627,2628,2629,2630,2631,2632,2633,3083,3402,3405,3406,3486,3492,3617,3800,3808,3809,3810,3851,3884,4318,4355,4457,4581,4644,4680,4710,4757,4812,4847,4927,4961,4989,5103,5203,5401,5404,5406,5559,5650,5692,5773,5774,5859,5997,6036,6124,6322,6345,6400,6578,6632,6797,6806,6807,6832,7091,7100,7166,7611,7654,7719,7798,7815,7817,7818,7820,7996,8108,8618,8911,9119,9133,9143,9317,9318,9341,9452,9509,9511,9517,9571,9572,9573,9574,9575,9576,9577,9578,9579,9580,9581,9582,9583,9584,9585,9586,9587,9588,9589,9590,9591,9592,9593,9594,9595,9596,9598,9599,9600,9601,9602,9603,9604,9605,9606,9607,9608,9609,9610,9611,9612,9613,9614,9615,9616,9617,9618,9619,9620,9621,9622,9623,9624,9625,9626,9627,9628,9629,9630,9631,9632,9633,9634,9635,9636,9637,9638,9639,9640,9641,9643,9644,9645,9646,9647,9648,9659,9660,9661,9662,9672,9749"
    page_template = "cms/widget/static_block/default.phtml"
```