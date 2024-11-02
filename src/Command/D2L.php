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
        return [
            $this->argFactory->sqlplus('D2L_ORGANIZATIONAL_UNIT_ANCESTOR.sql'),
            $this->argFactory->sqlplus('D2L_ORGANIZATIONAL_UNIT.sql'),
            $this->argFactory->sqlplus('D2L_USER_ENROLLMENT.sql'),
            $this->argFactory->sqlplus('D2L_USER.sql'),
            $this->argFactory->sqlplus('D2L_OUTCOME_DETAIL.sql'),
        ];
    }
}
