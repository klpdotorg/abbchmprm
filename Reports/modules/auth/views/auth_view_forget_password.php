<?php

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

class auth_view_forget_password
{
    function show($args = "", $arrErrorMsg = "")
    {
        global $cfg_authcontroller;
?>

        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Forgot Password - EMRP Reports Portal</title>

            <?php
            include($_SESSION['EMRP_BASE_DIR'] . "/app/views/includes/emrp_header.php");
            ?>
        </head>

        <body>
            <div style="background-image:url('<?php
                                                global $_app_bootstrapdir_url;
                                                echo $_app_bootstrapdir_url; ?>/assets/img/homescr_bg.png');
        height:650px;
        background-position:center;
        background-size:cover;
        background-repeat:no-repeat;">

                <div class="d-flex justify-content-center align-items-center"
                    style="height:inherit;width:100%;position:absolute;left:0;
         background-color:rgba(30,41,99,0.53);">

                    <div class="login-card" style="font-family:Roboto, sans-serif;">

                        <p class="profile-name-card">
                            <i class="fa fa-key"
                                style="font-size:56px;color:rgb(104,145,162);"></i>
                        </p>

                        <form class="form-signin"
                            action="<?php echo $_SESSION['EMRP_BASE_URL']; ?>modules/auth/auth_controller.php"
                            method="post">



                            <span class="reauth-email" style="margin:11px;"></span>

                            <input class="form-control"
                                type="email"
                                required
                                placeholder="Enter your registered email"
                                name="inputEmail"
                                id="inputEmail">

                            <?php if (!empty($arrErrorMsg)) { ?>
                                <div class="text-danger text-center mt-2">
                                    <?php
                                    foreach ($arrErrorMsg as $err) {
                                        echo $err;
                                        break;
                                    }
                                    ?>
                                </div>
                            <?php } ?>

                            <button class="btn btn-primary btn-block btn-lg btn-signin mt-3"
                                type="submit">
                                Send Reset Link
                            </button>

                            <input type="hidden"
                                name="taskname"
                                value="reset_user_forgot_password">

                        </form>

                        <p class="text-center mt-3" style="font-size:13px;">
                            <a href="<?php
                                        echo $_SESSION['EMRP_BASE_URL'] . $cfg_authcontroller . '?taskname=show_login';
                                        ?>">
                                Back to Login
                            </a>
                        </p>

                    </div>

                    <div class="d-flex align-items-center order-12" style="height:200px;">
                        <div class="container">
                            <h1 class="text-center"
                                style="color:#f2f5f8;font-size:56px;font-weight:bold;">
                                EasyMath
                            </h1>
                            <h1 class="text-center"
                                style="color:#f2f5f8;font-weight:normal;">
                                Reports Portal
                            </h1>
                        </div>
                    </div>

                </div>
            </div>

            <?php
            include($_SESSION['EMRP_BASE_DIR'] . "/app/views/includes/include_scripts.php");
            ?>

        </body>

        </html>

<?php
    }
}
?>