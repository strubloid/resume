# List of events

## List all events in Magento 2

### Events in PHP Files
* Event name: sales_quote_remove_item
* File: vendor/magento/Collect/Model/Quote.php
```
    $this->_eventManager->dispatch('sales_quote_remove_item', ['quote_item' => $item]);
```

* Event name: sales_quote_add_item
* File: vendor/magento/Collect/Model/Quote.php
```
    $this->_eventManager->dispatch('sales_quote_add_item', ['quote_item' => $item]);
```

* Event name: sales_quote_product_add_after
* File: vendor/magento/Collect/Model/Quote.php
```
    $this->_eventManager->dispatch('sales_quote_product_add_after', ['items' => $items]);
```

* Event name: _merge_before
* File: vendor/magento/Collect/Model/Quote.php
```
    $this->_eventManager->dispatch(
	    $this->_eventPrefix . '_merge_before',
	    [$this->_eventObject => $this, 'source' => $quote]
	);
```

* Event name: _merge_after
* File: vendor/magento/Collect/Model/Quote.php

```
    $this->_eventManager->dispatch(
	    $this->_eventPrefix . '_merge_after',
	    [$this->_eventObject => $this, 'source' => $quote]
	);
```

* Event name: sales_quote_item_qty_set_after
* File: vendor/magento/Collect/Model/Quote/Item.php
```
 	$this->_eventManager->dispatch('sales_quote_item_qty_set_after', ['item' => $this]);
```

* Event name: sales_quote_item_set_product
* File: vendor/magento/Collect/Model/Quote/Item.php
```
    $this->_eventManager->dispatch(
	    'sales_quote_item_set_product',
	    ['product' => $product, 'quote_item' => $this]
	);
```

* Event name: _import_data_before
* File: vendor/magento/Collect/Model/Quote/Payment.php
```
    $this->_eventManager->dispatch(
	    $this->_eventPrefix . '_import_data_before',
	    [$this->_eventObject => $this, 'input' => $data]
	);
```

* Event name: _load_after
* File: vendor/magento/Collect/Model/ResourceModel/Quote/Address/Collection.php
```
    $this->_eventManager->dispatch($this->_eventPrefix . '_load_after', [$this->_eventObject => $this]);
```

* Event name: prepare_catalog_product_collection_prices
* File: vendor/magento/Collect/Model/ResourceModel/Quote/Item/Collection.php
```
    $this->_eventManager->dispatch(
	    'prepare_catalog_product_collection_prices',
	    ['collection' => $productCollection, 'store_id' => $this->getStoreId()]
	);
```

* Event name: sales_quote_item_collection_products_after_load
* File: vendor/magento/Collect/Model/ResourceModel/Quote/Item/Collection.php
```
    $this->_eventManager->dispatch(
	    'sales_quote_item_collection_products_after_load',
	    ['collection' => $productCollection]
	);
```

* Event name: controller_front_send_response_before
* File: vendor/magento/framework/App/Http.php
```
    $this->_eventManager->dispatch('controller_front_send_response_before', $eventParams);
```

* Event name: controller_action_layout_render_before
* File: vendor/magento/framework/App/View.php
```
    $this->_eventManager->dispatch('controller_action_layout_render_before');
```

* Event name: controller_action_layout_render_before_
* File: vendor/magento/framework/App/View.php
```
    $this->_eventManager->dispatch(
	    'controller_action_layout_render_before_' . $this->_request->getFullActionName()
	);
```

* Event name: controller_action_predispatch
* File: vendor/magento/framework/App/Action/Action.php
```
    $this->_eventManager->dispatch('controller_action_predispatch', $eventParameters);
```

* Event name: controller_action_predispatch_
* File: vendor/magento/framework/App/Action/Action.php
```
    $this->_eventManager->dispatch('controller_action_predispatch_' . $request->getRouteName(), $eventParameters);
```

* Event name: controller_action_predispatch_
* File: vendor/magento/framework/App/Action/Action.php
```
    $this->_eventManager->dispatch(
	    'controller_action_predispatch_' . $request->getFullActionName(),
	    $eventParameters
	);
```

* Event name: controller_action_postdispatch_
* File: vendor/magento/framework/App/Action/Action.php
```
    $this->_eventManager->dispatch(
	  'controller_action_postdispatch_' . $request->getFullActionName(),
	    $eventParameters
	);
```

* Event name: controller_action_postdispatch_
* File: vendor/magento/framework/App/Action/Action.php
```
    $this->_eventManager->dispatch(
	       'controller_action_postdispatch_' . $request->getRouteName(),
	       $eventParameters
	);
```

* Event name: controller_action_postdispatch
* File: vendor/magento/framework/App/Action/Action.php
```
    $this->_eventManager->dispatch('controller_action_postdispatch', $eventParameters);
```

* Event name: controller_action_noroute
* File: vendor/magento/framework/Controller/Noroute/Index.php
```
    $this->_eventManager->dispatch('controller_action_noroute', ['action' => $this, 'status' => $status]);
```

* Event name: currency_display_options_forming
* File: vendor/magento/framework/Locale/Currency.php
```
    $this->_eventManager->dispatch(
	   'currency_display_options_forming',
	   ['currency_options' => $options, 'base_code' => $currency]
	);
```

* Event name: model_load_before
* File: vendor/magento/framework/Model/AbstractModel.php
```
    $this->_eventManager->dispatch('model_load_before', $params);
```

* Event name: _load_before
* File: vendor/magento/framework/Model/AbstractModel.php
```
	 $this->_eventManager->dispatch($this->_eventPrefix . '_load_before', $params);
```

* Event name: model_load_after
* File: vendor/magento/framework/Model/AbstractModel.php
```
	 $this->_eventManager->dispatch('model_load_after', ['object' => $this]);
```

* Event name: _load_after
* File: vendor/magento/framework/Model/AbstractModel.php
```
    $this->_eventManager->dispatch($this->_eventPrefix . '_load_after', $this->_getEventData());
```

* Event name: model_save_commit_after
* File: vendor/magento/framework/Model/AbstractModel.php
```
    $this->_eventManager->dispatch('model_save_commit_after', ['object' => $this]);
```

* Event name: _save_commit_after
* File: vendor/magento/framework/Model/AbstractModel.php
```
    $this->_eventManager->dispatch($this->_eventPrefix . '_save_commit_after', $this->_getEventData());
```

* Event name: model_save_before
* File: vendor/magento/framework/Model/AbstractModel.php
```
    $this->_eventManager->dispatch('model_save_before', ['object' => $this]);
```

* Event name: _save_before
* File: vendor/magento/framework/Model/AbstractModel.php
```
    $this->_eventManager->dispatch($this->_eventPrefix . '_save_before', $this->_getEventData());
```

* Event name: model_save_after
* File: vendor/magento/framework/Model/AbstractModel.php
```
    $this->_eventManager->dispatch('model_save_after', ['object' => $this]);
```

* Event name: clean_cache_by_tags
* File: vendor/magento/framework/Model/AbstractModel.php
```
    $this->_eventManager->dispatch('clean_cache_by_tags', ['object' => $this]);
```

* Event name: _save_after
* File: vendor/magento/framework/Model/AbstractModel.php
```
    $this->_eventManager->dispatch($this->_eventPrefix . '_save_after', $this->_getEventData());
```

* Event name: model_delete_before
* File: vendor/magento/framework/Model/AbstractModel.php
```
    $this->_eventManager->dispatch('model_delete_before', ['object' => $this]);
```

* Event name: _delete_before
* File: vendor/magento/framework/Model/AbstractModel.php
```
    $this->_eventManager->dispatch($this->_eventPrefix . '_delete_before', $this->_getEventData());
```

* Event name: model_delete_after
* File: vendor/magento/framework/Model/AbstractModel.php
```
    $this->_eventManager->dispatch('model_delete_after', ['object' => $this]);
```

* Event name: clean_cache_by_tags
* File: vendor/magento/framework/Model/AbstractModel.php
```
    $this->_eventManager->dispatch('clean_cache_by_tags', ['object' => $this]);
```

* Event name: _delete_after
* File: vendor/magento/framework/Model/AbstractModel.php
```
    $this->_eventManager->dispatch($this->_eventPrefix . '_delete_after', $this->_getEventData());
```

* Event name: model_delete_commit_after
* File: vendor/magento/framework/Model/AbstractModel.php
```
    $this->_eventManager->dispatch('model_delete_commit_after', ['object' => $this]);
```

* Event name: _delete_commit_after
* File: vendor/magento/framework/Model/AbstractModel.php
```
    $this->_eventManager->dispatch($this->_eventPrefix . '_delete_commit_after', $this->_getEventData());
```

* Event name: _clear
* File: vendor/magento/framework/Model/AbstractModel.php
```
    $this->_eventManager->dispatch($this->_eventPrefix . '_clear', $this->_getEventData());
```

* Event name: _clear
* File: vendor/magento/framework/Model/AbstractModel.php
```
    $this->_eventManager->dispatch($this->_eventPrefix . '_clear', $this->_getEventData());
```

