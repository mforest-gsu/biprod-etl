TRUNCATE TABLE SKILL_ASSESSMENT;

INSERT INTO SKILL_ASSESSMENT
  (
    SKILL_ASSESSMENT_ID,
    SKILL_ASSESSMENT_DETAIL_ID,
    SKILL_ASSESSMENT_OWNER_ID,
    SKILL_ASSESSMENT_DESCRIPTION,
    SKILL_ASSESSMENT_PARENT_ID,
    SKILL_ASSESSMENT_ORGUNIT_ID,
    SKILL_ASSESSMENT_ORGUNIT_TYPE,
    SKILL_ASSESSMENT_ORGUNIT_CODE,
    SKILL_ASSESSMENT_ORGUNIT_NAME,
    SKILL_ASSESSMENT_PROGRAM_ID,
    SKILL_ASSESSMENT_PROGRAM_NAME,
    SKILL_ASSESSMENT_DETAIL_SOURCE,
    SKILL_ASSESSMENT_DATE,
    SKILL_ASSESSMENT_ASSESSED_USER_ID,
    SKILL_ASSESSMENT_ASSESSOR_USER_ID,
    SKILL_ASSESSMENT_ALIGNED_OBJECT_TYPE,
    SKILL_ASSESSMENT_ALIGNED_OBJECT_ID,
    SKILL_ASSESSMENT_LEVEL_ID,
    SKILL_ASSESSMENT_LEVEL_NAME,
    SKILL_ASSESSMENT_LEVEL_VALUE
  )
SELECT
  OutcomeDemonstration.DemonstrationId AS SKILL_ASSESSMENT_ID,
  SKILL_DETAIL_ID                      AS SKILL_ASSESSMENT_DETAIL_ID,
  SKILL_DETAIL_OWNER_ID                AS SKILL_ASSESSMENT_OWNER_ID,
  SKILL_DETAIL_DESCRIPTION             AS SKILL_ASSESSMENT_DESCRIPTION,
  SKILL_DETAIL_PARENT_ID               AS SKILL_ASSESSMENT_PARENT_ID,
  SKILL_DETAIL_ORGUNIT_ID              AS SKILL_ASSESSMENT_ORGUNIT_ID,
  SKILL_DETAIL_ORGUNIT_TYPE            AS SKILL_ASSESSMENT_ORGUNIT_TYPE,
  SKILL_DETAIL_ORGUNIT_CODE            AS SKILL_ASSESSMENT_ORGUNIT_CODE,
  SKILL_DETAIL_ORGUNIT_NAME            AS SKILL_ASSESSMENT_ORGUNIT_NAME,
  SKILL_DETAIL_PROGRAM_ID              AS SKILL_ASSESSMENT_PROGRAM_ID,
  SKILL_DETAIL_PROGRAM_NAME            AS SKILL_ASSESSMENT_PROGRAM_NAME,
  SKILL_DETAIL_SOURCE                  AS SKILL_ASSESSMENT_DETAIL_SOURCE,
  OutcomeDemonstration.AssessedDate    AS SKILL_ASSESSMENT_DATE,
  OutcomeDemonstration.AssessedUserId  AS SKILL_ASSESSMENT_ASSESSED_USER_ID,
  OutcomeDemonstration.AssessorUserId  AS SKILL_ASSESSMENT_ASSESSOR_USER_ID,
  CASE OutcomeDemonstration.AlignedObjectType
    WHEN 1 THEN 'Discussion'
    WHEN 2 THEN 'Assignment'
    WHEN 3 THEN 'Quiz'
  END AS SKILL_ASSESSMENT_ALIGNED_OBJECT_TYPE,
  OutcomeDemonstration.AlignedObjectId AS SKILL_ASSESSMENT_ALIGNED_OBJECT_ID,
  SKILL_LEVEL_ID                       AS SKILL_ASSESSMENT_LEVEL_ID,
  SKILL_LEVEL_NAME                     AS SKILL_ASSESSMENT_LEVEL_NAME,
  SKILL_LEVEL_PCTSTART                 AS SKILL_ASSESSMENT_LEVEL_VALUE
FROM
  D2L_OUTCOMES_DEMONSTRATION OutcomeDemonstration,
  SKILL_DETAIL SkillDetail,
  SKILL_LEVEL SkillLevel
WHERE
  OutcomeDemonstration.AssessedDate IS NOT NULL AND
  OutcomeDemonstration.AssessedUserId IS NOT NULL AND
  OutcomeDemonstration.AssessorUserId IS NOT NULL AND
  OutcomeDemonstration.AlignedObjectType in (1, 2, 3, 5) AND
  OutcomeDemonstration.AlignedObjectId IS NOT NULL AND
  OutcomeDemonstration.ExplicitlyEnteredScaleLevelId IS NOT NULL AND
  SKILL_DETAIL_ID = OutcomeDemonstration.OutcomeId AND
  SKILL_DETAIL_OWNER_ID = OutcomeDemonstration.RegistryId AND
  SKILL_LEVEL_ID = OutcomeDemonstration.ExplicitlyEnteredScaleLevelId
;

COMMIT;

QUIT;
