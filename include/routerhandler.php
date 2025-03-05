<?php
class RouteHandler {
    private array $routes; // Predefined routes
    private array $params = []; // Parameters from query string
    private string $defaultRoute; // Default route for fallback
    private array $dynamicParamConfig; // Config for dynamic parameter names

    /**
     * Constructor to initialize routes, default route, and dynamic param configuration.
     *
     * @param array $routes List of allowed routes.
     * @param string $defaultRoute Default route name.
     * @param array $dynamicParamConfig Configuration for dynamic parameter names per route.
     */
    public function __construct(array $routes, string $defaultRoute = 'list', array $dynamicParamConfig = []) {
        $this->routes = $routes;
        $this->defaultRoute = $defaultRoute;

        // Normalize dynamic param configuration for grouped routes
        $this->dynamicParamConfig = $this->normalizeConfig($dynamicParamConfig);
    }

    /**
     * Normalize grouped configuration into individual route mappings.
     *
     * @param array $config Grouped parameter configurations.
     * @return array Normalized route-specific parameter mappings.
     */
    private function normalizeConfig(array $config): array {
        $normalized = [];
        foreach ($config as $routes => $params) {
            $routeArray = is_string($routes) ? explode(',', $routes) : (array) $routes;
            foreach ($routeArray as $route) {
                $normalized[trim($route)] = $params;
            }
        }
        return $normalized;
    }

    /**
     * Extract route and parameters from URI.
     *
     * @return array Query string segments.
     */
    private function getRouteFromUri(): array {
        // Get the query string from the URL
        $queryString = $_SERVER['QUERY_STRING'] ?? '';

        // Split query string into parts based on `&`
        $segments = explode('&', $queryString);

        // Remove empty values (in case of trailing `&`)
        $segments = array_filter($segments);

        return array_values($segments); // Reset keys to ensure indexed array
    }

    /**
     * Handle the incoming route and parameters.
     *
     * @return string|null Route content or null if invalid.
     */
    public function handleRouteAndContent(): ?string {
        // Extract query string components
        $queryString = $this->getRouteFromUri();

        // Determine the route
        $route = $this->sanitize($queryString[0] ?? $this->defaultRoute);
        $this->params['route'] = $route;

        // Retrieve the parameter configuration for the route
        $paramNames = $this->dynamicParamConfig[$route] ?? []; // Default to empty array if no config

        // Assign sanitized parameters only if names exist in configuration
        for ($i = 1; $i < count($queryString) && $i - 1 < count($paramNames); $i++) {
            $key = $paramNames[$i - 1]; // Use configured parameter name
            $this->params[$key] = $this->sanitize($queryString[$i]);
        }

        // Check if the route is valid
        if (array_key_exists($route, $this->routes)) {
            return $this->routes[$route];
        } else {
            $this->handleInvalidRoute();
            return null;
        }
    }

    /**
     * Handle invalid routes by redirecting to the 404 page.
     */
    private function handleInvalidRoute(): void {
        header("Location: ".WEB_ROOT."error_pages/404", true, 302);
        exit();
    }

    /**
     * Get a parameter value by its key.
     *
     * @param string $key Parameter key.
     * @return mixed|null Parameter value or null if not found.
     */
    public function get(string $key) {
        return $this->params[$key] ?? null;
    }

    /**
     * Add parameters to $_GET for compatibility.
     */
    public function addToGet(): void {
        foreach ($this->params as $key => $value) {
            if ($value !== null) {
                $_GET[$key] = $value;
            }
        }
    }

    /**
     * Return all parameters.
     *
     * @return array All parameters.
     */
    public function getAll(): array {
        return $this->params;
    }

    /**
     * Sanitize input to prevent malicious input.
     *
     * @param mixed $input The input to sanitize.
     * @return string Sanitized string.
     */
    private function sanitize($input): string {
        return htmlspecialchars(trim($input), ENT_QUOTES, 'UTF-8');
    }
}
?>