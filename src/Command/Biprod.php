<?php

declare(strict_types=1);

namespace Gsu\Biprod\Command;

use Gadget\Console\Command\ShellCommand;
use Gadget\Console\Shell\ProcessShellEnv;
use Gsu\Biprod\Command\Input\ShellCommandBuilder;

abstract class Biprod extends ShellCommand
{
    /**
     * @param ShellCommandBuilder $shellCmd
     * @param ProcessShellEnv $shellEnv
     * @param bool $throwOnError
     * @param string|null $name
     */
    public function __construct(
        protected ShellCommandBuilder $shellCmd,
        ProcessShellEnv $shellEnv,
        bool $throwOnError = true,
        string|null $name = null
    ) {
        parent::__construct($shellEnv, $throwOnError, $name);
    }
}
