
# add the render to be a new one that you will create
```
protected function _prepareColumns()
    {
        parent::_prepareColumns();

        $this->addColumn('base_grand_total', array(
            'header' => Mage::helper('sales')->__('G.T. (Base)'),
            'index' => 'base_grand_total',
            'type'  => 'currency',
            'currency' => 'currency',
        ));

        $this->addColumn('quote_items', array(
            'header' => Mage::helper('sales')->__('Quote Items'),
            'index' => 'quote_items',
            'renderer'  => 'Sonas_Quote_Block_Adminhtml_Render_QuoteItems',
        ));

        $this->addExportType('adminhtml/quote/exportCsv', Mage::helper('sales')->__('CSV'));
        $this->addExportType('adminhtml/quote/exportXml', Mage::helper('sales')->__('Excel XML'));

        return $this;
    }
```

# create an object file and specify how will be rendered the column
```
<?php
class Sonas_Quote_Block_Adminhtml_Render_QuoteItems extends  Mage_Adminhtml_Block_Widget_Grid_Column_Renderer_Abstract
{
    /**
     * Method that will generate the li element for the render of this quoteItems column.
     *
     * @param $quoteItem
     * @return string
     * @throws Mage_Core_Model_Store_Exception
     */
    private function _buildHtml($quoteItem)
    {
        // loading product name
        $name = Mage::getResourceModel('catalog/product')->getAttributeRawValue($quoteItem->getData('product_id'), 'name',  Mage::app()->getStore()->getStoreId());

        // loading product sku
        $sku = Mage::getResourceModel('catalog/product')->getAttributeRawValue($quoteItem->getData('product_id'), 'sku',  Mage::app()->getStore()->getStoreId());

        // getting the price of the product
        if($_finalPrice = Mage::getResourceModel('catalog/product')->getAttributeRawValue($quoteItem->getData('product_id'), 'final_price',  Mage::app()->getStore()->getStoreId())){
            $_price = $_finalPrice;
        } else {
            $_price = Mage::getResourceModel('catalog/product')->getAttributeRawValue($quoteItem->getData('product_id'), 'price',  Mage::app()->getStore()->getStoreId());
        }

        // formatting the price
        $price = $this->helper('core')->formatPrice($_price, true);

        return "<li style='list-style: decimal-leading-zero; margin-left: 20px;'>{$name} | {$sku} ($price)</li>";
    }

    /**
     * Method that will render the column.
     *
     * @param Varien_Object $row
     * @return array|string
     * @throws Mage_Core_Model_Store_Exception
     */
    public function render(Varien_Object $row)
    {
        // checking if exist a quote Id in the row object
        if(empty($row->getData('quote_id')))
        {
            return "Something is wrong with this quote, it is missing the quote_id";
        }

        $html = array('<ul>');

        // loading the collection of items in the quote
        $collection = Mage::getModel('qquoteadv/requestitem')->getCollection()
            ->addFieldToFilter('quote_id', array('eq' => $row->getData('quote_id')));

        foreach($collection as $quoteItem)
        {
            $html[] = $this->_buildHtml($quoteItem);
        }

        $html[] = '</ul>';

        // adding empty live at the end of each element
        $html = implode('', $html);

        return $html;
    }

}
```