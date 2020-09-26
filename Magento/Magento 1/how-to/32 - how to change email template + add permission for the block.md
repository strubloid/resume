# how to update email template
```
$newOrderEmail = Mage::getModel('core/email_template');

$newOrderEmail->loadByCode('New Order Confirmation Customisable Template');

$newOrderEmailContent = <<<'END_OF_EMAIL'
{{template config_path="design/email/header"}}
{{inlinecss file="email-inline.css"}}

<table cellpadding="0" cellspacing="0" border="0">
    .....
</table>
{{block type='mcelhinneys_trustpilot/afs20' area='frontend' template='trustpilot/afs20.phtml' shipment=$shipment order=$order}}
{{template config_path="design/email/footer"}}
END_OF_EMAIL;

$newOrderEmail->setData('template_text', $newOrderEmailContent);
$newOrderEmail->save();
```

# how to add the new block into the permissions
```
// enabling the extra block in the System -> Permission -> Blocks
$adminBlock = Mage::getModel('admin/block')->setData(array(
   'block_name' =>  'mcelhinneys_trustpilot/afs20',
   'is_allowed' => 1
));


// saving the block to allow it in the email template
$adminBlock->save();

```
