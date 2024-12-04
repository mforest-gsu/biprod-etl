<?php

declare(strict_types=1);

use Gsu\Biprod\Kernel;

require_once dirname(__DIR__) . '/vendor/autoload_runtime.php';

return fn (array $context) => new Kernel(
    is_string($context['APP_ENV'] ?? null) ? $context['APP_ENV'] : 'dev',
    (bool) $context['APP_DEBUG']
);