* Event name: core_collection_abstract_load_before
* File: vendor/magento/framework/Model/ResourceModel/Db/Collection/AbstractCollection.php
```
    $this->_eventManager->dispatch('core_collection_abstract_load_before', ['collection' => $this]);
```

* Event name: _load_before
* File: vendor/magento/framework/Model/ResourceModel/Db/Collection/AbstractCollection.php
```
    $this->_eventManager->dispatch($this->_eventPrefix . '_load_before', [$this->_eventObject => $this]);
```

* Event name: core_collection_abstract_load_after
* File: vendor/magento/framework/Model/ResourceModel/Db/Collection/AbstractCollection.php
```
    $this->_eventManager->dispatch('core_collection_abstract_load_after', ['collection' => $this]);
```

* Event name: _load_after
* File: vendor/magento/framework/Model/ResourceModel/Db/Collection/AbstractCollection.php
```
    $this->_eventManager->dispatch($this->_eventPrefix . '_load_after', [$this->_eventObject => $this]);
```

* Event name: core_layout_render_element
* File: vendor/magento/framework/View/Layout.php
```
    $this->_eventManager->dispatch(
            'core_layout_render_element',
            ['element_name' => $name, 'layout' => $this, 'transport' => $this->_renderingOutput]
        );
```

* Event name: view_block_abstract_to_html_before
* File: vendor/magento/framework/View/Element/AbstractBlock.php
```
    $this->_eventManager->dispatch('view_block_abstract_to_html_before', ['block' => $this]);
```

* Event name: view_message_block_render_grouped_html_after
* File: vendor/magento/framework/View/Element/Messages.php
```
    $this->_eventManager->dispatch('view_message_block_render_grouped_html_after', $params);
```

* Event name: adminhtml_block_html_before
* File: vendor/magento/module-backend/Block/Template.php
```
    $this->_eventManager->dispatch('adminhtml_block_html_before', ['block' => $this]);
```

* Event name: adminhtml_store_edit_form_prepare_form
* File: vendor/magento/module-backend/Block/System/Store/Edit/AbstractForm.php
```
    $this->_eventManager->dispatch('adminhtml_store_edit_form_prepare_form', ['block' => $this]);
```

* Event name: backend_block_widget_grid_prepare_grid_before
* File: vendor/magento/module-backend/Block/Widget/Grid.php
```
    $this->_eventManager->dispatch(
            'backend_block_widget_grid_prepare_grid_before',
            ['grid' => $this, 'collection' => $this->getCollection()]
        );
```

* Event name: clean_catalog_images_cache_after
* File: vendor/magento/module-backend/Controller/Adminhtml/Cache/CleanImages.php
```
    $this->_eventManager->dispatch('clean_catalog_images_cache_after');
```

* Event name: clean_media_cache_after
* File: vendor/magento/module-backend/Controller/Adminhtml/Cache/CleanMedia.php
```
    $this->_eventManager->dispatch('clean_media_cache_after');
```

* Event name: clean_static_files_cache_after
* File: vendor/magento/module-backend/Controller/Adminhtml/Cache/CleanStaticFiles.php
```
    $this->_eventManager->dispatch('clean_static_files_cache_after');
```

* Event name: adminhtml_cache_flush_all
* File: vendor/magento/module-backend/Controller/Adminhtml/Cache/FlushAll.php
```
    $this->_eventManager->dispatch('adminhtml_cache_flush_all');
```

* Event name: adminhtml_cache_flush_system
* File: vendor/magento/module-backend/Controller/Adminhtml/Cache/FlushSystem.php
```
    $this->_eventManager->dispatch('adminhtml_cache_flush_system');
```

* Event name: theme_save_after
* File: vendor/magento/module-backend/Controller/Adminhtml/System/Design/Save.php
```
    $this->_eventManager->dispatch('theme_save_after');
```

* Event name: store_delete
* File: vendor/magento/module-backend/Controller/Adminhtml/System/Store/DeleteStorePost.php
```
    $this->_eventManager->dispatch('store_delete', ['store' => $model]);
```

* Event name: store_group_save
* File: vendor/magento/module-backend/Controller/Adminhtml/System/Store/Save.php
```
    $this->_eventManager->dispatch('store_group_save', ['group' => $groupModel]);
```

* Event name: store_edit
* File: vendor/magento/module-backend/Controller/Adminhtml/System/Store/Save.php
	$eventName = 'store_edit';
	$this->_eventManager->dispatch($eventName, ['store' => $storeModel]);
```

* Event name: store_add
* File: vendor/magento/module-backend/Controller/Adminhtml/System/Store/Save.php
	$eventName = 'store_add';
	$this->_eventManager->dispatch($eventName, ['store' => $storeModel]);
```

* Event name: backend_auth_user_login_success
* File: vendor/magento/module-backend/Model/Auth.php
```
    $this->_eventManager->dispatch(
	    'backend_auth_user_login_success',
	    ['user' => $this->getCredentialStorage()]
	);
```

* Event name: backend_auth_user_login_failed
* File: vendor/magento/module-backend/Model/Auth.php
```
    $this->_eventManager->dispatch(
		'backend_auth_user_login_failed',
		['user_name' => $username, 'exception' => $e]
	);
```

* Event name: catalog_product_option_price_configuration_after
* File: vendor/magento/module-bundle/Block/Catalog/Product/View/Type/Bundle.php
```
    $this->_eventManager->dispatch('catalog_product_option_price_configuration_after', ['configObj' => $configObj]);
```

* Event name: prepare_catalog_product_collection_prices
* File: vendor/magento/module-bundle/Model/Product/Price.php
```
    $this->_eventManager->dispatch(
		'prepare_catalog_product_collection_prices',
		['collection' => $selections, 'store_id' => $product->getStoreId()]
	);
```

* Event name: catalog_product_get_final_price
* File: vendor/magento/module-bundle/Model/Product/Price.php
```
    $this->_eventManager->dispatch('catalog_product_get_final_price', ['product' => $product, 'qty' => $qty]);
```

* Event name: catalog_product_prepare_index_select
* File: vendor/magento/module-bundle/Model/ResourceModel/Indexer/Price.php

        $this->_eventManager->dispatch(
            'catalog_product_prepare_index_select',
            [
                'select' => $select,
                'entity_field' => new \Zend_Db_Expr('e.entity_id'),
                'website_field' => new \Zend_Db_Expr('cw.website_id'),
                'store_field' => new \Zend_Db_Expr('cs.store_id')
            ]
        );
```

* Event name: catalog_product_import_bunch_delete_commit_before
* File: vendor/magento/module-catalog-import-export/Model/Import/Product.php
```
    $this->_eventManager->dispatch(
	'catalog_product_import_bunch_delete_commit_before',
		[
		    'adapter' => $this,
		    'bunch' => $bunch,
		    'ids_to_delete' => $idsToDelete
		]
	);
```

* Event name: catalog_product_import_bunch_delete_after
* File: vendor/magento/module-catalog-import-export/Model/Import/Product.php
```
    $this->_eventManager->dispatch('catalog_product_import_bunch_delete_after', ['adapter' => $this, 'bunch' => $bunch]);
```

* Event name: catalog_product_import_finish_before
* File: vendor/magento/module-catalog-import-export/Model/Import/Product.php
```
    $this->_eventManager->dispatch('catalog_product_import_finish_before', ['adapter' => $this]);
```

* Event name: catalog_product_import_bunch_save_after
* File: vendor/magento/module-catalog-import-export/Model/Import/Product.php
```
    $this->_eventManager->dispatch(
		'catalog_product_import_bunch_save_after',
		['adapter' => $this, 'bunch' => $bunch]
	);
```

* Event name: catalogrule_dirty_notice
* File: vendor/magento/module-catalog-rule/Controller/Adminhtml/Promo/Catalog/Index.php

        $this->_eventManager->dispatch(
            'catalogrule_dirty_notice',
            ['dirty_rules' => $dirtyRules, 'message' => $this->getDirtyRulesNoticeMessage()]
        );
```

* Event name: adminhtml_controller_catalogrule_prepare_save
* File: vendor/magento/module-catalog-rule/Controller/Adminhtml/Promo/Catalog/Save.php
```
    $this->_eventManager->dispatch(
	    'adminhtml_controller_catalogrule_prepare_save',
	    ['request' => $this->getRequest()]
	);
```

* Event name: clean_cache_by_tags
* File: vendor/magento/module-catalog-rule/Model/Indexer/AbstractIndexer.php
```
    $this->_eventManager->dispatch('clean_cache_by_tags', ['object' => $this]);
```

* Event name: catalogsearch_reset_search_result
* File: vendor/magento/module-catalog-search/Model/ResourceModel/Fulltext.php
```
    $this->_eventManager->dispatch('catalogsearch_reset_search_result');
```

* Event name: shortcut_buttons_container
* File: vendor/magento/module-catalog/Block/ShortcutButtons.php

        $this->_eventManager->dispatch(
            'shortcut_buttons_container',
            [
                'container' => $this,
                'is_catalog_product' => $this->_isCatalogProduct,
                'or_position' => $this->_orPosition
            ]
        );
