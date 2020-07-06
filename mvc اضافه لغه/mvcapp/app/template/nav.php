
<nav class="navbar info-nav text-center navbar-light main_navigation ">

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse info-div-nav navbar-collapse " id="navbarNavDropdown">
        <div class="employee_info">
        <div class="profile_picture">
            <img class="" src="/mvcapp/public/img/user.png" alt="User Profile Picture"/>

        </div>


            <span class="name">حسين محمد</span>
            <span class="privilege"><?= $text_app_manger ?></span>
        </div>

        <ul class="navbar-nav list-unstyled text-right  app_navigation">
            <li class="  "> <a href=""><i class="fa  fa-dashboard "> </i>  <?= $text_general_statidtics ?></a></li>
            <li class=''><a href= "/mvcapp/public/index.php/users"><i class="fa fa-group"> </i> <?= $text_users ?>
                </a>

            </li>

            <li><a href= "/mvcapp/public/index.php/auth/logout"><i class="fa fa-sign-out"></i> <?= $text_log_out ?> </a></li>

        </ul>


    </div>

</nav>



<div class="action_view">
