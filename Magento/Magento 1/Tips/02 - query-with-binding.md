
## sample of query with items to bind in the where clause
```
// loading the core resource
    $coreResource = Mage::getSingleton('core/resource');

    // getting the reading connection
    $dbConex = $coreResource->getConnection('core_read');

    // mounting the query, binding the data with ?
    $select = $dbConex->select()
        ->from(array('sr' => $coreResource->getTableName('salesrule/rule')), new Zend_Db_Expr('sr.discount_amount'))
        ->joinLeft(
            array('src' => $coreResource->getTableName('salesrule/coupon')),
            'sr.rule_id = src.rule_id AND src.is_primary = 1',
            array()
        )
        ->where('code  = ?', $couponCode);

    // getting the data
    return $dbConex->fetchOne($select);

```