```

* Event name: adminhtml_catalog_category_tree_is_moveable
* File: vendor/magento/module-catalog/Block/Adminhtml/Category/Tree.php
```
    $this->_eventManager->dispatch('adminhtml_catalog_category_tree_is_moveable', ['options' => $options]);
```

* Event name: adminhtml_catalog_category_tree_can_add_root_category
* File: vendor/magento/module-catalog/Block/Adminhtml/Category/Tree.php
```
    $this->_eventManager->dispatch(
            'adminhtml_catalog_category_tree_can_add_root_category',
            ['category' => $this->getCategory(), 'options' => $options, 'store' => $this->getStore()->getId()]
        );
```

* Event name: adminhtml_catalog_category_tree_can_add_sub_category
* File: vendor/magento/module-catalog/Block/Adminhtml/Category/Tree.php

        $this->_eventManager->dispatch(
            'adminhtml_catalog_category_tree_can_add_sub_category',
            ['category' => $this->getCategory(), 'options' => $options, 'store' => $this->getStore()->getId()]
        );
```

* Event name: adminhtml_catalog_product_grid_prepare_massaction
* File: vendor/magento/module-catalog/Block/Adminhtml/Product/Grid.php
```
    $this->_eventManager->dispatch('adminhtml_catalog_product_grid_prepare_massaction', ['block' => $this]);
```

* Event name: product_attribute_grid_build
* File: vendor/magento/module-catalog/Block/Adminhtml/Product/Attribute/Grid.php
```
    $this->_eventManager->dispatch('product_attribute_grid_build', ['grid' => $this]);
```

* Event name: product_attribute_form_build
* File: vendor/magento/module-catalog/Block/Adminhtml/Product/Attribute/Edit/Tab/Advanced.php
```
    $this->_eventManager->dispatch('product_attribute_form_build', ['form' => $form]);
```

* Event name: product_attribute_form_build_front_tab
* File: vendor/magento/module-catalog/Block/Adminhtml/Product/Attribute/Edit/Tab/Front.php
```
    $this->_eventManager->dispatch('product_attribute_form_build_front_tab', ['form' => $form]);
```

* Event name: adminhtml_catalog_product_attribute_edit_frontend_prepare_form
* File: vendor/magento/module-catalog/Block/Adminhtml/Product/Attribute/Edit/Tab/Front.php

        $this->_eventManager->dispatch(
            'adminhtml_catalog_product_attribute_edit_frontend_prepare_form',
            ['form' => $form, 'attribute' => $attributeObject]
        );
```

* Event name: adminhtml_product_attribute_types
* File: vendor/magento/module-catalog/Block/Adminhtml/Product/Attribute/Edit/Tab/Main.php
```
    $this->_eventManager->dispatch('adminhtml_product_attribute_types', ['response' => $response]);
```

* Event name: product_attribute_form_build_main_tab
* File: vendor/magento/module-catalog/Block/Adminhtml/Product/Attribute/Edit/Tab/Main.php
```
    $this->_eventManager->dispatch('product_attribute_form_build_main_tab', ['form' => $form]);
```

* Event name: adminhtml_catalog_product_edit_prepare_form
* File: vendor/magento/module-catalog/Block/Adminhtml/Product/Attribute/NewAttribute/Product/Attributes.php
```
    $this->_eventManager->dispatch('adminhtml_catalog_product_edit_prepare_form', ['form' => $form]);
```

* Event name: adminhtml_catalog_product_edit_element_types
* File: vendor/magento/module-catalog/Block/Adminhtml/Product/Attribute/NewAttribute/Product/Attributes.php
```
    $this->_eventManager->dispatch('adminhtml_catalog_product_edit_element_types', ['response' => $response]);
```

* Event name: adminhtml_catalog_product_attribute_set_main_html_before
* File: vendor/magento/module-catalog/Block/Adminhtml/Product/Attribute/Set/Main.php

        $this->_eventManager->dispatch(
            'adminhtml_catalog_product_attribute_set_main_html_before',
            ['block' => $this]
        );
```

* Event name: adminhtml_catalog_product_attribute_set_toolbar_main_html_before
* File: vendor/magento/module-catalog/Block/Adminhtml/Product/Attribute/Set/Toolbar/Main.php

        $this->_eventManager->dispatch(
            'adminhtml_catalog_product_attribute_set_toolbar_main_html_before',
            ['block' => $this]
        );
```

* Event name: adminhtml_catalog_product_form_prepare_excluded_field_list
* File: vendor/magento/module-catalog/Block/Adminhtml/Product/Edit/Action/Attribute/Tab/Attributes.php
```
    $this->_eventManager->dispatch(
	    'adminhtml_catalog_product_form_prepare_excluded_field_list',
	    ['object' => $this]
	);
```

* Event name: adminhtml_catalog_product_edit_prepare_form
* File: vendor/magento/module-catalog/Block/Adminhtml/Product/Edit/Tab/Attributes.php
```
    $this->_eventManager->dispatch(
		'adminhtml_catalog_product_edit_prepare_form',
		['form' => $form, 'layout' => $this->getLayout()]
	);
```

* Event name: adminhtml_catalog_product_edit_element_types
* File: vendor/magento/module-catalog/Block/Adminhtml/Product/Edit/Tab/Attributes.php

 	$this->_eventManager->dispatch('adminhtml_catalog_product_edit_element_types', ['response' => $response]);
```

* Event name: catalog_product_gallery_prepare_layout
* File: vendor/magento/module-catalog/Block/Adminhtml/Product/Helper/Form/Gallery/Content.php
```
    $this->_eventManager->dispatch('catalog_product_gallery_prepare_layout', ['block' => $this]);
```

* Event name: catalog_block_product_status_display
* File: vendor/magento/module-catalog/Block/Product/AbstractProduct.php
```
    $this->_eventManager->dispatch('catalog_block_product_status_display', ['status' => $statusInfo]);
```

* Event name: catalog_block_product_list_collection
* File: vendor/magento/module-catalog/Block/Product/ListProduct.php

        $this->_eventManager->dispatch(
            'catalog_block_product_list_collection',
            ['collection' => $this->_getProductCollection()]
        );
```

* Event name: catalog_product_view_config
* File: vendor/magento/module-catalog/Block/Product/View.php
```
    $this->_eventManager->dispatch('catalog_product_view_config', ['response_object' => $responseObject]);
```

* Event name: catalog_product_upsell
* File: vendor/magento/module-catalog/Block/Product/ProductList/Upsell.php

        $this->_eventManager->dispatch(
            'catalog_product_upsell',
            ['product' => $product, 'collection' => $this->_itemCollection, 'limit' => null]
        );
```

* Event name: catalog_product_option_price_configuration_after
* File: vendor/magento/module-catalog/Block/Product/View/Options.php
```
    $this->_eventManager->dispatch('catalog_product_option_price_configuration_after', ['configObj' => $configObj]);
```

* Event name: rss_catalog_category_xml_callback
* File: vendor/magento/module-catalog/Block/Rss/Category.php
```
    $this->_eventManager->dispatch('rss_catalog_category_xml_callback', ['product' => $product]);
```

* Event name: rss_catalog_new_xml_callback
* File: vendor/magento/module-catalog/Block/Rss/Product/NewProducts.php
```
    $this->_eventManager->dispatch('rss_catalog_new_xml_callback', [
		'row' => $item->getData(),
		'product' => $item
	]);
```

* Event name: rss_catalog_special_xml_callback
* File: vendor/magento/module-catalog/Block/Rss/Product/Special.php
```
    $this->_eventManager->dispatch('rss_catalog_special_xml_callback', [
		'row' => $item->getData(),
		'product' => $item
	]);
```

* Event name: category_prepare_ajax_response
* File: vendor/magento/module-catalog/Controller/Adminhtml/Category.php

        $this->_eventManager->dispatch(
            'category_prepare_ajax_response',
            ['response' => $eventResponse, 'controller' => $this]
        );
```

* Event name: catalog_controller_category_delete
* File: vendor/magento/module-catalog/Controller/Adminhtml/Category/Delete.php

$this->_eventManager->dispatch('catalog_controller_category_delete', ['category' => $category]);
```

* Event name: catalog_category_prepare_save
* File: vendor/magento/module-catalog/Controller/Adminhtml/Category/Save.php
```
    $this->_eventManager->dispatch(
		'catalog_category_prepare_save',
		['category' => $category, 'request' => $this->getRequest()]
	);
```

* Event name: catalog_product_edit_action
* File: vendor/magento/module-catalog/Controller/Adminhtml/Product/Edit.php
```
    $this->_eventManager->dispatch('catalog_product_edit_action', ['product' => $product]);
```

* Event name: catalog_product_new_action
* File: vendor/magento/module-catalog/Controller/Adminhtml/Product/NewAction.php
```
    $this->_eventManager->dispatch('catalog_product_new_action', ['product' => $product]);
```

* Event name: controller_action_catalog_product_save_entity_after
* File: vendor/magento/module-catalog/Controller/Adminhtml/Product/Save.php
```
    $this->_eventManager->dispatch(
		'controller_action_catalog_product_save_entity_after',
		['controller' => $this, 'product' => $product]
	);
```

