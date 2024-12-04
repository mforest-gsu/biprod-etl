<?php

declare(strict_types=1);

namespace Gsu\Biprod\Entity;

use Gadget\Io\Cast;
use Gadget\Ldap\DateFormat;

final class SSOUser
{
    /**
     * @param mixed $values
     * @return self
     */
    public static function create(mixed $values): self
    {
        $values = Cast::toArray($values);
        $memberOf = Cast::toString($values['memberOf'] ?? '');
        return new self(
            campusId: Cast::toString($values['sAMAccountName'] ?? ''),
            emailAddress: Cast::toString($values['mail'] ?? ''),
            firstName: Cast::toString($values['givenName'] ?? ''),
            lastName: Cast::toString($values['sn'] ?? ''),
            affiliations: array_keys(array_filter(
                SSOUser::$AFFILIATIONS,
                fn(string $group): bool => str_contains($memberOf, $group)
            )),
            accountStatus: Cast::toInt($values['userAccountControl'] ?? 0),
            createDate: DateFormat::formatUTCTimestamp(Cast::toInt($values['whenCreated'] ?? 0)),
            updateDate: DateFormat::formatUTCTimestamp(Cast::toInt($values['whenChanged'] ?? 0)),
            pwdLastSet: DateFormat::formatTimeInterval(Cast::toInt($values['pwdLastSet'] ?? 0))
        );
    }


    /** @var array<string,string> $AFFILIATIONS */
    public static array $AFFILIATIONS = [
        'Faculty' => 'CN=EG-AFF-Faculty,OU=Groups,OU=Org,DC=gsuad,DC=gsu,DC=edu',
        'Staff' => 'CN=EG-AFF-Staff,OU=Groups,OU=Org,DC=gsuad,DC=gsu,DC=edu',
        'Student' => 'CN=EG-AFF-Student,OU=Groups,OU=Org,DC=gsuad,DC=gsu,DC=edu',
        'Affiliate' => 'CN=EG-AFF-Affiliate,OU=Large,OU=Groups,OU=Org,DC=gsuad,DC=gsu,DC=edu',
        'Retiree' => 'CN=EG-AFF-Retiree,OU=Groups,OU=Org,DC=gsuad,DC=gsu,DC=edu',
    ];


    /**
     * @param string $campusId
     * @param string $emailAddress
     * @param string $firstName
     * @param string $lastName
     * @param string[] $affiliations
     * @param int $accountStatus
     * @param \DateTimeInterface $createDate
     * @param \DateTimeInterface $updateDate
     * @param \DateTimeInterface|null $pwdLastSet
     */
    public function __construct(
        public string $campusId,
        public string $emailAddress,
        public string $firstName,
        public string $lastName,
        public array $affiliations,
        public int $accountStatus,
        public \DateTimeInterface $createDate,
        public \DateTimeInterface $updateDate,
        public \DateTimeInterface|null $pwdLastSet
    ) {
        sort($this->affiliations);
    }


    /**
     * @return array<string,SSOUserStatus>
     */
    public function getStatus(): array
    {
        $statuses = [];
        foreach (SSOUserStatus::cases() as $status) {
            if (($this->accountStatus & $status->value) === $status->value) {
                $statuses[$status->name] = $status;
            }
        }
        return $statuses;
    }


    /**
     * @return array<string,string>
     */
    public function createDataRow(): array
    {
        $accountStatus = $this->getStatus();
        return [
            'SSOUSER_CAMPUS_ID'        => $this->campusId,
            'SSOUSER_EMAIL_ADDRESS'    => $this->emailAddress,
            'SSOUSER_FIRST_NAME'       => $this->firstName,
            'SSOUSER_LAST_NAME'        => $this->lastName,
            'SSOUSER_ACCOUNT_STATUS'   => implode(',', array_keys($accountStatus)),
            'SSOUSER_ACCOUNT_DISABLED' => isset($accountStatus["ACCOUNTDISABLE"]) ? '1' : '0',
            'SSOUSER_AFFILIATIONS'     => implode(',', $this->affiliations),
            'SSOUSER_IS_FACULTY'       => in_array("Faculty", $this->affiliations, true) ? '1' : '0',
            'SSOUSER_IS_STAFF'         => in_array("Staff", $this->affiliations, true) ? '1' : '0',
            'SSOUSER_IS_STUDENT'       => in_array("Student", $this->affiliations, true) ? '1' : '0',
            'SSOUSER_IS_AFFILIATE'     => in_array("Affiliate", $this->affiliations, true) ? '1' : '0',
            'SSOSUER_IS_RETIREE'       => in_array("Retiree", $this->affiliations, true) ? '1' : '0',
            'SSOUSER_CREATE_DATE'      => $this->createDate->format('Y-m-d H:i:s'),
            'SSOUSER_UPDATE_DATE'      => $this->updateDate->format('Y-m-d H:i:s'),
            'SSOUSER_PWD_LAST_SET'     => $this->pwdLastSet?->format('Y-m-d H:i:s') ?? ''
        ];
    }
}
