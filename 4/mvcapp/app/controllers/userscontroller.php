<?php
namespace PHPMVC\Controllers;

use http\Client\Curl\User;
use PHPMVC\LIB\Helper;
use PHPMVC\LIB\InputFilter;
use PHPMVC\LIB\Messenger;
use PHPMVC\Models\UserGroupModel;
use PHPMVC\Models\UserModel;

class UsersController extends AbstractController
{
    use InputFilter;
    use Helper;
        private $_createActionRoles =
            [
               'Username' => 'req|alphanum|between(3,12)',
               'password' => 'req|min(6)|eq_Field(cpassword)',
               'cpassword' => 'req|min(6)',
                'email'    => 'req|email',
                'cemail'    => 'req|email',
                'phoneNumber' =>'alphanum|max(15)',
                'groupid'  => 'req|int'


            ];

        public function defaultAction()
        {
            $this->language->load('template.common');
            $this->language->load('users.default');

            $this->_data['users'] = UserModel::getAll();
            $this->_view();

        }
        public function createAction()
        {

            $this->language->load('template.common');
            $this->language->load('users.create');
            $this->language->load('users.labels');
            $this->language->load('users.messages');
            $this->language->load('validtion.errors');

            $this->_data['groups'] = UserGroupModel::getAll();


            if(isset($_POST['submit']) && $this->isValid($this->_createActionRoles,$_POST)){
                    $user = new UserModel();
                    $user->Username =$this->filterString($_POST['Username']);
                    $user->cryptPassword($_POST['password']);
                    $user->email = $this->filterString($_POST['email']);
                    $user->phoneNumber = $this->filterString($_POST['phoneNumber']);
                    $user->GroupId = $this->filterInt($_POST['groupid']);
                    $user->subscriptionDate = date('Y-m-d   ');
                    $user->lastlogin = date('Y-m-d H:i:s');
                    $user->Status = 1;
                    if ($user->save()){
                        $this->messenger->add($this->language->get('mesage_create_success'));
                    }else{
                        $this->messenger->add($this->language->get('mesage_create_failed'), Messenger::APP_MESSAGE_ERROR);

                    }
                    $this->redirect('/mvcapp/public/index.php/users');
            }


            $this->_view();

        }
        //TODO:: make sure this is Ajax Request
        //TODO:: explain the different types of header used in this course
        public function checkUserExistsAjaxAction()
        {
            if(isset($_POST['Username'])){

             header('Content-type: text/plain');
                if(UserModel::userExists($this->filterString($_POST['Username'])) !== false){
                    echo 1;
                }else{
                    echo 2;
                }
            }
        }

}