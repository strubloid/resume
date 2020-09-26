# What I'd learned about PayPal IPN

## What stands for?
> IPN: Instant Payment Notification

## Main points
* This is a feature that allows you to integrate Paypal Payments
* This will immediate return notification and authentication of the PayPal payments you receive
* IPN itself it is supported by Magento by Default
* Main controller to check is : app/code/core/Mage/Paypal/controllers/IpnController.php **function indexAction**


### If we have the debug mode on in System -> Configuration -> Sales -> Payment Methods -> Paypal Tab -> Configure -> Advanced Settings
> Set Debug Mode to “Yes” to write communications with the payment system into the log file. The log file for PayPal Payments Advanced is payments_payflow_advanced.log.

## how to debug?
1 - grab the data from the request that failed 
2 - Create an array with that data
3 - Navigate to: `[site domain]`/paypal/ipn,this will simulate the request
4 - Check the method on **app/code/core/Mage/Paypal/Model/Ipn.php** functiion it's call **_postBack**



