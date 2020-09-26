# how to update a static block programatically

```
Mage::getModel('cms/block')
  ->getCollection()
  ->addFieldToFilter('identifier', 'block_identifier')
  ->load()
  ->setData('content', 'Example content')
  ->save();
```

> Sample: 
```
<?php

$this->startSetup();

// getting the store id from art and hobby
$artAndHobbyStoreId = Mage::getModel('core/store')->load('artnhobby', 'code')->getId();


// loading the static block from art and hobby
$footerArtAndHobby = Mage::getModel('cms/block')
    ->getCollection()
    ->addFieldToFilter('identifier', 'footer_links_2')
    ->addStoreFilter($artAndHobbyStoreId)
    ->getFirstItem();


// afterLoad() triggers _afterLoad() of the resource model which looks up the associated stores and sets them as store_id
$footerArtAndHobby->afterLoad();

// new content for art and hobby store
$newContentArtAndHobby = '
<h3>Services</h3>
<ul>
    <li><a href="/contacts">Contact Us</a></li>
    <li><a href="/delivery-information">Delivery</a></li>
    <li><a href="https://www.artnhobby.ie/store/list">Store Locations</a></li>
    <li><a href="/download">PDF Section</a></li>
</ul>
';

// setting the data for art and hobby
$footerArtAndHobby->setData('content', $newContentArtAndHobby);

// saving the data
$footerArtAndHobby->save();

$this->endSetup();
```