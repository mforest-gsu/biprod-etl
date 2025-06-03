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
        return array_map($this->shellCmd->sqlplus(...), [
            'LMSENRL.sql',
            'LMS_ICOLLEGE_RUBRIC_PROG.sql',
            'ICOLLPRD_LMSENRL.sql',
            'ICOLLPRD_LMS_ICOLLEGE_RUBRIC_PROG.sql',
        ]);
    }
}
