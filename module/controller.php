<?php 
require_once("../include/initialize.php");
$action = (isset($_GET['action']) && $_GET['action'] != '') ? $_GET['action'] : '';

switch ($action) {
    case 'updatecountattemp':
        doupdatecountattemp();
        break;
}
function doupdatecountattemp(){
    global $mydb;
    $query = "UPDATE `loginattemp` SET ATTEMPCOUNT = 0 WHERE IPADDRESS = :ipaddress";
    $istrue = $mydb->InsertThis($query, [
        ':ipaddress' => $_POST['IPADDRESS'],
    ]);
    unset($_SESSION['accesscount']);
    echo $istrue;
}
?>