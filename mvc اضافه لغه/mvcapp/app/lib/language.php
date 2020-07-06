<?php


namespace PHPMVC\LIB;


class Language
{
        private $dictionary = [];
        public function load($path){
        $defaultlanguage = APP_DEFAULT_LANGUAGE ;
        if (isset($_SESSION['lang'])){
            $defaultlanguage = $_SESSION['lang'];
        }
         $pathArray = explode('.',$path);
         $languageFileToLoad =  LANGUAGES_PATH . $defaultlanguage . DS . $pathArray[0] . DS .$pathArray[1] . '.lang.php';
         $languageFileContent = file_get_contents($languageFileToLoad);
            if (file_exists($languageFileToLoad)){
                require $languageFileToLoad;
               if (is_array($_) && !empty($_)){
                    foreach ($_ as $key => $value){
                        $this->dictionary[$key] = $value;



                    }

               }else{
                   trigger_error('sorry the language filr' . $path . 'doens\'t exists' . E_USER_WARNING);
               }

            }


        }

        public function  getDictionary(){
       return  $this->dictionary;
        }


}