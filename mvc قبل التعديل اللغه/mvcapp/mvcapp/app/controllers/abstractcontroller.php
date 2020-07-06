<?php


namespace PHPMVC\Controllers;


use PHPMVC\LIB\FrontController;

class AbstractController
{
    protected $_controller;
    protected $_action;
    protected $_params;
    protected $_template;

    protected $_data = [];
        public function  notFoundAction(){
       $this->_view();

        }

        public function setController($controllerName){
            $this->_controller = $controllerName;
        }
    public function setAction($actionName){
        $this->_action = $actionName;

    }
    public function setTemplate($template){
            $this->_template = $template;
    }

    public function setParams($params){
        $this->_params =$params;
    }
    protected function _view()
    {

        if ($this->_action == FrontController::NOT_FOUND_ACTION){
           require_once  VIEWS_PATH .'notfound'. DS . 'notfound.view.php';
        }else {
            $view = VIEWS_PATH . $this->_controller . DS . $this->_action . '.view.php';
            if(file_exists($view)){
                $this->_template->setActionViewFile($view);
                $this->_template->setAppData($this->_data);
                extract($this->_data);

                $this->_template->renderApp();
            }else{
                require_once  VIEWS_PATH .'notfound'. DS . 'noview.view.php';
            }

        }


        }




}