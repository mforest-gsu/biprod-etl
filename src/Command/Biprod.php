<?php

declare(strict_types=1);

namespace Gsu\Biprod\Command;

use Gadget\Console\Command\ShellCommand;
use Gadget\Process\ProcessShellEnv;
use Gadget\Process\ProcessShellOutput;
use Gsu\Biprod\Command\Input\ShellCommandBuilder;
use Symfony\Component\Console\Output\OutputInterface;

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

    /**
     * @param OutputInterface $output
     * @return ProcessShellOutput
     */
    protected function getShellOutput(OutputInterface $output): ProcessShellOutput
    {
        return new ProcessShellOutput(function (string $type, string $message) use ($output): void {
            $output->writeln(sprintf("%s: %s", $type, $message));
        });
    }
}
