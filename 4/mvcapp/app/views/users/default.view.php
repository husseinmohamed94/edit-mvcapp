<h2 class="btn btn-info"><?=  $text_header ?></h2>

<div class="container">

    <a href="http://localhost/mvcapp/public/index.php/users/create " class="button"><i class="fa fa-plus"></i> <?= $text_new_item?></a>
       <table class="data">
           <thead>
           <tr>
               <th><?= $text_table_username ?></th>
               <th><?= $text_table_group ?></th>
               <th><?= $text_table_email ?></th>
               <th><?= $text_table_subscription_date ?></th>
               <th><?= $text_table_last_login ?></th>
               <th><?= $text_table_control ?></th>

           </tr>
           </thead>
            <tbody>
                <?php if(false !==$users) : foreach ($users as $user) : ?>
                   <tr>
                       <td><?= $user->Username ?></td>
                       <td><?= $user->GroupName ?></td>
                       <td><?= $user->email ?></td>
                       <td><?= $user->subscriptionDate  ?></td>
                       <td><?= $user->lastlogin ?></td>
                        <td>

                        </td>
                   </tr>
            <?php endforeach; endif; ?>
            </tbody>

       </table>

</div>