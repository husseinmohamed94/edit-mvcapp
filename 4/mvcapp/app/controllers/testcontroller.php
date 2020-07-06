<?php

namespace PHPMVC\Controllers;

use PHPMVC\LIB\validate;

class TestController extends AbstractController
{
    use validate;
    public function defaultAction()
    {
        echo  password_hash('encryptedkey',CRYPT_BLOWFISH);
    }


}