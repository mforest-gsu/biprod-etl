DROP TABLE SISUSER_LOG;
DROP SEQUENCE SISUSER_LOG_SEQ;

CREATE SEQUENCE SISUSER_LOG_SEQ;
CREATE TABLE SISUSER_LOG (
  SISUSER_LOG_SEQ NUMBER(20) NOT NULL,
  SISUSER_LOG_TIMESTAMP TIMESTAMP WITH LOCAL TIME ZONE NOT NULL, 
  SISUSER_LOG_ACTION CHAR(1) NOT NULL,
  SISUSER_CAMPUS_ID VARCHAR2(30 CHAR) DEFAULT NULL,
  SISUSER_GSU_EMAIL VARCHAR2(128 CHAR) DEFAULT NULL,
  SISUSER_FSEM_EMAIL VARCHAR2(128 CHAR) DEFAULT NULL,
  SISUSER_FIRST_NAME VARCHAR2(128 CHAR) DEFAULT NULL,
  SISUSER_LAST_NAME VARCHAR2(128 CHAR) DEFAULT NULL,
  SISUSER_PIDM NUMBER(8,0) DEFAULT NULL,
  SISUSER_PANTHER_ID VARCHAR2(9 CHAR) DEFAULT NULL,
  SISUSER_SOURCED_ID VARCHAR2(16 CHAR) DEFAULT NULL,
  SISUSER_ORG_DEFINED_ID VARCHAR2(20 CHAR) DEFAULT NULL,
  SISUSER_ACTIVITY_DATE DATE DEFAULT NULL,
  SISUSER_CREATE_DATE DATE DEFAULT NULL,
  SISUSER_UPDATE_DATE DATE DEFAULT NULL
);

CREATE UNIQUE INDEX PUK_SISUSER_LOG_SEQ ON SISUSER_LOG (SISUSER_LOG_SEQ);
CREATE INDEX IDX_SISUSER_LOG_TIMESTAMP ON SISUSER_LOG (SISUSER_LOG_TIMESTAMP);
CREATE INDEX IDX_SISUSER_LOG_CAMPUS_ID ON SISUSER_LOG (SISUSER_CAMPUS_ID);
CREATE INDEX IDX_SISUSER_LOG_GSU_EMAIL ON SISUSER_LOG (SISUSER_GSU_EMAIL);
CREATE INDEX IDX_SISUSER_LOG_FSEM_EMAIL ON SISUSER_LOG (SISUSER_FSEM_EMAIL);
CREATE INDEX IDX_SISUSER_LOG_LAST_FIRST_NAME ON SISUSER_LOG (SISUSER_LAST_NAME, SISUSER_FIRST_NAME);
CREATE INDEX IDX_SISUSER_LOG_PIDM ON SISUSER_LOG (SISUSER_PIDM);
CREATE INDEX IDX_SISUSER_LOG_PANTHER_ID ON SISUSER_LOG (SISUSER_PANTHER_ID);
CREATE INDEX IDX_SISUSER_LOG_SOURCED_ID ON SISUSER_LOG (SISUSER_SOURCED_ID);
CREATE INDEX IDX_SISUSER_LOG_ORG_DEFINED_ID ON SISUSER_LOG (SISUSER_ORG_DEFINED_ID);
CREATE INDEX IDX_SISUSER_LOG_ACTIVITY_DATE ON SISUSER_LOG (SISUSER_ACTIVITY_DATE);
CREATE INDEX IDX_SISUSER_LOG_CREATE_DATE ON SISUSER_LOG (SISUSER_CREATE_DATE);
CREATE INDEX IDX_SISUSER_LOG_UPDATE_DATE ON SISUSER_LOG (SISUSER_UPDATE_DATE);
CREATE BITMAP INDEX IDX_SISUSER_LOG_ACTION ON SISUSER_LOG (SISUSER_LOG_ACTION);

QUIT;
