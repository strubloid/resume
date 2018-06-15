# action to save
```
/checkout/klarna/saveCustomer/
```

# failure url
```
/checkout/cart/
```

# reaload url
```
/checkout/klarna/saveShippingAddress/
```



document.observe("dom:loaded", function() {


            console.log(checkout);
            console.log(this);

        });


        checkout.prototype.test = function(){
            test1 :10,
            test : function(){
                console.log(window);
                console.log(api);
            }
        };

        console.log(checkout.test());

        var testFunction = checkout.attachEvents;
        var boundFunction = testFunction.bind(checkout);

        window._klarnaCheckout(function(api){
            api.on({
                'shipping_option_change' : function(){
                    console.log('rafa');
                    console.log(data);
                }
            });
        });