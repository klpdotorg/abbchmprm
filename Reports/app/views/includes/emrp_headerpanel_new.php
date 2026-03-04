<?php
// Modern header panel - preserves original logic and links
?>
<style>
  .emrp-topbar{background:linear-gradient(90deg,#0d4b7e 0%,#49a3ea 50%,#2c72b4 100%);padding:8px 0;color:#fff}
  .emrp-logo{height:64px;width:auto}
  .emrp-avatar{height:48px;width:48px;border-radius:50%;object-fit:cover}
  .emrp-username{color:#fff;margin-right:8px}
  /* Navbar styles: white background and darker link color for contrast */
  .emrp-navbar{background:#ffffff;border-top:0;border-bottom:4px solid rgba(0,0,0,0.04);box-shadow:0 2px 6px rgba(0,0,0,0.05);}
  .emrp-navbar .nav-link{color:#0b63a7!important;padding:8px 12px;font-weight:500}
  .emrp-navbar .nav-link:hover{color:#084a78!important}
  .emrp-navbar .navbar-brand{color:#fff;font-weight:600}
  /* Mobile menu background */
  #emrpMobileMenu .bg-light{background:#fff}
  @media(max-width:767px){.emrp-logo{height:48px}}
</style>

<header class="emrp-topbar">
  <div class="container-fluid">
    <div class="d-flex align-items-center justify-content-between">
      <div class="d-flex align-items-center">
        <a class="navbar-brand d-flex align-items-center" href="#">
          <img src="<?php echo $_app_bootstrapdir_url; ?>/assets/img/logo.png" class="emrp-logo" alt="logo">
        </a>
      </div>

      <div class="d-none d-md-block">
        <div class="dropdown">
          <button class="btn btn-link text-white d-flex align-items-center" id="emrpUserBtn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <span class="emrp-username">User Name</span>
            <img src="<?php echo $_SESSION['EMRP_BASE_URL']; ?>/app/views/images/avatar2.png" alt="My Account" class="emrp-avatar">
          </button>
          <div class="dropdown-menu dropdown-menu-right" aria-labelledby="emrpUserBtn">
            <a class="dropdown-item" href="#">Profile</a>
            <a class="dropdown-item" href="#">Change Password</a>
            <a class="dropdown-item" href="<?php echo $_SESSION['EMRP_BASE_URL']; ?><?php global $cfg_logincontroller; echo $cfg_logincontroller; ?>?taskname='show_login'">Logout</a>
          </div>
        </div>
      </div>

      <div class="d-md-none">
        <button class="btn btn-link text-white" type="button" data-toggle="collapse" data-target="#emrpMobileMenu" aria-expanded="false">Menu</button>
      </div>
    </div>
  </div>

  <nav class="navbar navbar-expand-md emrp-navbar mt-2 navbar-light">
    <div class="container">
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main-nav-new" aria-controls="main-nav-new" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="main-nav-new">
        <ul class="navbar-nav mr-auto nav-fill w-100">
          <li class="nav-item"><a class="nav-link" href="<?php echo $_SESSION['EMRP_BASE_URL']; ?><?php global $cfg_chmhomecontroller; echo $cfg_chmhomecontroller; ?>?taskname='show_homepage'">CHMM Dashboard</a></li>
          <li class="nav-item"><a class="nav-link" href="<?php echo $_SESSION['EMRP_BASE_URL']; ?><?php global $cfg_chmreportscontroller; echo $cfg_chmreportscontroller; ?>?taskname='show_reports_reportshome'">CHM Reports</a></li>
          <li class="nav-item"><a class="nav-link" href="<?php echo $_SESSION['EMRP_BASE_URL']; ?><?php global $cfg_chmchartscontroller; echo $cfg_chmchartscontroller; ?>?taskname='show_chartshome'">CHM Charts</a></li>
          <li class="nav-item"><a class="nav-link" href="<?php echo $_SESSION['EMRP_BASE_URL']; ?><?php global $cfg_prmhomecontroller; echo $cfg_prmhomecontroller; ?>?taskname='show_homepage'">PRM Dashboard</a></li>
          <li class="nav-item"><a class="nav-link" href="<?php echo $_SESSION['EMRP_BASE_URL']; ?><?php global $cfg_prmreportscontroller; echo $cfg_prmreportscontroller; ?>?taskname='show_reports_reportshome'">PRM Reports</a></li>
          <li class="nav-item"><a class="nav-link" href="<?php echo $_SESSION['EMRP_BASE_URL']; ?><?php global $cfg_prmchartscontroller; echo $cfg_prmchartscontroller; ?>?taskname='show_chartshome'">PRM Charts</a></li>
        </ul>
      </div>
    </div>
  </nav>

</header>

<!-- Mobile dropdown menu (keeps same items for small screens) -->
<div class="collapse" id="emrpMobileMenu">
  <div class="bg-light p-2">
    <a class="d-block py-1" href="#">Profile</a>
    <a class="d-block py-1" href="#">Change Password</a>
    <a class="d-block py-1" href="<?php echo $_SESSION['EMRP_BASE_URL']; ?><?php global $cfg_logincontroller; echo $cfg_logincontroller; ?>?taskname='show_login'">Logout</a>
  </div>
</div>
