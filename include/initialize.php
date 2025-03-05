<?php
/**
* Description:	This includes for basic and core configurations.
* Author:		Joken Villanueva
* Date Created:	october 27, 2013
* Revised By:	Joken E. Villanueva
* Revised Date: August 16, 2024	
*/

require_once(__DIR__ . '/../config/config.php');

session_start();

function autoload_class($class_name) {
	$class_name = strtolower($class_name);
	$path = LIB_PATH . DS . "{$class_name}.php";

	if (file_exists($path)) {
	    require_once($path);
	} else {
	    error_log("The file {$class_name}.php could not be found.");
	    die("The file {$class_name}.php could not be found.");
	}
}

// Register the new autoloading function
spl_autoload_register('autoload_class');

/**
 * Generate and store a CSRF token in the session.
 */
function generateCsrfToken() {
    if (empty($_SESSION['csrf_token'])) {
        $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
    }
    return $_SESSION['csrf_token'];
}

/**
 * Embed CSRF token in a form.
 */
function csrfTokenField() {
    $csrf_token = generateCsrfToken();
    return '<input type="hidden" name="csrf_token" value="' . htmlspecialchars($csrf_token) . '">';
}

/**
 * Validate the CSRF token from a submitted form.
 */
function validateCsrfToken() {
    if (isset($_POST['csrf_token']) && isset($_SESSION['csrf_token'])) {
        $isValid = hash_equals($_SESSION['csrf_token'], $_POST['csrf_token']);
        return $isValid;
    }
    return false;
}

function resetCsrfToken() {
    unset($_SESSION['csrf_token']); // Unset after validation
}


require_once(LIB_PATH . DS . "functions.php");
require_once(LIB_PATH . DS . "session.php");
require_once(LIB_PATH . DS . "database.php");
require_once(LIB_PATH . DS . "routerhandler.php");
require_once(LIB_PATH . DS . "router.php");

?>