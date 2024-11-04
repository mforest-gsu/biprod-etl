<?php

declare(strict_types=1);

namespace Gsu\Biprod\Command;

use Symfony\Component\Console\Attribute\AsCommand;
use Symfony\Component\Console\Input\InputInterface;

#[AsCommand('biprod:skill')]
final class Skill extends Biprod
{
    /** @inheritdoc */
    protected function getShellArgs(InputInterface $input): array
    {
        return array_map($this->shellCmd->sqlplus(...), [
            'SKILL_OWNER.sql',
            'SKILL_LEVEL.sql',
            'SKILL_DETAIL.sql',
            'SKILL_ASSESSMENT.sql',
        ]);
    }
}
