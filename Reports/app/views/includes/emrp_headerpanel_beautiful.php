<?php
// Beautiful header panel with all existing functionality and better design
$_app_bootstrapdir_url = isset($_app_bootstrapdir_url) ? $_app_bootstrapdir_url : '/app';
$_SESSION['EMRP_BASE_URL'] = isset($_SESSION['EMRP_BASE_URL']) ? $_SESSION['EMRP_BASE_URL'] : '';

// Navigation controllers
global $cfg_chmhomecontroller, $cfg_chmreportscontroller, $cfg_chmchartscontroller;
global $cfg_prmhomecontroller, $cfg_prmreportscontroller, $cfg_prmchartscontroller, $cfg_logincontroller;
?>

<!-- Beautiful Header Panel -->
<div class="emrp-beautiful-header-wrapper">
  <!-- Top Section: Logo + User Account Dropdown -->
  <div class="emrp-header-top" style="background:linear-gradient(to right, rgb(13,75,126) 0%, rgb(73,155,234) 49%, rgb(44,114,180) 100%); padding: 12px 20px; display: flex; align-items: center; justify-content: space-between; color: white;">
    <img src="<?php echo $_app_bootstrapdir_url; ?>/assets/img/logo.png" alt="Logo" style="width:75px; height:auto; object-fit: contain;">
    
    <div class="emrp-dropdown-container" style="position: relative;">
      <button class="emrp-user-btn" id="emrp-user-dropdown-btn" onclick="toggleEmrpDropdown()" style="background: transparent; border: none; color: white; padding: 10px 15px; cursor: pointer; display: flex; align-items: center; gap: 10px; border-radius: 8px; transition: background 0.2s;" onmouseover="this.style.background='rgba(255,255,255,0.1)'" onmouseout="this.style.background='transparent'">
        <span style="font-weight: 500;">User Name</span>
        <img src="<?php echo $_SESSION['EMRP_BASE_URL']; ?>/app/views/images/avatar2.png" alt="Avatar" style="width: 50px; height: 50px; border-radius: 50%; border: 2px solid rgba(255,255,255,0.3); object-fit: cover;">
      </button>
      
      <div class="emrp-dropdown-menu" id="emrp-dropdown-menu" style="display: none; position: absolute; right: 0; top: 65px; background: white; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.15); z-index: 1000; min-width: 220px;">
        <a href="#" class="emrp-dropdown-item" style="display: block; padding: 12px 16px; color: #333; text-decoration: none; border-bottom: 1px solid #f0f0f0; transition: background 0.2s;" onclick="return false;" onmouseover="this.style.background='#f5f5f5'" onmouseout="this.style.background='transparent'">Profile</a>
        <a href="#" class="emrp-dropdown-item" style="display: block; padding: 12px 16px; color: #333; text-decoration: none; border-bottom: 1px solid #f0f0f0; transition: background 0.2s;" onclick="return false;" onmouseover="this.style.background='#f5f5f5'" onmouseout="this.style.background='transparent'">Change Password</a>
        <a href="<?php echo $_SESSION['EMRP_BASE_URL']; ?><?php echo (isset($cfg_logincontroller) ? $cfg_logincontroller : ''); ?>?taskname='show_login'" class="emrp-dropdown-item" style="display: block; padding: 12px 16px; color: #e74c3c; text-decoration: none; font-weight: 500; transition: background 0.2s;" onmouseover="this.style.background='#fef5f5'" onmouseout="this.style.background='transparent'">Logout</a>
      </div>
    </div>
  </div>

  <!-- Navigation Bar -->
  <div class="emrp-navbar" style="background-color: #1a1a1a; padding: 0;">
    <div style="display: flex; align-items: center; max-width: 100%;">
      <button class="emrp-menu-toggle" id="emrp-menu-toggle" onclick="toggleEmrpMenu()" style="display: none; background: none; border: none; color: white; font-size: 24px; padding: 12px; cursor: pointer; margin-right: 10px;">☰</button>
      
      <nav class="emrp-nav-menu" id="emrp-nav-menu" style="display: flex; width: 100%; margin: 0; padding: 0; list-style: none;">
        <a href="<?php echo $_SESSION['EMRP_BASE_URL']; ?><?php echo (isset($cfg_chmhomecontroller) ? $cfg_chmhomecontroller : ''); ?>?taskname='show_homepage'" class="emrp-nav-link" style="color: white; text-decoration: none; padding: 15px 18px; display: block; border-bottom: 3px solid transparent; transition: all 0.2s; flex: 1; text-align: center; font-weight: 500; border-right: 1px solid #333;" onmouseover="this.style.borderBottomColor='#4da6ff'; this.style.backgroundColor='rgba(255,255,255,0.05)'" onmouseout="this.style.borderBottomColor='transparent'; this.style.backgroundColor='transparent'">CHM Dashboard</a>
        
        <a href="<?php echo $_SESSION['EMRP_BASE_URL']; ?><?php echo (isset($cfg_chmreportscontroller) ? $cfg_chmreportscontroller : ''); ?>?taskname='show_reports_reportshome'" class="emrp-nav-link" style="color: white; text-decoration: none; padding: 15px 18px; display: block; border-bottom: 3px solid transparent; transition: all 0.2s; flex: 1; text-align: center; font-weight: 500; border-right: 1px solid #333;" onmouseover="this.style.borderBottomColor='#4da6ff'; this.style.backgroundColor='rgba(255,255,255,0.05)'" onmouseout="this.style.borderBottomColor='transparent'; this.style.backgroundColor='transparent'">CHM Reports</a>
        
        <a href="<?php echo $_SESSION['EMRP_BASE_URL']; ?><?php echo (isset($cfg_chmchartscontroller) ? $cfg_chmchartscontroller : ''); ?>?taskname='show_chartshome'" class="emrp-nav-link" style="color: white; text-decoration: none; padding: 15px 18px; display: block; border-bottom: 3px solid transparent; transition: all 0.2s; flex: 1; text-align: center; font-weight: 500; border-right: 1px solid #333;" onmouseover="this.style.borderBottomColor='#4da6ff'; this.style.backgroundColor='rgba(255,255,255,0.05)'" onmouseout="this.style.borderBottomColor='transparent'; this.style.backgroundColor='transparent'">CHM Charts</a>
        
        <a href="<?php echo $_SESSION['EMRP_BASE_URL']; ?><?php echo (isset($cfg_prmhomecontroller) ? $cfg_prmhomecontroller : ''); ?>?taskname='show_homepage'" class="emrp-nav-link" style="color: white; text-decoration: none; padding: 15px 18px; display: block; border-bottom: 3px solid transparent; transition: all 0.2s; flex: 1; text-align: center; font-weight: 500; border-right: 1px solid #333;" onmouseover="this.style.borderBottomColor='#4da6ff'; this.style.backgroundColor='rgba(255,255,255,0.05)'" onmouseout="this.style.borderBottomColor='transparent'; this.style.backgroundColor='transparent'">PRM Dashboard</a>
        
        <a href="<?php echo $_SESSION['EMRP_BASE_URL']; ?><?php echo (isset($cfg_prmreportscontroller) ? $cfg_prmreportscontroller : ''); ?>?taskname='show_reports_reportshome'" class="emrp-nav-link" style="color: white; text-decoration: none; padding: 15px 18px; display: block; border-bottom: 3px solid transparent; transition: all 0.2s; flex: 1; text-align: center; font-weight: 500; border-right: 1px solid #333;" onmouseover="this.style.borderBottomColor='#4da6ff'; this.style.backgroundColor='rgba(255,255,255,0.05)'" onmouseout="this.style.borderBottomColor='transparent'; this.style.backgroundColor='transparent'">PRM Reports</a>
        
        <a href="<?php echo $_SESSION['EMRP_BASE_URL']; ?><?php echo (isset($cfg_prmchartscontroller) ? $cfg_prmchartscontroller : ''); ?>?taskname='show_chartshome'" class="emrp-nav-link" style="color: white; text-decoration: none; padding: 15px 18px; display: block; border-bottom: 3px solid transparent; transition: all 0.2s; flex: 1; text-align: center; font-weight: 500;" onmouseover="this.style.borderBottomColor='#4da6ff'; this.style.backgroundColor='rgba(255,255,255,0.05)'" onmouseout="this.style.borderBottomColor='transparent'; this.style.backgroundColor='transparent'">PRM Charts</a>
      </nav>
    </div>
  </div>

  <!-- Blue Line Below Header -->
  <div style="background-color: #0000FF; height: 3px; width: 100%;"></div>
