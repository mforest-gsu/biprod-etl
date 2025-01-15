<?php

declare(strict_types=1);

namespace Gsu\Biprod\Command;

use Gadget\Console\Command\Command;
use Gadget\Io\FileStream;
use Symfony\Component\Console\Attribute\AsCommand;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;

#[AsCommand('biprod:create-syllabus-verify-file')]
final class CreateSyllabusVerifyFile extends Command
{
    /**
     * @param \PDO $pdo
     */
    public function __construct(private \PDO $pdo)
    {
        parent::__construct();
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

            foreach ($this->getVerifyRecords() as $record) {
                $dataFile->writeCsvRow(
                    fields: $record,
                    separator: ",",
                    enclosure: '"',
                    escape: "\\",
                    eol: PHP_EOL
                );
                $recordCount++;
            }

            $this->info("{$recordCount} records fetched");
        } finally {
            $dataFile->close();
        }

        return self::SUCCESS;
    }


    /**
     * @return iterable<int, array<string,string>>
     */
    private function getVerifyRecords(): iterable
    {
        $rowIndex = 0;
        $stmt = $this->pdo->query("
            SELECT
                id as SeqNum,
                TermCode,
                TermDescription,
                CollegeCode,
                CollegeDescription,
                DepartmentCode,
                DepartmentDescription,
                CRN,  
                SubjectCode,
                CourseNumber,
                SequenceNumber,
                CourseTitle,
                InstructorFirstName,
                InstructorLastName,
                InstructorEmail,
                VerifyStatus,
                VerifyDate,
                VerifyUser
            FROM
                CETLOE.CoreImpactsCourseSection
        ");
        if ($stmt === false) {
            throw new \RuntimeException();
        }

        while (true) {
            /** @var array<string,mixed>|false $row */
            $row = $stmt->fetch(\PDO::FETCH_ASSOC);
            if (!is_array($row)) {
                break;
            }
            yield ++$rowIndex => array_map(fn (mixed $v) => is_scalar($v) ? strval($v) : '', $row);
        }
    }
}
