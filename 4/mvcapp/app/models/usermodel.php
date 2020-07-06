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
    public $Status;


    protected  static  $tableName = 'app_users';


    protected  static  $tableSchema =array(
        'UserId'               =>self::DATA_TYPE_INT,
        'Username'             => self::DATA_TYPE_STR,
        'password'             => self::DATA_TYPE_STR,
        'email'                =>self::DATA_TYPE_STR,
        'phoneNumber'          =>self::DATA_TYPE_STR,
        'subscriptionDate'     => self::DATA_TYPE_STR,
        'lastlogin'            =>self::DATA_TYPE_STR,
        'GroupId'              =>self::DATA_TYPE_INT,
        'Status'              =>self::DATA_TYPE_INT

    ) ;

    protected  static  $primaryKey = 'UserId';

    public  function cryptPassword($password){

        $salt = '$2a$07$y10ko9FV5v1uinmiORKzcx$';
          $this->password = crypt($password,$salt);
    }

    // TODO:: FIX THE TABLE ALIASING
	public static function getAll()
    {
        return self::get(
           'SELECT au.*, aug.GroupName GroupName FROM ' . self::$tableName . ' au INNER JOIN app_users_groups aug ON aug.groupid = au.GroupId'
        );
    }
    public static function userExists($username){
       return self::get(
            'SELECT * FROM ' . self::$tableName . ' WHERE Username = "'.$username . '"
            ');

    }

}