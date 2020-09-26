# how to remove a country from the checkout

## checkout billing part
```
class Evergreen_Disabled_Block_Billing extends Mage_Checkout_Block_Onepage_Billing
{
    /**
     * Override method that will provide a way to remove disabled
     * countries from the checkout.
     *
     * @return array|bool|mixed
     */
    public function getCountryOptions()
    {
        // loading the countries from the parent class
        $countries = parent::getCountryOptions();

        // loading disabled countries
        $disabledCountries = Mage::getModel('evergreen_disabled/country')->getDisabledCountries();

        // if we don't have disabled countries
        if(empty($disabledCountries)){
            return $countries;
        }

        return Mage::getModel('evergreen_disabled/country')->allowedCountries($countries, $disabledCountries);
    }

}

```
> file: app/code/local/Evergreen/Disabled/Block/Billing.php


## checkout shipping part
```
class Evergreen_Disabled_Block_Shipping extends Mage_Checkout_Block_Onepage_Shipping
{
    /**
     * Override method that will provide a way to remove disabled
     * countries from the checkout.
     *
     * @return array|bool|mixed
     */
    public function getCountryOptions()
    {
        // loading the countries from the parent class
        $countries = parent::getCountryOptions();

        // loading disabled countries
        $disabledCountries = Mage::getModel('evergreen_disabled/country')->getDisabledCountries();

        // if we don't have disabled countries
        if(empty($disabledCountries)){
            return $countries;
        }

        return Mage::getModel('evergreen_disabled/country')->allowedCountries($countries, $disabledCountries);
    }

}
```
> file: app/code/local/Evergreen/Disabled/Block/Shipping.php


## checkout country model
```
class Evergreen_Disabled_Model_Country  extends Mage_Core_Model_Abstract
{

    /**
     * Method that will get the actual array of countries and will remove all disabled countries.
     * @param $countries an array of countries.
     * @param $disabledCountries an array of disabled countries
     * @return array the final result to be returned.
     */
    public function allowedCountries($countries, $disabledCountries)
    {
        $allowedCountries = array();

        // looping through  the countries to remove a few disabled one's
        foreach($countries as $index => $country)
        {
            // removing if exists in the disabled countries variable
            if(!in_array($country['label'], $disabledCountries))
            {
                $allowedCountries[] = $country;
            }
        }

        return $allowedCountries;
    }

    /**
     * Method that will return all disabled countries.
     * @return array
     */
    public function getDisabledCountries()
    {
        // this is the primary way to collect this data, in a future we should add a select in the backend with this information
        $disabledCountries = array('Bosnia and Herzegovina', 'Norway','Liechtenstein', 'Serbia');

        return $disabledCountries;
    }
	
}
```
> file: app/code/local/Evergreen/Disabled/Model/Country.php

## config.xml file
```
<?xml version="1.0"?>
<config>
    <modules>
        <Evergreen_Disabled>
            <version>0.1.0</version>
        </Evergreen_Disabled>
    </modules>
    <global>
        <models>
            <evergreen_disabled>
                <class>Evergreen_Disabled_Model</class>
                <resourceModel>evergreen_disabled_resource</resourceModel>
            </evergreen_disabled>
            <evergreen_disabled_resource>
                <class>Evergreen_Disabled_Model_Resource</class>
            </evergreen_disabled_resource>
        </models>
        <blocks>
            <evergreen_disabled>
                <class>Evergreen_Disabled_Block</class>
            </evergreen_disabled>
            <checkout>
                <rewrite>
                    <onepage_billing>Evergreen_Disabled_Block_Billing</onepage_billing>
                    <onepage_shipping>Evergreen_Disabled_Block_Shipping</onepage_shipping>
                </rewrite>
            </checkout>
        </blocks>
        <helpers>
            <evergreen_disabled>
                <class>Evergreen_Disabled_Helper</class>
            </evergreen_disabled>
        </helpers>
        <resources>
            <evergreen_disabled_setup>
                <setup>
                    <module>Evergreen_Disabled</module>
                </setup>
            </evergreen_disabled_setup>
        </resources>
    </global>
</config>
```
> file: app/code/local/Evergreen/Disabled/etc/config.xml