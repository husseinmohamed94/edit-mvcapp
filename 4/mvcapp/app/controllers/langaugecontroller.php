<?php


namespace PHPMVC\Controllers;


use PHPMVC\LIB\Helper;

class LangaugeController extends AbstractController
{
    use Helper;
        public function defaultAction(){
            if ($_SESSION['lang'] == 'ar' ){
                $_SESSION['lang'] = 'en';
            }else{
                $_SESSION['lang'] = 'ar';
            }
            var_dump($_SESSION['lang'] );
            $this->redirect($_SERVER['HTTP_REFERER']);
        }
}