<?php

declare(strict_types=1);

namespace Gsu\Biprod\Command;

use Symfony\Component\Console\Attribute\AsCommand;
use Symfony\Component\Console\Input\InputInterface;

#[AsCommand('biprod:sis')]
final class SIS extends Biprod
{
    /** @inheritdoc */
    protected function getShellArgs(InputInterface $input): array
    {
        return [
           $this->argFactory->sqlplus('SISTERM.sql'),
           $this->argFactory->sqlplus('SISSECT.sql'),
           $this->argFactory->sqlplus('SISUSER.sql'),
           $this->argFactory->sqlplus('BNR_STVCODE.sql'),
           $this->argFactory->sqlplus('BNR_GORPRAC.sql'),
           $this->argFactory->sqlplus('BNR_SGBSTDN.sql'),
        ];
    }
}
