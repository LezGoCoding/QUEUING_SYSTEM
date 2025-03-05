<?php
/**
* Description:  This includes for basic and core configurations.
* Author:       Joken Villanueva
* Date Created: october 27, 2013
* Revised By:   Joken E. Villanueva
* Revised Date: September 18, 2024  
*/

// Autoload Composer packages
require_once __DIR__ . '/../vendor/autoload.php'; 

// Load the .env file 
$dotenv = Dotenv\Dotenv::createImmutable('C:\xampp\htdocs\QUEUE\crud_private_env');// Use this if in production /var/www/private
$dotenv->load();

// Get the timezone from the environment variable
$timezone = $_ENV['APP_TIMEZONE'] ?: 'UTC'; // Fallback to 'UTC' if APP_TIMEZONE is not set
date_default_timezone_set($timezone);

// Main domain (optional if you want to restrict to a specific base domain)
$baseDomain = 'https://ssc-smis.ph';  

// Determine the protocol (HTTP or HTTPS)
$protocol = isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? 'https://' : 'http://';

// Dynamically get the current subdomain and host
$fullAppUrl = $protocol . $_SERVER['HTTP_HOST'];

// Define APP_URL dynamically
defined('APP_URL') ? null : define('APP_URL', $fullAppUrl);

// Access environment variables
$DB_SERVER = $_ENV['DB_HOST'];
$DB_USER = $_ENV['DB_USERNAME'];
$DB_PASS = $_ENV['DB_PASSWORD'];
$DB_NAME = $_ENV['DB_DATABASE'];

// Database configuration
defined('DB_SERVER') ? null : define("DB_SERVER", $DB_SERVER);
defined('DB_USER') ? null : define("DB_USER", $DB_USER);
defined('DB_PASS') ? null : define("DB_PASS", $DB_PASS);
defined('DB_NAME') ? null : define("DB_NAME", $DB_NAME);

// Define directory separator
defined('DS') ? null : define('DS', DIRECTORY_SEPARATOR);

// Define root paths
defined('SITE_ROOT') ? null : define('SITE_ROOT', $_SERVER['DOCUMENT_ROOT'].DS.'QUEUE');
defined('LIB_PATH') ? null : define('LIB_PATH', SITE_ROOT . DS . 'include');

// Define web root and server root paths
$scriptPath = str_replace(DIRECTORY_SEPARATOR, '/', __FILE__);
$docRoot = $_SERVER['DOCUMENT_ROOT'];

// Define WEB_ROOT as relative to the public directory
defined('WEB_ROOT') ? null : define('WEB_ROOT', str_replace(array($docRoot, 'config/config.php'), '', $scriptPath));

// Define SRV_ROOT as the root directory of the project
defined('SRV_ROOT') ? null : define('SRV_ROOT', dirname(__DIR__));

// Optional: Define cache and log directories
defined('CACHE_DIR') ? null : define('CACHE_DIR', SITE_ROOT . '/home/ssc-smis.ph/.cache');

// Set log file paths based on environment
$appEnv = $_ENV['APP_ENV'] ?: 'development';

if ($appEnv === 'production') {
    defined('LOG_FILE') ? null : define('LOG_FILE', '/home/ssc-smis.ph/asset.ssc-smis.ph/logs/errlogs.log');
} else {
    defined('LOG_FILE') ? null : define('LOG_FILE', 'C:/xampp/htdocs/QUEUE/system_logs/errlogs.log');
}

// Environment-specific configurations
$appDebug = getenv('APP_DEBUG') === 'true';

if ($appDebug) {
    // Development settings
    error_reporting(E_ALL);
    ini_set('display_errors', 1);  // Show errors on the screen
} else {
    // Production settings
    error_reporting(E_ALL & ~E_NOTICE & ~E_DEPRECATED & ~E_STRICT);
    ini_set('display_errors', 0);  // Hide errors from the screen
}

ini_set('log_errors', 1);  // Always log errors
ini_set('error_log', LOG_FILE);

// Session settings

// Automate the session cookie domain for multiple subdomains
$host = $_SERVER['HTTP_HOST'];

if ($host === 'localhost') {
    // Local development
    $baseDomain = 'localhost';
} elseif (preg_match('/([a-z0-9-]+\.[a-z]{2,})$/i', $host, $matches)) {
    // Extract base domain for production (e.g., .ssc-smis.ph)
    $baseDomain = '.' . $matches[1];
} else {
    // Fallback
    $baseDomain = $host;
}

ini_set('session.cookie_domain', $baseDomain);
ini_set('session.save_path', ($appEnv === 'production') ? '/tmp' : 'C:\xampp\tmp');
ini_set('session.cookie_lifetime', 0); // Session cookie (expires when the browser closes)
ini_set('session.cookie_path', '/'); // Path on the server where the cookie will be available
ini_set('session.cookie_secure', getenv('SESSION_COOKIE_SECURE') === 'true' ? 1 : 0); // Set to 1 if using HTTPS
ini_set('session.cookie_httponly', getenv('SESSION_COOKIE_HTTPONLY') === 'true' ? 1 : 0); // Prevent JavaScript access to cookies
ini_set('session.cookie_samesite', getenv('SESSION_COOKIE_SAMESITE') ?: 'Lax'); // CSRF protection
$sessionCookieName = getenv('SESSION_COOKIE_NAME') ?: 'PHPSESSID'; // Default to 'PHPSESSID' if SESSION_COOKIE_NAME is not set
ini_set('session.name', $sessionCookieName);

// Deny access to this file directly
if (basename($_SERVER['SCRIPT_FILENAME']) === 'config.php') {
    http_response_code(403); // Forbidden
    die('Access denied.');
}
?>