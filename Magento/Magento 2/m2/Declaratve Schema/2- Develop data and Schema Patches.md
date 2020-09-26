# Develop data and Schema Patches

## Flow
1 - you must create a file under:  <Vendor>/<Module_Name>/Setup/Patch/Data/<Patch_Name>.php
 * This file needs to implement:  \Magento\Framework\Setup\Patch\SchemaPatchInterface
 * A list of applied patches is stored in the patch_list database table.
 * An unapplied patch will be applied when running the setup:upgrade from the Magento CLI.

* If you want to rollback you must implement: \Magento\Framework\Setup\Patch\PatchRevertableInterface.

```
Note: The declarative schema approach removes the version from the setup_module table leaving only the Composer version
Note2: Therefore, you can create all new patches and modules without specifying a setup_module version.
Note3: Magento prioritizes the declarative schema approach and executes updates from the db_schema.xml before the data and schema patches
```

## How to declare dependencies?
* To define a dependency in a patch, add the method public static function getDependencies() to the patch class and return the class names
 of the patches this patch depends on. The dependency can be in any module.
```
public static function getDependencies()
{
    return [
        \SomeVendor\SomeModule\Setup\Patch\Data\SomePatch::class
    ];
}
```



## File sample
```php
<?php
    /**
     * Copyright © Monsoon Consulting. All rights reserved.
     * See LICENSE.txt for license details.
     */
    declare(strict_types=1);


    namespace Magento\DummyModule\Setup\Patch\Data;

    use Magento\Framework\Setup\Patch\DataPatchInterface;
    use Magento\Framework\Setup\Patch\PatchRevertableInterface;

    /**
     */
    class DummyPatch
        implements DataPatchInterface,
        PatchRevertableInterface
    {
        /**
         * @var \Magento\Framework\Setup\ModuleDataSetupInterface
         */
        private $moduleDataSetup;

        /**
         * @param \Magento\Framework\Setup\ModuleDataSetupInterface $moduleDataSetup
         */
        public function __construct(
            \Magento\Framework\Setup\ModuleDataSetupInterface $moduleDataSetup
        ) {
            /**
             * If before, we pass $setup as argument in install/upgrade function, from now we start
             * inject it with DI. If you want to use setup, you can inject it, with the same way as here
             */
            $this->moduleDataSetup = $moduleDataSetup;
        }

        /**
         * {@inheritdoc}
         */
        public function apply()
        {
            $this->moduleDataSetup->getConnection()->startSetup();
            //The code that you want apply in the patch
            //Please note, that one patch is responsible only for one setup version
            //So one UpgradeData can consist of few data patches
            $this->moduleDataSetup->getConnection()->endSetup();
        }

        /**
         * {@inheritdoc}
         */
        public static function getDependencies()
        {
            /**
             * This is dependency to another patch. Dependency should be applied first
             * One patch can have few dependencies
             * Patches do not have versions, so if in old approach with Install/Ugrade data scripts you used
             * versions, right now you need to point from patch with higher version to patch with lower version
             * But please, note, that some of your patches can be independent and can be installed in any sequence
             * So use dependencies only if this important for you
             */
            return [
                SomeDependency::class
            ];
        }

        public function revert()
        {
            $this->moduleDataSetup->getConnection()->startSetup();
            //Here should go code that will revert all operations from `apply` method
            //Please note, that some operations, like removing data from column, that is in role of foreign key reference
            //is dangerous, because it can trigger ON DELETE statement
            $this->moduleDataSetup->getConnection()->endSetup();
        }

        /**
         * {@inheritdoc}
         */
        public function getAliases()
        {
            /**
             * This internal Magento method, that means that some patches with time can change their names,
             * but changing name should not affect installation process, that's why if we will change name of the patch
             * we will add alias here
             */
            return [];
        }
    }
```