<?php

declare(strict_types=1);

namespace Gsu\Biprod\Command;

use Symfony\Component\Console\Attribute\AsCommand;
use Symfony\Component\Console\Input\InputInterface;

#[AsCommand('biprod:d2l')]
final class D2L extends Biprod
{
    /** @inheritdoc */
    protected function getShellArgs(InputInterface $input): array
    {
        return array_map($this->shellCmd->sqlplus(...), [
            'D2L_ORGANIZATIONAL_UNIT_ANCESTOR.sql',
            'D2L_ORGANIZATIONAL_UNIT.sql',
            'D2L_USER_ENROLLMENT.sql',
            'D2L_USER.sql',
            'D2L_OUTCOME_DETAIL.sql',
        ]);
    }
}
