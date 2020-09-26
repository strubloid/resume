# how to create a collection using the varien object
```
public function getInterval(Mage_Core_Controller_Request_Http $request)
    {

        $collection = new Varien_Data_Collection();

        // getting from date value
        $fromDate = $this->_getTimeFormat($request->getPost('from_date'), $request->getPost('from_time'));

        $row = new Varien_Object();
        $row->setData('from', $fromDate);

        // adding from date
        $collection->addItem($row);

        // getting to date value
        $toDate = $this->_getTimeFormat($request->getPost('to_date'), $request->getPost('to_time'));

        $row = new Varien_Object();
        $row->setData('to', $toDate);

        // adding to date
        $collection->addItem($row);

        return $collection;
    }

```
