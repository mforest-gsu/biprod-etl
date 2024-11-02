<?php

declare(strict_types=1);

namespace Gsu\Biprod\Factory;

final class CommandArgFactory
{
    /**
     * @param string $console
     * @param string $parDir
     * @param string $dataDir
     * @param string $sqlDir
     */
    public function __construct(
        private string $console = "./bin/console",
        private string $parDir = "./src/ETL",
        private string $dataDir = "./var/sqlldr",
        private string $sqlDir = "./src/ETL"
    ) {
    }


    /**
     * @param string $parFile
     * @return string
     */
    public function parFile(string $parFile): string
    {
        return $this->parDir . $parFile;
    }


    /**
     * @param string $dataFile
     * @return string
     */
    public function dataFile(string $dataFile): string
    {
        return $this->dataDir . $dataFile;
    }


    /**
     * @param string $sqlFile
     * @return string
     */
    public function sqlFile(string $sqlFile): string
    {
        return $this->sqlDir . $sqlFile;
    }


    /**
     * @param string $command
     * @param string[] $params
     * @return string[]
     */
    public function console(string $command, ...$params): array
    {
        return [
            $this->console,
            $command,
            ...array_merge([], ...$params)
        ];
    }


    /**
     * @param string $parFile
     * @param string $dataFile
     * @return string[]
     */
    public function sqlldr(
        string $parFile,
        string $dataFile
    ): array {
        return $this->console(
            'oracle:sqlldr',
            $this->parFile($parFile),
            $this->dataFile($dataFile)
        );
    }


    /**
     * @param string $sqlFile
     * @return string[]
     */
    public function sqlplus(string $sqlFile): array
    {
        return $this->console(
            'oracle:sqlplus',
            $this->sqlFile($sqlFile)
        );
    }
}
