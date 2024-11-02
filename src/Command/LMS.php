<?php

declare(strict_types=1);

namespace Gsu\Biprod\Command;

use Symfony\Component\Console\Attribute\AsCommand;
use Symfony\Component\Console\Input\InputInterface;

#[AsCommand('biprod:lms')]
final class LMS extends Biprod
{
    /** @inheritdoc */
    protected function getShellArgs(InputInterface $input): array
    {
        return [
            $this->argFactory->sqlplus('LMSENRL.sql'),
            $this->argFactory->sqlplus('LMS_ICOLLEGE_RUBRIC_PROG.sql'),
        ];
    }
}
