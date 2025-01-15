<?php

declare(strict_types=1);

namespace Gsu\Biprod\Command;

use Symfony\Component\Console\Attribute\AsCommand;
use Symfony\Component\Console\Input\InputInterface;

#[AsCommand('biprod:SyllabusVerify')]
final class SyllabusVerify extends Biprod
{
    /** @inheritdoc */
    protected function getShellArgs(InputInterface $input): array
    {
        return [
            $this->shellCmd->console(
                'biprod:create-syllabus-verify-file',
                $this->shellCmd->dataFile('GSU_SYLLABUS_VERIFICATION.dat')
            ),
            $this->shellCmd->sqlldr('GSU_SYLLABUS_VERIFICATION.par', 'GSU_SYLLABUS_VERIFICATION.dat'),
            $this->shellCmd->sqlplus('GSU_SYLLABUS_VERIFICATION.sql')
        ];
    }
}