* Event name: catalog_product_to_website_change
* File: vendor/magento/module-catalog/Controller/Adminhtml/Product/Action/Attribute/Save.php
```
    $this->_eventManager->dispatch('catalog_product_to_website_change', ['products' => $productIds]);
```

* Event name: catalog_controller_category_init_after
* File: vendor/magento/module-catalog/Controller/Category/View.php
```
    $this->_eventManager->dispatch(
		'catalog_controller_category_init_after',
		['category' => $category, 'controller_action' => $this]
	);
```

* Event name: catalog_product_compare_add_product
* File: vendor/magento/module-catalog/Controller/Product/Compare/Add.php
```
    $this->_eventManager->dispatch('catalog_product_compare_add_product', ['product' => $product]);
```

* Event name: catalog_product_compare_remove_product
* File: vendor/magento/module-catalog/Controller/Product/Compare/Remove.php
```
    $this->_eventManager->dispatch(
		'catalog_product_compare_remove_product',
		['product' => $item]
	);
```

* Event name: catalog_controller_product_init_before
* File: vendor/magento/module-catalog/Helper/Product.php

        $this->_eventManager->dispatch(
            'catalog_controller_product_init_before',
            ['controller_action' => $controller, 'params' => $params]
        );
```

* Event name: catalog_controller_product_init_after
* File: vendor/magento/module-catalog/Helper/Product.php
```
    $this->_eventManager->dispatch(
		'catalog_controller_product_init_after',
		['product' => $product, 'controller_action' => $controller]
	);
```

* Event name: catalog_controller_product_view
* File: vendor/magento/module-catalog/Helper/Product/View.php
```
    $this->_eventManager->dispatch('catalog_controller_product_view', ['product' => $product]);
```

* Event name: _move_before
* File: vendor/magento/module-catalog/Model/Category.php
```
    $this->_eventManager->dispatch($this->_eventPrefix . '_move_before', $eventParams);
```

* Event name: _move_after
* File: vendor/magento/module-catalog/Model/Category.php
```
    $this->_eventManager->dispatch($this->_eventPrefix . '_move_after', $eventParams);
```

* Event name: category_move
* File: vendor/magento/module-catalog/Model/Category.php
```
    $this->_eventManager->dispatch($this->_eventPrefix . 'category_move', $eventParams);
```

* Event name: clean_cache_by_tags
* File: vendor/magento/module-catalog/Model/Category.php
```
    $this->_eventManager->dispatch('clean_cache_by_tags', ['object' => $this]);
```

* Event name: _validate_before
* File: vendor/magento/module-catalog/Model/Product.php
```
    $this->_eventManager->dispatch($this->_eventPrefix . '_validate_before', $this->_getEventData());
```

* Event name: _validate_after
* File: vendor/magento/module-catalog/Model/Product.php
```
    $this->_eventManager->dispatch($this->_eventPrefix . '_validate_after', $this->_getEventData());
```

* Event name: catalog_product_is_salable_before
* File: vendor/magento/module-catalog/Model/Product.php
```
    $this->_eventManager->dispatch('catalog_product_is_salable_before', ['product' => $this]);
```

* Event name: catalog_product_is_salable_after
* File: vendor/magento/module-catalog/Model/Product.php

        $this->_eventManager->dispatch(
            'catalog_product_is_salable_after',
            ['product' => $this, 'salable' => $object]
        );
```

* Event name: catalog_product_attribute_update_before
* File: vendor/magento/module-catalog/Model/Product/Action.php

        $this->_eventManager->dispatch(
            'catalog_product_attribute_update_before',
            ['attributes_data' => &$attrData, 'product_ids' => &$productIds, 'store_id' => &$storeId]
        );
```

* Event name: adminhtml_product_attribute_types
* File: vendor/magento/module-catalog/Model/Product/Attribute/Source/Inputtype.php
```
    $this->_eventManager->dispatch('adminhtml_product_attribute_types', ['response' => $response]);
```

* Event name: catalog_product_type_prepare_%s_options
* File: vendor/magento/module-catalog/Model/Product/Type/AbstractType.php

        $eventName = sprintf('catalog_product_type_prepare_%s_options', $processMode);
```
  $this->_eventManager->dispatch(
            $eventName,
            ['transport' => $transport, 'buy_request' => $buyRequest, 'product' => $product]
        );
```

* Event name: catalog_product_get_final_price
* File: vendor/magento/module-catalog/Model/Product/Type/Price.php
```
    $this->_eventManager->dispatch('catalog_product_get_final_price', ['product' => $product, 'qty' => $qty]);
```

* Event name: catalog_category_change_products
* File: vendor/magento/module-catalog/Model/ResourceModel/Category.php
```
    $this->_eventManager->dispatch(
		'catalog_category_change_products',
		['category' => $category, 'product_ids' => $productIds]
	);
```

* Event name: catalog_category_delete_after_done
* File: vendor/magento/module-catalog/Model/ResourceModel/Category.php

        $this->_eventManager->dispatch(
            'catalog_category_delete_after_done',
            ['product' => $object]
        );
```

* Event name: _load_before
* File: vendor/magento/module-catalog/Model/ResourceModel/Category/Collection.php
```
    $this->_eventManager->dispatch($this->_eventPrefix . '_load_before', [$this->_eventObject => $this]);
```

* Event name: _load_after
* File: vendor/magento/module-catalog/Model/ResourceModel/Category/Collection.php
```
    $this->_eventManager->dispatch($this->_eventPrefix . '_load_after', [$this->_eventObject => $this]);
```

* Event name: _add_is_active_filter
* File: vendor/magento/module-catalog/Model/ResourceModel/Category/Collection.php

        $this->_eventManager->dispatch(
            $this->_eventPrefix . '_add_is_active_filter',
            [$this->_eventObject => $this]
        );
```

* Event name: catalog_category_tree_init_inactive_category_ids
* File: vendor/magento/module-catalog/Model/ResourceModel/Category/Flat.php
```
    $this->_eventManager->dispatch('catalog_category_tree_init_inactive_category_ids', ['tree' => $this]);
```

* Event name: catalog_category_flat_loadnodes_before
* File: vendor/magento/module-catalog/Model/ResourceModel/Category/Flat.php
```
    $this->_eventManager->dispatch('catalog_category_flat_loadnodes_before', ['select' => $select]);
```

* Event name: catalog_category_tree_init_inactive_category_ids
* File: vendor/magento/module-catalog/Model/ResourceModel/Category/Tree.php
```
    $this->_eventManager->dispatch('catalog_category_tree_init_inactive_category_ids', ['tree' => $this]);
```

* Event name: _load_before
* File: vendor/magento/module-catalog/Model/ResourceModel/Category/Flat/Collection.php
```
    $this->_eventManager->dispatch($this->_eventPrefix . '_load_before', [$this->_eventObject => $this]);
```

* Event name: _load_after
* File: vendor/magento/module-catalog/Model/ResourceModel/Category/Flat/Collection.php
```
    $this->_eventManager->dispatch($this->_eventPrefix . '_load_after', [$this->_eventObject => $this]);
```

* Event name: _add_is_active_filter
* File: vendor/magento/module-catalog/Model/ResourceModel/Category/Flat/Collection.php

        $this->_eventManager->dispatch(
            $this->_eventPrefix . '_add_is_active_filter',
            [$this->_eventObject => $this]
        );
```

* Event name: catalog_prepare_price_select
* File: vendor/magento/module-catalog/Model/ResourceModel/Product/Collection.php
```
    $this->_eventManager->dispatch('catalog_prepare_price_select', $eventArgs);
```

* Event name: catalog_product_collection_load_after
* File: vendor/magento/module-catalog/Model/ResourceModel/Product/Collection.php
```
    $this->_eventManager->dispatch('catalog_product_collection_load_after', ['collection' => $this]);
```

* Event name: catalog_product_collection_before_add_count_to_categories
* File: vendor/magento/module-catalog/Model/ResourceModel/Product/Collection.php
```
    $this->_eventManager->dispatch(
		'catalog_product_collection_before_add_count_to_categories',
		['collection' => $this]
	);
```

* Event name: catalog_product_collection_apply_limitations_after
* File: vendor/magento/module-catalog/Model/ResourceModel/Product/Collection.php

        $this->_eventManager->dispatch(
            'catalog_product_collection_apply_limitations_after',
            ['collection' => $this]
        );
* Event name: catalog_product_compare_item_collection_clear
* File: vendor/magento/module-catalog/Model/ResourceModel/Product/Compare/Item/Collection.php
```
    $this->_eventManager->dispatch('catalog_product_compare_item_collection_clear');
* Event name: prepare_catalog_product_index_select
* File: vendor/magento/module-catalog/Model/ResourceModel/Product/Indexer/Eav/AbstractEav.php

        $this->_eventManager->dispatch(
            'prepare_catalog_product_index_select',
            [
                'select' => $select,
                'entity_field' => new \Zend_Db_Expr('l.parent_id'),
                'website_field' => new \Zend_Db_Expr('cs.website_id'),
                'store_field' => new \Zend_Db_Expr('cs.store_id')
            ]
        );
* Event name: prepare_catalog_product_index_select
* File: vendor/magento/module-catalog/Model/ResourceModel/Product/Indexer/Eav/Decimal.php

        $this->_eventManager->dispatch(
            'prepare_catalog_product_index_select',
            [
                'select' => $select,
                'entity_field' => new \Zend_Db_Expr('cpe.entity_id'),
                'website_field' => new \Zend_Db_Expr('cs.website_id'),
                'store_field' => new \Zend_Db_Expr('cs.store_id')
            ]
        );
```

