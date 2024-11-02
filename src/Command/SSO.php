<?php

declare(strict_types=1);

namespace Gsu\Biprod\Command;

use Symfony\Component\Console\Attribute\AsCommand;
use Symfony\Component\Console\Input\InputInterface;

#[AsCommand('biprod:sso')]
final class SSO extends Biprod
{
    /** @inheritdoc */
    protected function getShellArgs(InputInterface $input): array
    {
        return [
            $this->argFactory->console(
                'biprod:create-ssouser-file',
                $this->argFactory->dataFile('SSOUSER.dat')
            ),
            $this->argFactory->sqlldr(
                'SSOUSER.par',
                'SSOUSER.dat'
            ),
            $this->argFactory->sqlplus('SSOUSER.sql')
        ];
    }
}
