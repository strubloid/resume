# how to get the customer status

```
if(!Mage::getSingleton('customer/session')->isLoggedIn()){
        //not logged in
    }else{
        // logged in
    }
```
