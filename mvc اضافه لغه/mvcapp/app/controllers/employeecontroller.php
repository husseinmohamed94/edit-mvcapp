<?php


namespace PHPMVC\Controllers;


use PHPMVC\LIB\Helper;
use PHPMVC\LIB\InputFilter;
use PHPMVC\Models\EmployeeModel;

class EmployeeController extends AbstractController
{
    use InputFilter;
    use Helper;

    public function defaultAction()
    {

        $this->_language->load('employee.default');

        $this->_data['employees'] = EmployeeModel::getAll();
       $this->_view();
      // $this->_language->load('template.common');
    }

    public function addAction()
    {
        $this->_language->load('template.common');
        if (isset($_POST['submit'])) {
            $emp = new EmployeeModel();
            $emp->name = $this->filterString($_POST['name']);
            $emp->age = $this->filterInt($_POST['age']);
            $emp->address = $this->filterString($_POST['address']);
            $emp->salary = $this->filterFLOAT($_POST['salary']);
            $emp->tax = $this->filterFLOAT($_POST['tax']);
            if ($emp->save()) {
                $_SESSION['message'] = 'employee saving successfully';
                $this->redirect("/mvcapp/public/index.php/employee");

            }


        }

        $this->_view();
    }

    public function editAction()
    {

        $id = $this->filterInt($this->_params[0]);
        $emp = EmployeeModel::getByPK($id);
        if ($emp === false) {
            $this->redirect('/mvcapp/public/index.php/employee');
        }

        $this->_language->load('template.common');
        $this->_data['employee'] = $emp;

        if (isset($_POST['submit'])) {
            $emp->name = $this->filterString($_POST['name']);
            $emp->age = $this->filterInt($_POST['age']);
            $emp->address = $this->filterString($_POST['address']);
            $emp->salary = $this->filterFLOAT($_POST['salary']);
            $emp->tax = $this->filterFLOAT($_POST['tax']);
            if ($emp->save()) {
                $_SESSION['message'] = 'employee saving successfully';
                $this->redirect('/mvcapp/public/index.php/employee');
            }


        }

        $this->_view();
    }



    public function deleteAction()
    {
        $id = $this->filterInt($this->_params[0]);
        $emp = EmployeeModel::getByPK($id);
        if ($emp === false) {
            $this->redirect( '/mvcapp/public/index.php/employee');
        }

            if ($emp->delete()) {
                $_SESSION['message'] = 'employee delete successfully';
                $this->redirect('/mvcapp/public/index.php/employee');
            }


    }







}