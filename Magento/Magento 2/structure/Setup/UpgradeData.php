<?php
namespace Centralbank\Upgrades\Setup;

use Magento\Framework\Setup\UpgradeDataInterface;
use Magento\Framework\Setup\ModuleContextInterface;
use Magento\Framework\Setup\ModuleDataSetupInterface;

class UpgradeData implements UpgradeDataInterface
{

    private $changeLog = [
        '1.0.0' => 'newFunction'
    ];

    /**
     * {@inheritdoc}
     */
    public function upgrade(ModuleDataSetupInterface $setup, ModuleContextInterface $context)
    {

        foreach ($this->changeLog as $version => $action)
        {
            if(version_compare($context->getVersion(), $version, '<'))
            {
                $this->{$action}($setup);
            }
        }
    }

    private function newFunction(ModuleDataSetupInterface $setup)
    {
        // you can do something here
    }
}