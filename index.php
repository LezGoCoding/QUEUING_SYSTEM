<?php
    require_once("include/initialize.php");
    global $mydb;

    if (!isset($_SESSION['ACCOUNT_ID'])) {
        header("Location: module/login.php");
        exit();
    } 

    $routes = [];

    if (isset($_SESSION['ACCOUNT_USERNAME'])) {
        $username = $_SESSION['ACCOUNT_USERNAME'];

        // Role-based redirection
        switch ($username) {
            case 'admin':
                $routes = ['dashboard' => 'module/admin_dashboard.php'];
                break;
            case 'kiosk1':
                $routes = ['dashboard' => 'module/kiosk1_dashboard.php'];
                break;
            case 'cashier1':
                $routes = ['dashboard' => 'module/cashier1_dashboard.php'];
                break;
            case 'cashier2':
                $routes = ['dashboard' => 'module/cashier2_dashboard.php'];
                break;
            case 'cashier3':
                $routes = ['dashboard' => 'module/cashier3_dashboard.php'];
                break;
            default:
                $routes = ['dashboard' => 'module/general_dashboard.php']; // Default for other users
                break;
        }
        
    } else {
        $routes = ['dashboard' => 'module/general_dashboard.php'];
    }

    $routeHandler = new RouteHandler($routes, 'dashboard');
    $content = $routeHandler->handleRouteAndContent();
    $routeHandler->addToGet();

    require_once("theme/template.php");
?>