* Event name: prepare_catalog_product_index_select
* File: vendor/magento/module-catalog/Model/ResourceModel/Product/Indexer/Eav/Source.php

        $this->_eventManager->dispatch(
            'prepare_catalog_product_index_select',
            [
                'select' => $select,
                'entity_field' => new \Zend_Db_Expr('pid.entity_id'),
                'website_field' => new \Zend_Db_Expr('pid.website_id'),
                'store_field' => new \Zend_Db_Expr('pid.store_id')
            ]
        );
```

* Event name: prepare_catalog_product_index_select
* File: vendor/magento/module-catalog/Model/ResourceModel/Product/Indexer/Eav/Source.php

        $this->_eventManager->dispatch(
            'prepare_catalog_product_index_select',
            [
                'select' => $select,
                'entity_field' => new \Zend_Db_Expr('cpe.entity_id'),
                'website_field' => new \Zend_Db_Expr('cs.website_id'),
                'store_field' => new \Zend_Db_Expr('cs.store_id')
            ]
        );
```

* Event name: prepare_catalog_product_index_select
* File: vendor/magento/module-catalog/Model/ResourceModel/Product/Indexer/Price/DefaultPrice.php

        $this->_eventManager->dispatch(
            'prepare_catalog_product_index_select',
            [
                'select' => $select,
                'entity_field' => new \Zend_Db_Expr('e.entity_id'),
                'website_field' => new \Zend_Db_Expr('cw.website_id'),
                'store_field' => new \Zend_Db_Expr('cs.store_id')
            ]
        );
```

* Event name: shortcut_buttons_container
* File: vendor/magento/module-checkout/Block/QuoteShortcutButtons.php

        $this->_eventManager->dispatch(
            'shortcut_buttons_container',
            [
                'container' => $this,
                'is_catalog_product' => $this->_isCatalogProduct,
                'or_position' => $this->_orPosition,
                'checkout_session' => $this->_checkoutSession
            ]
        );
```

* Event name: checkout_cart_add_product_complete
* File: vendor/magento/module-checkout/Controller/Cart/Add.php

            $this->_eventManager->dispatch(
                'checkout_cart_add_product_complete',
                ['product' => $product, 'request' => $this->getRequest(), 'response' => $this->getResponse()]
            );
```

* Event name: checkout_cart_update_item_complete
* File: vendor/magento/module-checkout/Controller/Cart/UpdateItemOptions.php

            $this->_eventManager->dispatch(
                'checkout_cart_update_item_complete',
                ['item' => $item, 'request' => $this->getRequest(), 'response' => $this->getResponse()]
            );
```

* Event name: checkout_controller_onepage_saveOrder
* File: vendor/magento/module-checkout/Controller/Onepage/SaveOrder.php
```
    $this->_eventManager->dispatch(
		'checkout_controller_onepage_saveOrder',
		[
			'result' => $result,
			'action' => $this
		]
	);
```

* Event name: checkout_onepage_controller_success_action
* File: vendor/magento/module-checkout/Controller/Onepage/Success.php
```
    $this->_eventManager->dispatch(
		'checkout_onepage_controller_success_action',
		['order_ids' => [$session->getLastOrderId()]]
	);
```

* Event name: checkout_allow_guest
* File: vendor/magento/module-checkout/Helper/Data.php
```
    $this->_eventManager->dispatch(
		'checkout_allow_guest',
		['quote' => $quote, 'store' => $store, 'result' => $result]
	);
```

* Event name: checkout_cart_product_add_after
* File: vendor/magento/module-checkout/Model/Cart.php
```
    $this->_eventManager->dispatch(
		'checkout_cart_product_add_after',
		['quote_item' => $result, 'product' => $product]
	);
```

* Event name: checkout_cart_update_items_before
* File: vendor/magento/module-checkout/Model/Cart.php
```
    $this->_eventManager->dispatch(
		'checkout_cart_update_items_before',
		['cart' => $this, 'info' => $infoDataObject]
	);
```

* Event name: checkout_cart_update_items_after
* File: vendor/magento/module-checkout/Model/Cart.php
```
    $this->_eventManager->dispatch(
		'checkout_cart_update_items_after',
		['cart' => $this, 'info' => $infoDataObject]
	);
```

* Event name: checkout_cart_save_before
* File: vendor/magento/module-checkout/Model/Cart.php
```
    $this->_eventManager->dispatch('checkout_cart_save_before', ['cart' => $this]);
```

* Event name: checkout_cart_save_after
* File: vendor/magento/module-checkout/Model/Cart.php
```
    $this->_eventManager->dispatch('checkout_cart_save_after', ['cart' => $this]);
```

* Event name: checkout_cart_product_update_after
* File: vendor/magento/module-checkout/Model/Cart.php
```
    $this->_eventManager->dispatch(
		'checkout_cart_product_update_after',
		['quote_item' => $result, 'product' => $product]
	);
```

* Event name: custom_quote_process
* File: vendor/magento/module-checkout/Model/Session.php
```
    $this->_eventManager->dispatch('custom_quote_process', ['checkout_session' => $this]);
```

* Event name: checkout_quote_init
* File: vendor/magento/module-checkout/Model/Session.php
```
    $this->_eventManager->dispatch('checkout_quote_init', ['quote' => $quote]);
```

* Event name: load_customer_quote_before
* File: vendor/magento/module-checkout/Model/Session.php
```
    $this->_eventManager->dispatch('load_customer_quote_before', ['checkout_session' => $this]);
```

* Event name: checkout_quote_destroy
* File: vendor/magento/module-checkout/Model/Session.php
```
    $this->_eventManager->dispatch('checkout_quote_destroy', ['quote' => $this->getQuote()]);
```

* Event name: restore_quote
* File: vendor/magento/module-checkout/Model/Session.php
```
    $this->_eventManager->dispatch('restore_quote', ['order' => $order, 'quote' => $quote]);
```

* Event name: checkout_type_onepage_save_order_after
* File: vendor/magento/module-checkout/Model/Type/Onepage.php
```
    $this->_eventManager->dispatch(
		'checkout_type_onepage_save_order_after',
		['order' => $order, 'quote' => $this->getQuote()]
	);
```

* Event name: checkout_submit_all_after
* File: vendor/magento/module-checkout/Model/Type/Onepage.php
```
    $this->_eventManager->dispatch(
		'checkout_submit_all_after',
		[
			'order' => $order,
			'quote' => $this->getQuote()
		]
	);
```

* Event name: cms_controller_router_match_before
* File: vendor/magento/module-cms/Controller/Router.php
```
    $this->_eventManager->dispatch(
		'cms_controller_router_match_before',
		['router' => $this, 'condition' => $condition]
	);
```

* Event name: adminhtml_cmspage_on_delete
* File: vendor/magento/module-cms/Controller/Adminhtml/Page/Delete.php
```
    $this->_eventManager->dispatch(
		'adminhtml_cmspage_on_delete',
		['title' => $title, 'status' => 'success']
	);
```

* Event name: adminhtml_cmspage_on_delete
* File: vendor/magento/module-cms/Controller/Adminhtml/Page/Delete.php
```
    $this->_eventManager->dispatch(
		'adminhtml_cmspage_on_delete',
		['title' => $title, 'status' => 'fail']
	);
```

* Event name: cms_page_prepare_save
* File: vendor/magento/module-cms/Controller/Adminhtml/Page/Save.php
```
    $this->_eventManager->dispatch(
		'cms_page_prepare_save',
		['page' => $model, 'request' => $this->getRequest()]
	);
```

* Event name: cms_page_render
* File: vendor/magento/module-cms/Helper/Page.php
```
    $this->_eventManager->dispatch(
		'cms_page_render',
		['page' => $this->_page, 'controller_action' => $action]
	);
```

* Event name: cms_wysiwyg_images_static_urls_allowed
* File: vendor/magento/module-cms/Helper/Wysiwyg/Images.php
```
    $this->_eventManager->dispatch(
		'cms_wysiwyg_images_static_urls_allowed',
		['result' => $checkResult, 'store_id' => $this->_storeId]
	);
```

* Event name: adminhtml_system_config_advanced_disableoutput_render_before
* File: vendor/magento/module-config/Block/System/Config/Form/Fieldset/Modules/DisableOutput.php
```
    $this->_eventManager->dispatch(
		'adminhtml_system_config_advanced_disableoutput_render_before',
		['modules' => $dispatchResult]
	);
```

* Event name: admin_system_config_changed_section_
* File: vendor/magento/module-config/Model/Config.php
```
    $this->_eventManager->dispatch(
		"admin_system_config_changed_section_{$this->getSection()}",
		['website' => $this->getWebsite(), 'store' => $this->getStore()]
	);
```

