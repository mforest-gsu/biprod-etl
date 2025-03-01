DROP TABLE SKILL_DETAIL;

CREATE TABLE SKILL_DETAIL (
  SKILL_DETAIL_ID VARCHAR2(36 CHAR) NOT NULL,
  SKILL_DETAIL_OWNER_ID VARCHAR2(36 CHAR) NOT NULL,
  SKILL_DETAIL_DESCRIPTION VARCHAR2(512 CHAR) NOT NULL,
  SKILL_DETAIL_PARENT_ID VARCHAR2(36 CHAR) DEFAULT NULL,
  SKILL_DETAIL_ORGUNIT_ID NUMBER(10) DEFAULT NULL,
  SKILL_DETAIL_ORGUNIT_TYPE NVARCHAR2(100) DEFAULT NULL,
  SKILL_DETAIL_ORGUNIT_CODE NVARCHAR2(100) DEFAULT NULL,
  SKILL_DETAIL_ORGUNIT_NAME NVARCHAR2(256) DEFAULT NULL,
  SKILL_DETAIL_PROGRAM_ID NUMBER(20) DEFAULT NULL,
  SKILL_DETAIL_PROGRAM_NAME VARCHAR2(200 CHAR) DEFAULT NULL,
  SKILL_DETAIL_SOURCE VARCHAR2(8 CHAR) DEFAULT NULL
);

CREATE UNIQUE INDEX PUK_SKILL_DETAIL ON SKILL_DETAIL (SKILL_DETAIL_ID, SKILL_DETAIL_OWNER_ID);
CREATE INDEX IDX_SKILL_DETAIL_OWNER_ID ON SKILL_DETAIL (SKILL_DETAIL_OWNER_ID);
CREATE INDEX IDX_SKILL_DETAIL_PARENT_ID ON SKILL_DETAIL (SKILL_DETAIL_PARENT_ID);
CREATE INDEX IDX_SKILL_DETAIL_ORGUNIT_ID ON SKILL_DETAIL (SKILL_DETAIL_ORGUNIT_ID);
CREATE BITMAP INDEX IDX_SKILL_DETAIL_ORGUNIT_TYPE ON SKILL_DETAIL(SKILL_DETAIL_ORGUNIT_TYPE);
CREATE INDEX IDX_SKILL_DETAIL_ORGUNIT_CODE ON SKILL_DETAIL (SKILL_DETAIL_ORGUNIT_CODE);
CREATE INDEX IDX_SKILL_DETAIL_PROGRAM_ID ON SKILL_DETAIL (SKILL_DETAIL_PROGRAM_ID);
CREATE BITMAP INDEX IDX_SKILL_DETAIL_SOURCE ON SKILL_DETAIL (SKILL_DETAIL_SOURCE);

QUIT;
