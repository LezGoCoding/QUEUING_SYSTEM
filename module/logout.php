<?php 
require_once '../include/initialize.php';

DoRecordLogs("Logout to the system.","LOGOUT");
unset($_SESSION['ACCOUNT_ID'] );
unset($_SESSION['ACCOUNT_NAME'] );
unset($_SESSION['ACCOUNT_USERNAME'] );
unset($_SESSION['EMPID'] );

header('Location: ../module/login.php');
exit;
?>