* Event name: controller_action_nocookies
* File: vendor/magento/module-cookie/Controller/Index/NoCookies.php
```
    $this->_eventManager->dispatch(
		'controller_action_nocookies',
		['action' => $this, 'redirect' => $redirect]
	);
```

* Event name: admin_system_config_changed_section_currency_before_reinit
* File: vendor/magento/module-currency-symbol/Model/System/Currencysymbol.php
```
    $this->_eventManager->dispatch(
		'admin_system_config_changed_section_currency_before_reinit',
		['website' => $this->_websiteId, 'store' => $this->_storeId]
	);
```

* Event name: adminhtml_block_html_before
* File: vendor/magento/module-customer/Block/Adminhtml/Edit/Tab/Carts.php
```
    $this->_eventManager->dispatch('adminhtml_block_html_before', ['block' => $this]);
```

* Event name: customer_register_success
* File: vendor/magento/module-customer/Controller/Account/CreatePost.php
```
    $this->_eventManager->dispatch(
		'customer_register_success',
		['account_controller' => $this, 'customer' => $customer]
	);
```

* Event name: customer_account_edited
* File: vendor/magento/module-customer/Controller/Account/EditPost.php
```
    $this->_eventManager->dispatch(
		'customer_account_edited',
		['email' => $customerCandidateDataObject->getEmail()]
	);
```

* Event name: adminhtml_customer_prepare_save
* File: vendor/magento/module-customer/Controller/Adminhtml/Index/Save.php
```
    $this->_eventManager->dispatch(
		'adminhtml_customer_prepare_save',
		['customer' => $customer, 'request' => $this->getRequest()]
	);
```

* Event name: adminhtml_customer_save_after
* File: vendor/magento/module-customer/Controller/Adminhtml/Index/Save.php
```
    $this->_eventManager->dispatch(
		'adminhtml_customer_save_after',
		['customer' => $customer, 'request' => $this->getRequest()]
	);
```

* Event name: customer_customer_authenticated
* File: vendor/magento/module-customer/Model/Customer.php
```
    $this->_eventManager->dispatch(
		'customer_customer_authenticated',
		['model' => $this, 'password' => $password]
	);
```

* Event name: customer_session_init
* File: vendor/magento/module-customer/Model/Session.php
```
    $this->_eventManager->dispatch('customer_session_init', ['customer_session' => $this]);
```

* Event name: customer_login
* File: vendor/magento/module-customer/Model/Session.php
```
    $this->_eventManager->dispatch('customer_login', ['customer' => $customer]);
```

* Event name: customer_data_object_login
* File: vendor/magento/module-customer/Model/Session.php
```
    $this->_eventManager->dispatch('customer_data_object_login', ['customer' => $this->getCustomerDataObject()]);
```

* Event name: customer_logout
* File: vendor/magento/module-customer/Model/Session.php
```
    $this->_eventManager->dispatch('customer_logout', ['customer' => $this->getCustomer()]);
```

* Event name: visitor_init
* File: vendor/magento/module-customer/Model/Visitor.php
```
    $this->_eventManager->dispatch('visitor_init', ['visitor' => $this]);
```

* Event name: visitor_activity_save
* File: vendor/magento/module-customer/Model/Visitor.php
```
    $this->_eventManager->dispatch('visitor_activity_save', ['visitor' => $this]);
```

* Event name: customer_address_format
* File: vendor/magento/module-customer/Model/Address/AbstractAddress.php

	 $this->_eventManager->dispatch('customer_address_format', ['type' => $formatType, 'address' => $this]);
```

* Event name: adminhtml_block_eav_attribute_edit_form_init
* File: vendor/magento/module-eav/Block/Adminhtml/Attribute/Edit/Main/AbstractMain.php
```
    $this->_eventManager->dispatch(
		'adminhtml_block_eav_attribute_edit_form_init',
		['form' => $this->getForm()]
	);
```

* Event name: eav_collection_abstract_load_before
* File: vendor/magento/module-eav/Model/Entity/Collection/AbstractCollection.php
```
    $this->_eventManager->dispatch('eav_collection_abstract_load_before', ['collection' => $this]);
```

* Event name: gift_options_prepare_items
* File: vendor/magento/module-gift-message/Block/Message/Inline.php
```
    $this->_eventManager->dispatch('gift_options_prepare_items', ['items' => $entityItems]);
```

* Event name: catalog_product_prepare_index_select
* File: vendor/magento/module-grouped-product/Model/ResourceModel/Product/Indexer/Price/Grouped.php

        $this->_eventManager->dispatch(
            'catalog_product_prepare_index_select',
            [
                'select' => $select,
                'entity_field' => new \Zend_Db_Expr('e.entity_id'),
                'website_field' => new \Zend_Db_Expr('cw.website_id'),
                'store_field' => new \Zend_Db_Expr('cs.store_id')
            ]
        );
```

* Event name: checkout_controller_multishipping_shipping_post
* File: vendor/magento/module-multishipping/Controller/Checkout/ShippingPost.php
```
    $this->_eventManager->dispatch(
		'checkout_controller_multishipping_shipping_post',
		['request' => $this->getRequest(), 'quote' => $this->_getCheckout()->getQuote()]
	);
```

* Event name: multishipping_checkout_controller_success_action
* File: vendor/magento/module-multishipping/Controller/Checkout/Success.php
```
    $this->_eventManager->dispatch('multishipping_checkout_controller_success_action', ['order_ids' => $ids]);
```

* Event name: checkout_type_multishipping_set_shipping_items
* File: vendor/magento/module-multishipping/Model/Checkout/Type/Multishipping.php
```
    $this->_eventManager->dispatch('checkout_type_multishipping_set_shipping_items', ['quote' => $quote]);
```

* Event name: checkout_type_multishipping_create_orders_single
* File: vendor/magento/module-multishipping/Model/Checkout/Type/Multishipping.php
```
    $this->_eventManager->dispatch(
		'checkout_type_multishipping_create_orders_single',
		['order' => $order, 'address' => $address, 'quote' => $this->getQuote()]
	);
```

* Event name: checkout_submit_all_after
* File: vendor/magento/module-multishipping/Model/Checkout/Type/Multishipping.php
```
    $this->_eventManager->dispatch(
		'checkout_submit_all_after',
		['orders' => $orders, 'quote' => $this->getQuote()]
	);
```

* Event name: checkout_multishipping_refund_all
* File: vendor/magento/module-multishipping/Model/Checkout/Type/Multishipping.php
```
    $this->_eventManager->dispatch('checkout_multishipping_refund_all', ['orders' => $orders]);
```

* Event name: payment_form_block_to_html_before
* File: vendor/magento/module-payment/Block/Form/Cc.php
```
    $this->_eventManager->dispatch('payment_form_block_to_html_before', ['block' => $this]);
```

* Event name: payment_cart_collect_items_and_amounts
* File: vendor/magento/module-payment/Model/Cart.php
```
    $this->_eventManager->dispatch('payment_cart_collect_items_and_amounts', ['cart' => $this]);
```

* Event name: payment_method_assign_data_
* File: vendor/magento/module-payment/Model/Method/AbstractMethod.php
```
    $this->_eventManager->dispatch(
		'payment_method_assign_data_' . $this->getCode(),
		[
			AbstractDataAssignObserver::METHOD_CODE => $this,
			AbstractDataAssignObserver::MODEL_CODE => $this->getInfoInstance(),
			AbstractDataAssignObserver::DATA_CODE => $data
		]
	);
```

* Event name: payment_method_assign_data
* File: vendor/magento/module-payment/Model/Method/AbstractMethod.php
```
    $this->_eventManager->dispatch(
		'payment_method_assign_data',
		[
			AbstractDataAssignObserver::METHOD_CODE => $this,
			AbstractDataAssignObserver::MODEL_CODE => $this->getInfoInstance(),
			AbstractDataAssignObserver::DATA_CODE => $data
		]
	);
```

* Event name: payment_method_is_active
* File: vendor/magento/module-payment/Model/Method/AbstractMethod.php
```
    $this->_eventManager->dispatch(
		'payment_method_is_active',
		[
			'result' => $checkResult,
			'method_instance' => $this,
			'quote' => $quote
		]
	);
```

* Event name: paypal_express_place_order_success
* File: vendor/magento/module-paypal/Controller/Express/AbstractExpress/PlaceOrder.php
```
    $this->_eventManager->dispatch(
		'paypal_express_place_order_success',
			[
	    			'order' => $order,
	    			'quote' => $this->_getQuote()
			]
	);
```

* Event name: persistent_session_expired
* File: vendor/magento/module-persistent/Controller/Index/UnsetCookie.php
```
    $this->_eventManager->dispatch('persistent_session_expired');
```

* Event name: persistent_session_expired
* File: vendor/magento/module-persistent/Observer/CheckExpirePersistentQuoteObserver.php
```
    $this->_eventManager->dispatch('persistent_session_expired');
```

* Event name: sales_quote_remove_item
* File: vendor/magento/module-quote/Model/Quote.php
```
    $this->_eventManager->dispatch('sales_quote_remove_item', ['quote_item' => $item]);
```

