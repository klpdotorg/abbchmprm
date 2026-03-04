<?php
// session_start();
if (session_status() === PHP_SESSION_NONE) {
  session_start();
}

if (!isset($_SESSION['EMRP_BASE_DIR'])) {
  echo $app_strings['ERRMSG_INVALIDSESSION'];
  exit();
}
require_once($_SESSION['EMRP_BASE_DIR'] . "/app/boot/checksandincludes.php");

class auth_helper
{

  private $logmgr;
  private $app_user_dao;
  private $auth_passwordmgr;
  private $auth_dao;
  private $app_dao;

  function __construct()
  {

    $this->logmgr = logMgr::getInstance();
    $this->app_user_dao = new app_user_dao();
    $this->auth_passwordmgr = new auth_passwordmgr();
    $this->auth_dao = new auth_dao();
    $this->app_dao = new app_dao();
  }

  function validateLoginForm(&$objCredentials)
  { // object passed as reference.

    $auth_formvalidator = new  auth_serverside_formvalidator();
    $errmsg = $auth_formvalidator->validateInputs_LoginForm($objCredentials);

    return $errmsg;
  }

  function validateForgotPasswordForm(&$arrForgotPasswordCredentials)
  { // object passed as reference.

    $auth_formvalidator = new  auth_serverside_formvalidator();
    $errmsg = $auth_formvalidator->validateInputs_ForgotPasswordForm($arrForgotPasswordCredentials);

    return $errmsg;
  }


  // check if the username-password combination  is valid
  // return 'true' if valid. return 'false' otherwise
  // if authentication is successful, set user_id in SESSION
  function authenticate($username, $password_input)
  {

    //$_SESSION['a3portal_userid'] = 100;
    //return true; // will do the auth later - suresh 7/mar/18

    //   $userexists = $this->app_dao->checkIfEmailExists($username);
    $userexists = $this->auth_dao->isEmailValid($username, null);


    if (!$userexists) {
      return false;  // authentication failed
    }

    $user_id = $this->app_user_dao->getUserIdByEmailId($username);

    $password_stored = $this->app_user_dao->getPasswordByUserId($user_id);
    $password_valid = $this->auth_passwordmgr->checkMatch($password_input, $password_stored);
    //   echo crypt("ABC");
    if (!$password_valid) {
      return false; // authentication failed
    }

    // authentication successful. Set user_id in SESSION

    session_regenerate_id(true); // prevent session fixation

    $_SESSION['a3portal_userid'] = $user_id;

    return true;
  }


  function confirmUser($user_id, $email_id)
  {

    return   $this->auth_dao->confirmUser($user_id, $email_id);
  }

  function activateUser($user_id)
  {

    $this->auth_dao->activateUser($user_id);
  }

  function checkIfEmailExists($email)
  {
    return $this->auth_dao->isEmailValid($email, null);
  }

  function resetForgotPasswordFlow($email)
  {

    $user_id = $this->app_user_dao->getUserIdByEmailId($email);

    // Generate new password
    $new_password = $this->auth_passwordmgr->generatePassword();

    // Reset password
    $this->auth_passwordmgr->resetForgotPassword($user_id, $new_password);

    // OPTIONAL: Send email here
    // mail($email, "Password Reset", "Your new password is: ".$new_password);

    return $new_password;
  }
}
