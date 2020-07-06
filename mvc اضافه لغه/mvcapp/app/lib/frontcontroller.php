<?php
 namespace PHPMVC\LIB;

use PHPMVC\LIB\Template\Template;

class  FrontController
{
    const NOT_FOUND_ACTION = 'notFoundAction';
    const NOT_FOUND_CONTROLLER = 'PHPMVC\Controllers\\NotFoundController';


    private $_controller ='index' ;
    private $_action = 'default';
    private $_params = array();
    private  $_template ;
    private  $_language;

    public function __construct(Template $template , Language $language)
    {

        $this->_template = $template;
        $this->_language = $language;
      $this->_parseUrl();
    }

    private  function  _parseUrl()
    {
        $url = explode('/',trim(parse_url($_SERVER['REQUEST_URI'],PHP_URL_PATH),'/'),6);
        if(isset($url[3]) && $url[3] !=''){
            $this->_controller =$url[3];
        }
        if(isset($url[4]) && $url[4] !=''){
            $this->_action =$url[4];
        }
        if(isset($url[5]) && $url[5] !=''){
            $this->_params =explode( '/',$url[5]);

        }

    }

    public function  dispatch()
    {

        $controllerClassName ='PHPMVC\Controllers\\' . ucfirst( $this->_controller) .'controller';
         $actionName = $this->_action . 'Action';

           if(!class_exists( $controllerClassName) ){
           $controllerClassName =self::NOT_FOUND_CONTROLLER;

           }

        $controller = new $controllerClassName();

        if(!method_exists($controller,$actionName)){

         $this->_action  = $actionName = self::NOT_FOUND_ACTION;
        }

      $controller->setController($this->_controller);
      $controller->setAction($this->_action);
      $controller->setParams($this->_params);
      $controller->setTemplate($this->_template);
      $controller->setLanguage($this->_language);
      $controller->$actionName();

}












}