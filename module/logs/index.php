<?php
    require_once("../../include/initialize.php");

    if (!isset($_SESSION['ACCOUNT_ID'])) {
        header("Location: module/login.php");
    } else {
      
    $routes = [
        'list' => 'list.php'
    ];

    $routeHandler = new RouteHandler($routes, 'list');
    $content = $routeHandler->handleRouteAndContent();
    $routeHandler->addToGet();

    require_once("../../theme/template.php");
    }
?>