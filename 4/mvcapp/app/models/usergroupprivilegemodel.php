<?php
namespace PHPMVC\Models;

class UserGroupPrivilegeModel extends AbstractModel
{
    public $id;
    public $GroupId;
    public $privilegeId;



    protected  static  $tableName = 'app_users_groups_privileges';


    protected  static  $tableSchema =array(
        'GroupId'               =>self::DATA_TYPE_INT,
        'privilegeId'             => self::DATA_TYPE_INT

    ) ;

    protected  static  $primaryKey = 'id';


    public static function getGroupPrivileges(UserGroupModel $group){
        $groupprivileges = self::getBy(['groupid' => $group->groupid]);

        $extractedPrivilegesIds = [];
        if (false !== $groupprivileges) {
            foreach ($groupprivileges as $privilege) {
                $extractedPrivilegesIds[] = $privilege->privilegeId;

            }
        }
        return $extractedPrivilegesIds;
    }






}