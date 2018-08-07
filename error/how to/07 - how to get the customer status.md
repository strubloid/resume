# how to get the customer status

## by customer session

```
Mage::getSingleton('customer/session')->isLoggedIn();
```
> this will return if we have a customer logged into the website

## Example in the frontend 
```
if(!Mage::getSingleton('customer/session')->isLoggedIn()){
    //not logged in
}else{
    // logged in
}
```
