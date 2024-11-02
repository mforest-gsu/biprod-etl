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
        return [
            $this->argFactory->sqlplus('SKILL_OWNER.sql'),
            $this->argFactory->sqlplus('SKILL_LEVEL.sql'),
            $this->argFactory->sqlplus('SKILL_DETAIL.sql'),
            $this->argFactory->sqlplus('SKILL_ASSESSMENT.sql'),
        ];
    }
}
