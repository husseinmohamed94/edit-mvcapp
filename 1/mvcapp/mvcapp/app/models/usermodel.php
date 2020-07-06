<?php
namespace PHPMVC\Models;

class UserModel extends AbstractModel
{
    public $UserId;
    public $Username;
    public $password;
    public $email;
    public $phoneNumber;
    public $subscriptionDate;
    public $lastlogin;
      public $GroupId;


    protected  static  $tableName = 'app_users';


    protected  static  $tableSchema =array(
        'UserId'               =>self::DATA_TYPE_INT,
        'Username'             => self::DATA_TYPE_STR,
        'password'             => self::DATA_TYPE_STR,
        'email'                =>self::DATA_TYPE_STR,
        'phoneNumber'          =>self::DATA_TYPE_STR,
        'subscriptionDate'     => self::DATA_TYPE_DATE,
        'lastlogin'            =>self::DATA_TYPE_STR,
        'GroupId'              =>self::DATA_TYPE_INT

    ) ;

    protected  static  $primaryKey = 'UserId';



	




 
}