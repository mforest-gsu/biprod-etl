<?php

declare(strict_types=1);

namespace Gsu\Biprod\Command\Input;

final class ShellCommandBuilder
{
    /**
     * @param string $console
     * @param string $parDir
     * @param string $dataDir
     * @param string $sqlDir
     */
    public function __construct(
        private string $console = "./bin/console",
        private string $parDir = "./src/ETL/",
        private string $dataDir = "./var/sqlldr/",
        private string $sqlDir = "./src/ETL/"
    ) {
    }


    /**
     * @param string $command
     * @param string $params
     * @return string[]
     */
    public function console(
        string $command,
        ...$params
    ): array {
        return [
            $this->console,
            $command,
            ...$params
        ];
    }


    /**
     * @param string $dataFile
     * @param string $params
     * @return string[]
     */
    public function createSSOUserFile(
        string $dataFile,
        ...$params
    ): array {
        return $this->console(
            'biprod:create-ssouser-file',
            $this->dataFile($dataFile),
            ...$params
        );
    }


    /**
     * @param string $parFile
     * @param string $dataFile
     * @param string $params
     * @return string[]
     */
    public function sqlldr(
        string $parFile,
        string $dataFile,
        ...$params
    ): array {
        return $this->console(
            'oracle:sqlldr',
            '--parfile=' . $this->parFile($parFile),
            '--data=' . $this->dataFile($dataFile),
            ...$params
        );
    }


    /**
     * @param string $sqlFile
     * @param string $params
     * @return string[]
     */
    public function sqlplus(
        string $sqlFile,
        ...$params,
    ): array {
        return $this->console(
            'oracle:sqlplus',
            '--F',
            '--L',
            '--S',
            $this->sqlFile($sqlFile),
            ...$params
        );
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
}
