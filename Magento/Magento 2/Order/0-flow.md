# How is the order flow on Magento 2?
* add product into the cart
* check that all the checkout process it is done
* check on the backend that you can see the data on: **Sales -> Orders**

## I cant see my order, why?
1- You will need to reindex the order reindex
```bash
    php bin/magento indexer:reindex
```
2 - YOu will need to flush your cache as well
3 - If you still cant see the order you must disable the Asynchronous, so you must go: Store -> Configuration -> Advanced -> Developer -> Grid Settings -> Asynchronous Indexing -> Disable
4 -> You must clean the cache after
> This status needs to be set to "Pending"

# Invoice 
* You always can change information on Invoice 
* You need to invoice the order as next step
> Now the status needs to be set to "Processing"
>
# Shiptment 
* You will be able to change the shipping information
* You will submit the shippment
> Now the status needs to be set to "Complete"
