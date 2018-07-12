# How to load product images?

## loading all images from a product
```

$collleciton = Mage::getModel('catalog/product')->getCollection();

foreach($collection as $product){

    // $media it is an array of all images of the product
    $media = Mage::getModel("catalog/product_attribute_media_api")->items($product->getId());    

    foreach($media as $imgArray)
    {
        //... you can do things in here
    }

}

```
