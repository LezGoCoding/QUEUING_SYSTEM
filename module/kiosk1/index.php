<?php
require_once("../../include/initialize.php");

    $routes = [
        'kiosk1' => 'list.php'
    ];
    $ParamConfig = [
       // 'view' => ['id']
     // 'list, view' => ['id', 'no']
   ];
   $routeHandler = new RouteHandler($routes, 'kiosk1', $ParamConfig);
   $content = $routeHandler->handleRouteAndContent();
   $routeHandler->addToGet();
   require_once("../../theme/template.php");
?>