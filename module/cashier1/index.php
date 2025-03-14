<?php
require_once("../../include/initialize.php");

if (!isset($_SESSION['ACCOUNT_ID'])) {
    header("Location: ".WEB_ROOT.'login.php');
} else {

    $routes = [
        'cashier1' => 'list.php'
    ];
    $ParamConfig = [
       // 'view' => ['id']
     // 'list, view' => ['id', 'no']
   ];
   $routeHandler = new RouteHandler($routes, 'cashier1', $ParamConfig);
   $content = $routeHandler->handleRouteAndContent();
   $routeHandler->addToGet();
   require_once("../../theme/template.php");
}

?>