<?php 
class Router {
    private array $routes;

    public function __construct() {
        $this->routes = [];
    }

    /**
     * Add a route to the router.
     *
     * @param string $action The action name.
     * @param callable $callback The callback function to execute.
     */
    public function addRoute(string $action, callable $callback): void {
        $this->routes[$action] = $callback;
    }

    /**
     * Handle the current request.
     */
    public function handle(): void {
        $method = $_SERVER['REQUEST_METHOD'];

        // Determine the action based on the method
        if ($method === 'POST') {
            $action = $_POST['route'] ?? ''; // Use 'route' parameter for POST
        } elseif ($method === 'GET') {
            $queryStringKeys = array_keys($_GET);
            $action = $queryStringKeys[0] ?? ''; // Use the first key as the action for GET
        } else {
            $this->handleInvalidRoute('');
            return;
        }

        // Check if the action exists in the routes
        if (isset($this->routes[$action])) {
            call_user_func($this->routes[$action]);
        } else {
            $this->handleInvalidRoute($action);
        }
    }

    /**
     * Handle invalid routes.
     *
     * @param string $action The invalid action.
     */
    
    private function handleInvalidRoute(string $action): void {
        if ($this->isAjaxRequest()) {
            // Return JSON response for AJAX
            http_response_code(404);
            echo json_encode(['status' => 404, 'message' => 'Route not found']);
        } else {
            // Redirect for normal requests
            header("Location: ../../error_pages/404.html", true, 302);
        }
        exit();
    }

    /**
     * Check if the request is an AJAX request.
     *
     * @return bool
     */
    private function isAjaxRequest(): bool {
        return !empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) === 'xmlhttprequest';
    }
}
?>
