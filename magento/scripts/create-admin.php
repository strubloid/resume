<?php
/**
 * Created by PhpStorm.
 * User: strub
 * Date: 21/09/16
 * Time: 15:50
 */
require_once 'abstract.php';

class Mage_Shell_Runtime extends Mage_Shell_Abstract
{

    /**
     * Mage_Shell_Runtime constructor.
     */
    public function __construct()
    {
        // Include bootstrap code and Mage class
        require_once "app/Mage.php";
        parent::_construct();
        return $this;
    }

    public function run()
    {
        Mage::app();
        try {

            $user = Mage::getModel('admin/user')
                ->setData(array(
                    'username' => 'rafael',
                    'firstname' => 'Rafael',
                    'lastname' => 'Mendes',
                    'email' => 'email@test.com',
                    'password' => '1234',
                    'is_active' => 1
                ))->save();
        }
        catch (Exception $e) {
            echo $e->getMessage();
            exit;
        }

        //Assign Role Id
        try {
            $user->setRoleIds(array(1))  //Administrator role id is 1 ,Here you can assign other roles ids
            ->setRoleUserId($user->getUserId())
                ->saveRelations();
        }
        catch (Exception $e) {
            echo $e->getMessage();
            exit;
        }

        echo "User created successfully";


    }

    /**
     * Overwriting the function to avoid the time and memory limit setted on
     * the .htaccess file, just for terminal executions
     */
    protected function _applyPhpVariables()
    {
        parent::_applyPhpVariables(); // calling the parent

        // avoiding the time limit
        set_time_limit(0);

        // avoiding the memory limit
        ini_set('memory_limit', -1);

        umask(0);
    }


}

$shell = new Mage_Shell_Runtime();
$shell->run();
