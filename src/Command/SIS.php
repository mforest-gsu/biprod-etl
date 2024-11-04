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
        return array_map($this->shellCmd->sqlplus(...), [
           'SISTERM.sql',
           'SISSECT.sql',
           'SISUSER.sql',
           'BNR_STVCODE.sql',
           'BNR_GORPRAC.sql',
           'BNR_SGBSTDN.sql',
        ]);
    }
}
