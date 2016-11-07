<?php
// Routes

$app->get('/[{name}]', function ($request, $response, $args) {
    // Sample log message
    $this->logger->info("Slim-Skeleton '/' route");

    error_log("-" . print_r(getenv("PHP_ENV"), 1));
    error_log("-" . print_r($_ENV, 1));
    // Render index view
    return $this->renderer->render($response, 'index.phtml', $args);
});
