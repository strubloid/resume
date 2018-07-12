# How to get Active Payment methods
```
public function getActiveShippingMethods()
{

    $activeCarriers = Mage::getSingleton('shipping/config')->getActiveCarriers();

    //print_r($activeCarriers);
    $allCarriers = array();

    foreach($activeCarriers as $carrierCode => $carrierModel)
    {
        $options = array();

        //print_r($carrierModel->getAllowedMethods());

        if( $carrierMethods = $carrierModel->getAllowedMethods() )
        {
            $carrierTitle = Mage::getStoreConfig('carriers/'.$carrierCode.'/title');
            foreach ($carrierMethods as $methodCode => $method)
            {
                $code= $carrierCode.'_'.$methodCode;
                $options[] = array('value'=>$code,'label'=>$carrierTitle.' '.$method);
                $allCarriers[] = array('value'=>$code,'label'=>$carrierTitle.' '.$method);
            }
        }

        $methods[]=array('value'=>$options,'label'=>$carrierTitle);
    }

    return $allCarriers;
}
```
