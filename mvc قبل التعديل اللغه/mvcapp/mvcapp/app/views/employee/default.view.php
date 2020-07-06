
<div class="wrapper">
    <?php if(isset( $_SESSION['message'])) { ?>

        <P class="message <?= isset($error) ? 'error' : ' '  ?> "> <?=   $_SESSION['message']  ?> </P>

        <?php
        unset($_SESSION['message']);
    } ?>

    <div class="employees">
        <a href="/mvcapp/public/index.php/employee/add">add employee</a>
        <table class="data">
            <thead>
            <tr>
                <th>ID</th>
                <th>name</th>
                <th>age</th>
                <th>adders</th>
                <th>salary</th>
                <th>tax%</th>
                <th>control</th>
            </tr>

            </thead>
            <tbody>
            <?php

            if(false !== $employees){
                foreach ($employees as $employee){
                    ?>
                    <tr>
                        <td><?= $employee->id ?> </td>
                        <td><?= $employee->name ?></td>
                        <td><?= $employee->age ?></td>
                        <td><?= $employee->address ?></td>
                        <td><?= $employee->salary ?> L.E</td>
                        <td><?= $employee->tax ?></td>
                        <td>
                            <a href="/mvcapp/public/index.php/employee/edit/<?= $employee->id  ?> "  > edit </a>
                            <a href="/mvcapp/public/index.php/employee/delete/<?= $employee->id ?>" onclick="if(!confirm('Do uou want to delete this employee ')) return false ; " >delete </a>
                        </td>
                    </tr>
                    <?php

                }
            }else{
                ?>
                <td colspan="7" ><p>sorry no employees to list</p></td>
                <?php

            }
            ?>
            </tbody>


        </table>
    </div>

</div></table>