</div>

<style>
  .emrp-beautiful-header-wrapper {
    font-family: Segoe UI, Roboto, Arial, sans-serif;
  }
  
  .emrp-dropdown-menu a:last-child {
    border-bottom: none;
  }
  
  @media (max-width: 768px) {
    .emrp-menu-toggle {
      display: block !important;
    }
    
    .emrp-nav-menu {
      display: none !important;
      flex-direction: column !important;
      position: absolute;
      top: calc(75px + 100%);
      left: 0;
      right: 0;
      background-color: #1a1a1a;
      width: 100%;
      z-index: 999;
    }
    
    .emrp-nav-menu.active {
      display: flex !important;
    }
    
    .emrp-nav-link {
      border-right: none !important;
      border-bottom: 1px solid #333 !important;
    }
  }
</style>

<script>
  function toggleEmrpDropdown() {
    const menu = document.getElementById('emrp-dropdown-menu');
    if (menu) {
      menu.style.display = menu.style.display === 'none' ? 'block' : 'none';
    }
  }
  
  function toggleEmrpMenu() {
    const menu = document.getElementById('emrp-nav-menu');
    if (menu) {
      menu.classList.toggle('active');
    }
  }
  
  // Close dropdown when clicking outside
  document.addEventListener('click', function(event) {
    const dropdown = document.getElementById('emrp-dropdown-menu');
    const btn = document.getElementById('emrp-user-dropdown-btn');
    if (dropdown && btn && !dropdown.contains(event.target) && !btn.contains(event.target)) {
      dropdown.style.display = 'none';
    }
  });
</script>
