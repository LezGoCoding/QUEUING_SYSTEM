<?php

  function configure_session() {

      // Regenerate session ID to prevent session fixation
      if (!isset($_SESSION['initiated'])) {
          session_regenerate_id(true); // Regenerate session ID to prevent fixation attacks
          $_SESSION['initiated'] = true;
      }

      // Set session timeout to 30 minutes
      $inactive = 1800; // 1800 for 30 minutes in seconds
      if (isset($_SESSION['last_activity']) && (time() - $_SESSION['last_activity'] > $inactive)) {
          // If the user has been inactive for 30 minutes, log them out
          session_unset();     // Unset $_SESSION variable
          session_destroy();   // Destroy session data
          header("Location: /module/login.php");
          exit;
      }
      $_SESSION['last_activity'] = time(); // Update last activity time
  }

  // Call the configuration function
  configure_session();

  //this function if session member is not set then it will be redirected to login.php
  function confirm_logged_in() {
    if (!logged_in()) {?>

      <script type="text/javascript">
        window.location = "module/login.php";
      </script>

      <?php
    }
  }
  
  function admin_confirm_logged_in() {
    if (@!$_SESSION['ADACCOUNT_ID']) {?>
      <script type="text/javascript">
        window.location ="module/login.php";
      </script>

      <?php
    }
  }

  function studlogged_in() {
    return isset($_SESSION['ADACCOUNT_ID']);

  }
  function studconfirm_logged_in() {
    if (!studlogged_in()) {?>
      <script type="text/javascript">
        window.location = "index.php";
      </script>

      <?php
    }
  }

  function message($msg="", $msgtype="") {
    if(!empty($msg)) {
      // then this is "set message"
      // make sure you understand why $this->message=$msg wouldn't work
      $_SESSION['message'] = $msg;
      $_SESSION['msgtype'] = $msgtype;
    } else {
      // then this is "get message"
      return $message;
    }
  }

  // Check and display session message
  function check_message() {
    if (isset($_SESSION['message'])) {
      $message = $_SESSION['message'];
      $msgtype = $_SESSION['msgtype'];
      unset($_SESSION['message']);
      unset($_SESSION['msgtype']);

      echo '<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>';
      echo '<script>';
      echo '$(document).ready(function() {';
      echo 'var message = "' . htmlspecialchars($msgtype) . '";';
      echo 'var text = "' . htmlspecialchars($message) . '";';
        echo 'var icon = "", title = "";'; // Initialize variables properly
        
        echo 'switch (message) {';
        echo '    case "info":';
        echo '        icon = "info";';
        echo '        title = "Information";';
        echo '        break;';
        echo '    case "success":';
        echo '        icon = "success";';
        echo '        title = "Success";';
        echo '        break;';
        echo '    case "error":';
        echo '        icon = "error";';
        echo '        title = "Error";';
        echo '        break;';
        echo '    case "warning":';
        echo '        icon = "warning";';
        echo '        title = "Warning";';
        echo '        break;';
        echo '    default:';
        echo '        icon = "info";';
        echo '        title = "Notification";';
        echo '        break;';
        echo '}';
        
        echo 'Swal.fire({';
        echo 'icon: icon,';
        echo 'title: title,';
        echo 'text: text,';
        echo 'toast: true,';
        echo 'position: "top-end",';
        echo 'showConfirmButton: false,';
        echo 'timer: 3000';
        echo '});';
        echo '});';
        echo '</script>';
      }
    }
?>