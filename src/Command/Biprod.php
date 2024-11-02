<?php

declare(strict_types=1);

namespace Gsu\Biprod\Command;

use Gadget\Console\Command\ShellCommand;
use Gadget\Console\Shell\ProcessShellEnv;
use Gsu\Biprod\Factory\CommandArgFactory;

abstract class Biprod extends ShellCommand
{
    /**
     * @param ProcessShellEnv $shellEnv
     * @param bool $throwOnError
     * @param string|null $name
     */
    public function __construct(
        protected CommandArgFactory $argFactory,
        ProcessShellEnv $shellEnv,
        bool $throwOnError = true,
        string|null $name = null
    ) {
        parent::__construct($shellEnv, $throwOnError, $name);
    }
}
