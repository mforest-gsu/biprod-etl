DROP TABLE SKILL_ANCESTOR;

CREATE TABLE SKILL_ANCESTOR (
  SKILL_ANCESTOR_DETAIL_ID VARCHAR2(36 CHAR) NOT NULL,
  SKILL_ANCESTOR_DETAIL_DESC VARCHAR2(512 CHAR) NOT NULL,
  SKILL_ANCESTOR_PARENT1_ID VARCHAR2(36 CHAR) DEFAULT NULL,
  SKILL_ANCESTOR_PARENT1_DESC VARCHAR2(512 CHAR) DEFAULT NULL,
  SKILL_ANCESTOR_PARENT2_ID VARCHAR2(36 CHAR) DEFAULT NULL,
  SKILL_ANCESTOR_PARENT2_DESC VARCHAR2(512 CHAR) DEFAULT NULL,
  SKILL_ANCESTOR_PARENT3_ID VARCHAR2(36 CHAR) DEFAULT NULL,
  SKILL_ANCESTOR_PARENT3_DESC VARCHAR2(512 CHAR) DEFAULT NULL,
  SKILL_ANCESTOR_PARENT4_ID VARCHAR2(36 CHAR) DEFAULT NULL,
  SKILL_ANCESTOR_PARENT4_DESC VARCHAR2(512 CHAR) DEFAULT NULL,
  SKILL_ANCESTOR_PARENT5_ID VARCHAR2(36 CHAR) DEFAULT NULL,
  SKILL_ANCESTOR_PARENT5_DESC VARCHAR2(512 CHAR) DEFAULT NULL
);

CREATE UNIQUE INDEX PUK_SKILL_ANCESTOR ON SKILL_ANCESTOR (SKILL_ANCESTOR_DETAIL_ID);
CREATE INDEX IDX_SKILL_ANCESTOR_PARENT1_ID ON SKILL_ANCESTOR (SKILL_ANCESTOR_PARENT1_ID);
CREATE INDEX IDX_SKILL_ANCESTOR_PARENT2_ID ON SKILL_ANCESTOR (SKILL_ANCESTOR_PARENT2_ID);
CREATE INDEX IDX_SKILL_ANCESTOR_PARENT3_ID ON SKILL_ANCESTOR (SKILL_ANCESTOR_PARENT3_ID);
CREATE INDEX IDX_SKILL_ANCESTOR_PARENT4_ID ON SKILL_ANCESTOR (SKILL_ANCESTOR_PARENT4_ID);
CREATE INDEX IDX_SKILL_ANCESTOR_PARENT5_ID ON SKILL_ANCESTOR (SKILL_ANCESTOR_PARENT5_ID);

QUIT;
