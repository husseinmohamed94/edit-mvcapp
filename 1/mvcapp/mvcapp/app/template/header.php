<header class="main text-right">
    <div class="container-fluid">

            <h1 >
                <a href="/mvcapp/public/index.php">
                 <?= $text_deshboard ?>
                    <?php if(isset($title)): ?>
                    <?=  ' > ' .  $title ?>
                    <?php endif; ?>
                </a>
            </h1>
        <div class="user_menu_container ">
            <a href="javascript:;" class="language_switch user">
                <span><?=  $text_welcome ?> </span>
                <i class="material-icons">keyboard_arrow_down</i>
            </a>
            <ul class="user_menu">
                <li><a href="" ><i class="fa fa-user"></i> <?= $text_profile ?></a></li>
                <li><a href="" ><i class="fa fa-key"></i> <?= $text_change_password ?> </a></li>
                <li><a href="" ><i class="fa fa-gear"></i>  <?= $text_account_settings?>   </a></li>
                <li><a href="" ><i class="fa fa-sign-out"> </i> <?= $text_log_out ?> </a></li>
            </ul>
        </div>
            <div class="user_menu_container2">
                <a href=  "/mvcapp/public/index.php/langauge/" class="language_switch"><span></span> <i class="fa fa-globe"> <span> <?= $_SESSION['lang'] == 'ar' ? 'En' : 'عربي' ?></span></i></a>
                <a href="javascript:;" class="language_switch notifications"><i class="fa fa-bell"></i></a>
                <a href="/mssages" class="language_switch"><i class="fa fa-envelope"> </i> </a>



        </div>



        <!--
        <div class="user_menu_container ">
            <a href="javascript:;" class="language_switch user">
                <span>مرحبا حسين</span>
                <i class="material-icons">keyboard_arrow_down</i>
            </a>
            <ul class="user_menu">
                <li><a href="/"><i class="fa fa-user"></i>اهلا حسين</a></li>
                <li><a href="/"><i class="fa fa-key"></i>باسةرد</a></li>
                <li><a href="/"><i class="fa fa-gear">اسمم</a></li>
                <li><a href="/auth/logout"><i class="fa fa-sign-out"></i>تسجيل الخروج</a></li>
            </ul>


        </div>
        <a href="/messages" class="language_switch"><i class="fa fa-envelope"></i></a>
        <a href="javascript:;" class="language_switch notifications"><i class="fa fa-bell"></i></a>
        <a href="/language" class="language_switch"><span></span> <i class="fa fa-globe"></i></a>
        -->
    </div>

</header>