* Event name: sales_quote_add_item
* File: vendor/magento/module-quote/Model/Quote.php
```
    $this->_eventManager->dispatch('sales_quote_add_item', ['quote_item' => $item]);
```

* Event name: sales_quote_product_add_after
* File: vendor/magento/module-quote/Model/Quote.php
```
    $this->_eventManager->dispatch('sales_quote_product_add_after', ['items' => $items]);
```

* Event name: _merge_before
* File: vendor/magento/module-quote/Model/Quote.php
```
    $this->_eventManager->dispatch(
		$this->_eventPrefix . '_merge_before',
		[$this->_eventObject => $this, 'source' => $quote]
	);
```

* Event name: _merge_after
* File: vendor/magento/module-quote/Model/Quote.php
```
    $this->_eventManager->dispatch(
		$this->_eventPrefix . '_merge_after',
		[$this->_eventObject => $this, 'source' => $quote]
	);
```

* Event name: sales_quote_item_qty_set_after
* File: vendor/magento/module-quote/Model/Quote/Item.php
```
    $this->_eventManager->dispatch('sales_quote_item_qty_set_after', ['item' => $this]);
```

* Event name: sales_quote_item_set_product
* File: vendor/magento/module-quote/Model/Quote/Item.php
```
    $this->_eventManager->dispatch(
		'sales_quote_item_set_product',
		['product' => $product, 'quote_item' => $this]
	);
```

* Event name: _import_data_before
* File: vendor/magento/module-quote/Model/Quote/Payment.php
```
    $this->_eventManager->dispatch(
		$this->_eventPrefix . '_import_data_before',
		[$this->_eventObject => $this, 'input' => $data]
	);
```

* Event name: _load_after
* File: vendor/magento/module-quote/Model/ResourceModel/Quote/Address/Collection.php
```
    $this->_eventManager->dispatch($this->_eventPrefix . '_load_after', [$this->_eventObject => $this]);
```

* Event name: prepare_catalog_product_collection_prices
* File: vendor/magento/module-quote/Model/ResourceModel/Quote/Item/Collection.php
```
    $this->_eventManager->dispatch(
		'prepare_catalog_product_collection_prices',
		['collection' => $productCollection, 'store_id' => $this->getStoreId()]
	);
```

* Event name: sales_quote_item_collection_products_after_load
* File: vendor/magento/module-quote/Model/ResourceModel/Quote/Item/Collection.php
```
    $this->_eventManager->dispatch(
		'sales_quote_item_collection_products_after_load',
		['collection' => $productCollection]
	);
```

* Event name: adminhtml_widget_grid_filter_collection
* File: vendor/magento/module-reports/Block/Adminhtml/Grid.php
```
    $this->_eventManager->dispatch(
		'adminhtml_widget_grid_filter_collection',
		['collection' => $this->getCollection(), 'filter_values' => $this->_filterValues]
	);
```

* Event name: sales_prepare_amount_expression
* File: vendor/magento/module-reports/Model/ResourceModel/Order/Collection.php
```
    $this->_eventManager->dispatch(
		'sales_prepare_amount_expression',
		['collection' => $this, 'expression_object' => $expressionTransferObject]
	);
```

* Event name: review_controller_product_init_before
* File: vendor/magento/module-review/Controller/Product.php
```
    $this->_eventManager->dispatch('review_controller_product_init_before', ['controller_action' => $this]);
```

* Event name: review_controller_product_init
* File: vendor/magento/module-review/Controller/Product.php
```
    $this->_eventManager->dispatch('review_controller_product_init', ['product' => $product]);
```

* Event name: review_controller_product_init_after
* File: vendor/magento/module-review/Controller/Product.php
```
    $this->_eventManager->dispatch(
		'review_controller_product_init_after',
		['product' => $product, 'controller_action' => $this]
	);
```

* Event name: rating_rating_collection_load_before
* File: vendor/magento/module-review/Model/ResourceModel/Rating/Collection.php
```
    $this->_eventManager->dispatch('rating_rating_collection_load_before', ['collection' => $this]);
```

* Event name: review_review_collection_load_before
* File: vendor/magento/module-review/Model/ResourceModel/Review/Collection.php
```
    $this->_eventManager->dispatch('review_review_collection_load_before', ['collection' => $this]);
```

* Event name: adminhtml_block_salesrule_actions_prepareform
* File: vendor/magento/module-sales-rule/Block/Adminhtml/Promo/Quote/Edit/Tab/Actions.php
```
    $this->_eventManager->dispatch('adminhtml_block_salesrule_actions_prepareform', ['form' => $form]);
```

* Event name: adminhtml_promo_quote_edit_tab_coupons_form_prepare_form
* File: vendor/magento/module-sales-rule/Block/Adminhtml/Promo/Quote/Edit/Tab/Coupons/Form.php
```
    $this->_eventManager->dispatch(
		'adminhtml_promo_quote_edit_tab_coupons_form_prepare_form',
		['form' => $form]
	);
```

* Event name: adminhtml_block_promo_widget_chooser_prepare_collection
* File: vendor/magento/module-sales-rule/Block/Adminhtml/Promo/Widget/Chooser.php
```
    $this->_eventManager->dispatch(
		'adminhtml_block_promo_widget_chooser_prepare_collection',
		['collection' => $collection]
	);
```

* Event name: adminhtml_controller_salesrule_prepare_save
* File: vendor/magento/module-sales-rule/Controller/Adminhtml/Promo/Quote/Save.php
```
    $this->_eventManager->dispatch(
		'adminhtml_controller_salesrule_prepare_save',
		['request' => $this->getRequest()]
	);
```

* Event name: salesrule_rule_get_coupon_types
* File: vendor/magento/module-sales-rule/Model/Rule.php
```
    $this->_eventManager->dispatch('salesrule_rule_get_coupon_types', ['transport' => $transport]);
```

* Event name: salesrule_validator_process
* File: vendor/magento/module-sales-rule/Model/RulesApplier.php
```
    $this->_eventManager->dispatch(
		'salesrule_validator_process',
		[
			'rule' => $rule,
			'item' => $item,
			'address' => $address,
			'quote' => $quote,
			'qty' => $qty,
			'result' => $discountData
		]
	);
```

* Event name: salesrule_rule_condition_combine
* File: vendor/magento/module-sales-rule/Model/Rule/Condition/Combine.php
```
    $this->_eventManager->dispatch('salesrule_rule_condition_combine', ['additional' => $additional]);
```

* Event name: adminhtml_customer_orders_add_action_renderer
* File: vendor/magento/module-sales/Block/Adminhtml/Reorder/Renderer/Action.php
```
    $this->_eventManager->dispatch(
		'adminhtml_customer_orders_add_action_renderer',
		['renderer' => $this, 'row' => $row]
	);
```

* Event name: admin_sales_order_address_update
* File: vendor/magento/module-sales/Controller/Adminhtml/Order/AddressSave.php
```
    $this->_eventManager->dispatch(
		'admin_sales_order_address_update',
		[
			'order_id' => $address->getParentId()
		]
	);
```

* Event name: adminhtml_sales_order_create_process_data_before
* File: vendor/magento/module-sales/Controller/Adminhtml/Order/Create.php
```
    $this->_eventManager->dispatch('adminhtml_sales_order_create_process_data_before', $eventData);
```

* Event name: adminhtml_sales_order_create_process_data
* File: vendor/magento/module-sales/Controller/Adminhtml/Order/Create.php
```
    $this->_eventManager->dispatch('adminhtml_sales_order_create_process_data', $eventData);
```

* Event name: sales_order_place_before
* File: vendor/magento/module-sales/Model/Order.php
```
    $this->_eventManager->dispatch('sales_order_place_before', ['order' => $this]);
```

* Event name: sales_order_place_after
* File: vendor/magento/module-sales/Model/Order.php
```
    $this->_eventManager->dispatch('sales_order_place_after', ['order' => $this]);
```

* Event name: order_cancel_after
* File: vendor/magento/module-sales/Model/Order.php
```
    $this->_eventManager->dispatch('order_cancel_after', ['order' => $this]);
```

* Event name: sales_convert_order_to_quote
* File: vendor/magento/module-sales/Model/AdminOrder/Create.php
```
    $this->_eventManager->dispatch('sales_convert_order_to_quote', ['order' => $order, 'quote' => $quote]);
```

* Event name: sales_convert_order_item_to_quote_item
* File: vendor/magento/module-sales/Model/AdminOrder/Create.php
```
    $this->_eventManager->dispatch(
		'sales_convert_order_item_to_quote_item',
		['order_item' => $orderItem, 'quote_item' => $item]
	);
```

* Event name: checkout_submit_all_after
* File: vendor/magento/module-sales/Model/AdminOrder/Create.php
```
    $this->_eventManager->dispatch('checkout_submit_all_after', ['order' => $order, 'quote' => $quote]);
```

* Event name: _sales_email_general_async_sending_
* File: vendor/magento/module-sales/Model/Config/Backend/Email/AsyncSending.php
```
    $this->_eventManager->dispatch(
		$this->_eventPrefix . '_sales_email_general_async_sending_' . $state,
		$this->_getEventData()
	);
```

