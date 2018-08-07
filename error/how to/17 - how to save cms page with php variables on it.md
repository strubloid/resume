
#how to save a cms page content with php variables in it

```
<?php
$installer = $this;
$installer->startSetup();

$newOrderEmail = Mage::getModel('core/email_template');

$newOrderEmail->loadByCode('New Order for Guest');

$newOrderEmailContent = <<<'END_OF_EMAIL'
<body style="background:#F6F6F6; font-family:Verdana, Arial, Helvetica, sans-serif; font-size:12px; margin:0; padding:0;">
[the full content of the email]
</body>
END_OF_EMAIL;

$newOrderEmail->setData('template_text', $newOrderEmailContent);
$newOrderEmail->save();

$installer->endSetup();
```