<?php

declare(strict_types=1);

namespace Gsu\Biprod\Command;

use Gadget\Console\Command\Command;
use Gadget\Io\FileStream;
use Gadget\Ldap\Connection;
use Gadget\Ldap\Query;
use Gsu\Biprod\Entity\SSOUser;
use Symfony\Component\Console\Attribute\AsCommand;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;

#[AsCommand('biprod:create-ssouser-file')]
final class CreateSSOUserFile extends Command
{
    /** @var string $base */
    private string $base;

    /** @var list<string> $filter */
    private array $filter;

    /** @var list<string> $attributes */
    private array $attributes;


    /**
     * @param Connection $ldapConnection
     */
    public function __construct(private Connection $ldapConnection)
    {
        parent::__construct();

        $this->base = 'OU=People,OU=Org,DC=gsuad,DC=gsu,DC=edu';

        $this->filter = [
            '(&',
            '(objectClass=User)', // Is a User object
            '(userAccountControl:1.2.840.113556.1.4.803:=512)', // Is a normal account
            '(mail=*)', // Has an email address
            '(givenName=*)', // Has a first name
            '(sn=*)', // Has a last name
            ')'
        ];

        $this->attributes = [
            'sAMAccountName',        // campus id
            'userAccountControl',    // account status
            'memberOf',              // affiliation
            'mail',                  // email address
            'givenName',             // first name
            'sn',                    // last name
            'whenCreated',           // create date
            'whenChanged',           // update date
            'pwdLastSet',            // password changed date
        ];
    }


    /** @inheritdoc */
    protected function configure(): void
    {
        $this->addArgument('data_file', InputArgument::REQUIRED);
    }


    /** @inheritdoc */
    protected function execute(
        InputInterface $input,
        OutputInterface $output
    ): int {
        /** @var string $dataFilePath */
        $dataFilePath = $input->getArgument('data_file');
        $dataFile = new FileStream($dataFilePath, 'w');
        $recordCount = 0;

        try {
            $dataFile->open();

            $results = $this->ldapConnection->query(
                new Query(
                    $this->base,
                    $this->filter,
                    $this->attributes,
                    1000
                ),
                SSOUser::create(...)
            );

            foreach ($results as $ssoUser) {
                $dataFile->writeCsvRow(
                    fields: $ssoUser->createDataRow(),
                    separator: ",",
                    enclosure: '"',
                    escape: "\\",
                    eol: PHP_EOL
                );
                $recordCount++;
            }

            $this->info("{$recordCount} users fetched");
        } finally {
            $dataFile->close();
        }

        return self::SUCCESS;
    }
}