* Event name: _dev_grid_async_indexing_
* File: vendor/magento/module-sales/Model/Config/Backend/Grid/AsyncIndexing.php
```
    $this->_eventManager->dispatch(
		$this->_eventPrefix . '_dev_grid_async_indexing_' . $state,
		$this->_getEventData()
	);
```

* Event name: sales_order_invoice_pay
* File: vendor/magento/module-sales/Model/Order/Invoice.php
```
    $this->_eventManager->dispatch('sales_order_invoice_pay', [$this->_eventObject => $this]);
```

* Event name: sales_order_invoice_cancel
* File: vendor/magento/module-sales/Model/Order/Invoice.php
```
    $this->_eventManager->dispatch('sales_order_invoice_cancel', [$this->_eventObject => $this]);
```

* Event name: sales_order_invoice_register
* File: vendor/magento/module-sales/Model/Order/Invoice.php
```
    $this->_eventManager->dispatch(
		'sales_order_invoice_register',
		[$this->_eventObject => $this, 'order' => $order]
	);
```

* Event name: sales_order_item_cancel
* File: vendor/magento/module-sales/Model/Order/Item.php
```
    $this->_eventManager->dispatch('sales_order_item_cancel', ['item' => $this]);
```

* Event name: sales_order_payment_place_start
* File: vendor/magento/module-sales/Model/Order/Payment.php
```
    $this->_eventManager->dispatch('sales_order_payment_place_start', ['payment' => $this]);
```

* Event name: sales_order_payment_place_end
* File: vendor/magento/module-sales/Model/Order/Payment.php
```
    $this->_eventManager->dispatch('sales_order_payment_place_end', ['payment' => $this]);
```

* Event name: sales_order_payment_cancel_invoice
* File: vendor/magento/module-sales/Model/Order/Payment.php
```
    $this->_eventManager->dispatch(
		'sales_order_payment_cancel_invoice',
		['payment' => $this, 'invoice' => $invoice]
	);
```

* Event name: sales_order_payment_void
* File: vendor/magento/module-sales/Model/Order/Payment.php
```
    $this->_eventManager->dispatch('sales_order_payment_void', ['payment' => $this, 'invoice' => $document]);
```

* Event name: sales_order_payment_refund
* File: vendor/magento/module-sales/Model/Order/Payment.php
```
    $this->_eventManager->dispatch(
		'sales_order_payment_refund',
		['payment' => $this, 'creditmemo' => $creditmemo]
	);
```

* Event name: sales_order_payment_cancel_creditmemo
* File: vendor/magento/module-sales/Model/Order/Payment.php
```
    $this->_eventManager->dispatch(
		'sales_order_payment_cancel_creditmemo',
		['payment' => $this, 'creditmemo' => $creditmemo]
	);
```

* Event name: sales_order_payment_cancel
* File: vendor/magento/module-sales/Model/Order/Payment.php
```
    $this->_eventManager->dispatch('sales_order_payment_cancel', ['payment' => $this]);
```

* Event name: sales_order_status_unassign
* File: vendor/magento/module-sales/Model/Order/Status.php
```
    $this->_eventManager->dispatch(
		'sales_order_status_unassign',
		[
			'status' => $this->getStatus(),
			'state' => $state
		]
	);
```

* Event name: _html_txn_id
* File: vendor/magento/module-sales/Model/Order/Payment/Transaction.php
```
    $this->_eventManager->dispatch($this->_eventPrefix . '_html_txn_id', $this->_getEventData());
```

* Event name: _load_after
* File: vendor/magento/module-sales/Model/ResourceModel/Order/Address/Collection.php
```
    $this->_eventManager->dispatch($this->_eventPrefix . '_load_after', [$this->_eventObject => $this]);
```

* Event name: _set_sales_order
* File: vendor/magento/module-sales/Model/ResourceModel/Order/Collection/AbstractCollection.php
```
    $this->_eventManager->dispatch(
		$this->_eventPrefix . '_set_sales_order',
		['collection' => $this, $this->_eventObject => $this, 'order' => $order]
	);
```

* Event name: sales_sale_collection_query_before
* File: vendor/magento/module-sales/Model/ResourceModel/Sale/Collection.php
```
    $this->_eventManager->dispatch('sales_sale_collection_query_before', ['collection' => $this]);
```

* Event name: on_view_report
* File: vendor/magento/module-search/Controller/Adminhtml/Term/Report.php
```
    $this->_eventManager->dispatch('on_view_report', ['report' => 'search']);
```

* Event name: sendfriend_product
* File: vendor/magento/module-send-friend/Controller/Product/Send.php
```
    $this->_eventManager->dispatch('sendfriend_product', ['product' => $product]);
```

* Event name: swatch_gallery_upload_image_after
* File: vendor/magento/module-swatches/Controller/Adminhtml/Iframe/Show.php
```
    $this->_eventManager->dispatch(
		'swatch_gallery_upload_image_after',
		['result' => $result, 'action' => $this]
	);
```

* Event name: adminhtml_cache_refresh_type
* File: vendor/magento/module-tax/Controller/Adminhtml/Tax/IgnoreTaxNotification.php
```
    $this->_eventManager->dispatch('adminhtml_cache_refresh_type', ['type' => 'block_html']);
```

* Event name: tax_rate_data_fetch
* File: vendor/magento/module-tax/Model/Calculation.php
```
    $this->_eventManager->dispatch('tax_rate_data_fetch', ['request' => $request, 'sender' => $this]);
```

* Event name: tax_settings_change_after
* File: vendor/magento/module-tax/Model/Calculation/Rate.php
```
    $this->_eventManager->dispatch('tax_settings_change_after');
```

* Event name: page_block_html_topmenu_gethtml_before
* File: vendor/magento/module-theme/Block/Html/Topmenu.php
```
    $this->_eventManager->dispatch(
		'page_block_html_topmenu_gethtml_before',
		['menu' => $this->_menu, 'block' => $this]
	);
```

* Event name: page_block_html_topmenu_gethtml_after
* File: vendor/magento/module-theme/Block/Html/Topmenu.php
```
    $this->_eventManager->dispatch(
		'page_block_html_topmenu_gethtml_after',
		['menu' => $this->_menu, 'transportObject' => $transportObject]
	);
```

* Event name: assign_theme_to_stores_after
* File: vendor/magento/module-theme/Model/Config.php

        $this->_eventManager->dispatch(
            'assign_theme_to_stores_after',
            ['stores' => $stores, 'scope' => $scope, 'theme' => $theme]
        );
```

* Event name: permissions_role_html_before
* File: vendor/magento/module-user/Block/Role.php
```
    $this->_eventManager->dispatch('permissions_role_html_before', ['block' => $this]);
```

* Event name: admin_permissions_role_prepare_save
* File: vendor/magento/module-user/Controller/Adminhtml/User/Role/SaveRole.php
```
    $this->_eventManager->dispatch(
		'admin_permissions_role_prepare_save',
		['object' => $role, 'request' => $this->getRequest()]
	);
```

* Event name: admin_user_authenticate_before
* File: vendor/magento/module-user/Model/User.php
```
    $this->_eventManager->dispatch(
		'admin_user_authenticate_before',
		['username' => $username, 'user' => $this]
	);
```

* Event name: admin_user_authenticate_after
* File: vendor/magento/module-user/Model/User.php
```
    $this->_eventManager->dispatch(
		'admin_user_authenticate_after',
		['username' => $username, 'password' => $password, 'user' => $this, 'result' => $result]
	);
```

* Event name: admin_user_authenticate_after
* File: vendor/magento/module-user/Model/User.php
```
    $this->_eventManager->dispatch(
		'admin_user_authenticate_after',
		[
			'username' => $this->getUserName(),
			'password' => $passwordString,
			'user' => $this,
			'result' => $isCheckSuccessful
		]
	);
```

* Event name: product_option_renderer_init
* File: vendor/magento/module-wishlist/Block/Customer/Wishlist/Item/Options.php
```
    $this->_eventManager->dispatch('product_option_renderer_init', ['block' => $this]);
```

* Event name: wishlist_add_product
* File: vendor/magento/module-wishlist/Controller/Index/Add.php

    $this->_eventManager->dispatch(
	'wishlist_add_product',
	['wishlist' => $wishlist, 'product' => $product, 'item' => $result]
    );
```

* Event name: wishlist_share
* File: vendor/magento/module-wishlist/Controller/Index/Send.php
```
    $this->_eventManager->dispatch('wishlist_share', ['wishlist' => $wishlist]);
```

* Event name: wishlist_items_renewed
* File: vendor/magento/module-wishlist/Helper/Data.php
```
    $this->_eventManager->dispatch('wishlist_items_renewed');
```

* Event name: wishlist_product_add_after
* File: vendor/magento/module-wishlist/Model/Wishlist.php
```
    $this->_eventManager->dispatch('wishlist_product_add_after', ['items' => $items]);
```

* Event name: wishlist_item_collection_products_after_load
* File: vendor/magento/module-wishlist/Model/ResourceModel/Item/Collection.php
```
    $this->_eventManager->dispatch(
		'wishlist_item_collection_products_after_load',
		['product_collection' => $productCollection]
	);
